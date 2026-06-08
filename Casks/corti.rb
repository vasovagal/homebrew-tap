cask "corti" do
  version "0.1.0"
  sha256 "27e7eb83218ee21d28596495eaa466801a66cd6ad2b5ee43a594fd4e5ab5d414"

  url "https://github.com/vasovagal/corti/releases/download/v0.1.0/Corti_0.1.0_aarch64.dmg"
  name "Corti"
  desc "Menu-bar app that auto-records meetings and files transcript notes to vagus"
  homepage "https://github.com/vasovagal/corti"

  # Apple Silicon only; support latest macOS + one back (ADR 0002). minimumSystemVersion is 15.0, so the
  # per-major Homebrew gate ">= :sequoia" (15.x) lines up exactly with the bundle's LSMinimumSystemVersion
  # (see the tap README / ADR 0006).
  depends_on macos: ">= :sequoia"
  depends_on arch: :arm64

  app "Corti.app"

  # UNSIGNED (ad-hoc) build: strip the quarantine xattr so Gatekeeper doesn't force the "Open Anyway" dance
  # on first launch. macOS still prompts for Microphone + System Audio Recording on first run — and again
  # after each update, because the ad-hoc cdhash changes every release (see ADR 0006).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/Corti.app"],
                   sudo: false
  end

  zap trash: [
    "~/.local/share/corti",
    "~/Library/Application Support/com.vasovagal.corti",
    "~/Library/Caches/com.vasovagal.corti",
    "~/Library/Caches/corti",
    "~/Library/HTTPStorages/com.vasovagal.corti",
    "~/Library/Preferences/com.vasovagal.corti.plist",
    "~/Library/Saved Application State/com.vasovagal.corti.savedState",
    "~/Library/WebKit/com.vasovagal.corti",
  ]
end

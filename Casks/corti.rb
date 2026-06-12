cask "corti" do
  version "0.5.0"
  sha256 "c48c1363c91ac4d5902caa65be9c81d86daf03fd31b2851f779c34a564f7afdf"

  url "https://github.com/vasovagal/corti/releases/download/v0.5.0/Corti_0.5.0_aarch64.dmg"
  name "Corti"
  desc "Menu-bar app that auto-records meetings and files transcript notes to vagus"
  homepage "https://github.com/vasovagal/corti"

  # Apple Silicon only; support latest macOS + one back (ADR 0002). minimumSystemVersion is 15.0, so the
  # Homebrew gate :sequoia (a bare symbol means at-least, i.e. Sequoia 15.x or newer) lines up with the
  # bundle's LSMinimumSystemVersion (see the tap README / ADR 0006). The older ">= :sequoia" string form is
  # deprecated in current Homebrew.
  depends_on macos: :sequoia
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

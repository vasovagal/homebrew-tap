cask "corti" do
  version "0.3.1"
  sha256 "0c3bc37da80a93a955d76e1c0ebb17cf2a2394a9aae2eb11dc58228ea486312f"

  url "https://github.com/vasovagal/corti/releases/download/v0.3.1/Corti_0.3.1_aarch64.dmg"
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

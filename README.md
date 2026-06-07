# homebrew-tap

Homebrew tap for [vasovagal](https://github.com/vasovagal) projects.

## Install

```sh
brew tap vasovagal/tap
brew install vagus           # vagus CLI (formula)
brew install --cask corti    # corti menu-bar app (cask)
```

## Contents

- `Formula/vagus.rb` — [vagus](https://github.com/vasovagal/vagus): local-first PARA second brain (Rust CLI). macOS arm64 + Linux arm64/x86_64.
- `Casks/corti.rb` — [corti](https://github.com/vasovagal/corti): menu-bar app that auto-records meetings → transcript notes. Apple Silicon, macOS 15+. *(added with corti's first release)*

## corti is unsigned

corti ships ad-hoc signed (no Apple Developer ID / notarization). The cask's `postflight` strips the
quarantine attribute so Gatekeeper won't block first launch; macOS still prompts for **Microphone** and
**System Audio Recording** on first run — and again after each update, since an ad-hoc build's code hash
changes every release.

## Maintenance — manual, post-release (CI never writes here)

After each upstream `vX.Y.Z` release, regenerate the relevant file from the published artifacts and commit:

```sh
# vagus
VERSION=X.Y.Z REPO=vasovagal/vagus  ../vagus/scripts/render-formula.sh > Formula/vagus.rb
# corti
VERSION=X.Y.Z REPO=vasovagal/corti  ../corti/scripts/render-cask.sh    > Casks/corti.rb
```

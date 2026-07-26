class Vagus < Formula
  desc "Local-first PARA second brain: hybrid search over a Markdown vault"
  homepage "https://github.com/vasovagal/vagus"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.9.0/vagus-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "c38ea89045fd7369ff9ddadcfad99e01b6030783a85bd1e5584bae0be49821af"
    else
      odie "vagus ships only Apple Silicon (arm64) macOS bottles. Build from source: " \
           "cargo install --git https://github.com/vasovagal/vagus"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.9.0/vagus-0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "98e19a70b1b2d15f05bdd61cdb2a8e62860e16a1d2bfd2ff8319fd65a0eaf09e"
    else
      url "https://github.com/vasovagal/vagus/releases/download/v0.9.0/vagus-0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a1be6e8dd939d5b8a4a3e8898f75704cbe8d7eaf9335a4a9a9ff145399af28a"
    end
  end

  def install
    bin.install "vagus"
  end

  test do
    assert_match "vagus #{version}", shell_output("#{bin}/vagus --version")
  end
end

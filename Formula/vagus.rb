class Vagus < Formula
  desc "Local-first PARA second brain: hybrid search over a Markdown vault"
  homepage "https://github.com/vasovagal/vagus"
  version "0.13.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.13.1/vagus-0.13.1-aarch64-apple-darwin.tar.gz"
      sha256 "2b760e5c9cec918a3ec798f50b6e54e928bad3fe1e0f70c5d38c633a89c2a158"
    else
      odie "vagus ships only Apple Silicon (arm64) macOS bottles. Build from source: " \
           "cargo install --git https://github.com/vasovagal/vagus"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.13.1/vagus-0.13.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75ad51099ab33675e55ff942453f791564c61af3c60cd20508f500644413a087"
    else
      url "https://github.com/vasovagal/vagus/releases/download/v0.13.1/vagus-0.13.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c6f6f29f9b41cd3b5e587a1097e7dc9bbd2812ed7a6b27674a9bf7ec8de6f53"
    end
  end

  def install
    bin.install "vagus"
  end

  test do
    assert_match "vagus #{version}", shell_output("#{bin}/vagus --version")
  end
end

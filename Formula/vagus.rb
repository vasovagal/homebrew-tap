class Vagus < Formula
  desc "Local-first PARA second brain: hybrid search over a Markdown vault"
  homepage "https://github.com/vasovagal/vagus"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.6.1/vagus-0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "83acbda836ab13fd49e2847be4c7d930c96f3c07110a8ed3072e76f0793148c8"
    else
      odie "vagus ships only Apple Silicon (arm64) macOS bottles. Build from source: " \
           "cargo install --git https://github.com/vasovagal/vagus"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.6.1/vagus-0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "87acf16162a7683702284f1091b45a37d16e5d84c0347ec61260a2fd8964065a"
    else
      url "https://github.com/vasovagal/vagus/releases/download/v0.6.1/vagus-0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "37285784914120c2e9130e0ae8a0d5d318b9f078599891eeff6968f29f90b7de"
    end
  end

  def install
    bin.install "vagus"
  end

  test do
    assert_match "vagus #{version}", shell_output("#{bin}/vagus --version")
  end
end

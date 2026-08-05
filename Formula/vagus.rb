class Vagus < Formula
  desc "Local-first PARA second brain: hybrid search over a Markdown vault"
  homepage "https://github.com/vasovagal/vagus"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.11.0/vagus-0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "955b91f66370a37ddc8176d32fd336d74ba74d7df4a6288ed4f227a2105b25f3"
    else
      odie "vagus ships only Apple Silicon (arm64) macOS bottles. Build from source: " \
           "cargo install --git https://github.com/vasovagal/vagus"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.11.0/vagus-0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cb98567f7fb4612f432e211706195b7674958644a7c1bf16e903bad6703c54d0"
    else
      url "https://github.com/vasovagal/vagus/releases/download/v0.11.0/vagus-0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a25f680a21c56086261733e90f1ce4b9d41643d01cbe371b3e119bba098733ae"
    end
  end

  def install
    bin.install "vagus"
  end

  test do
    assert_match "vagus #{version}", shell_output("#{bin}/vagus --version")
  end
end

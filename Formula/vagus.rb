class Vagus < Formula
  desc "Local-first PARA second brain: hybrid search over a Markdown vault"
  homepage "https://github.com/vasovagal/vagus"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.8.0/vagus-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "48a76bbe62afba23c25036974aa0deb541be0061a56d3e8bdc68fe9cd18cba4d"
    else
      odie "vagus ships only Apple Silicon (arm64) macOS bottles. Build from source: " \
           "cargo install --git https://github.com/vasovagal/vagus"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.8.0/vagus-0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cc5e9318a396d237e2036d93d75b4b0f4afdd495f5dab209a044ad9b4928abd9"
    else
      url "https://github.com/vasovagal/vagus/releases/download/v0.8.0/vagus-0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d0da236b7430445e3fbb45f4f77b3e4d39350add249b0710e235ab0f4cb9bf7"
    end
  end

  def install
    bin.install "vagus"
  end

  test do
    assert_match "vagus #{version}", shell_output("#{bin}/vagus --version")
  end
end

class Vagus < Formula
  desc "Local-first PARA second brain: hybrid search over a Markdown vault"
  homepage "https://github.com/vasovagal/vagus"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.12.0/vagus-0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "5eea746e3c5687c4f39425737db7f894f460290de654e243b8e2f152c9c22403"
    else
      odie "vagus ships only Apple Silicon (arm64) macOS bottles. Build from source: " \
           "cargo install --git https://github.com/vasovagal/vagus"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.12.0/vagus-0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5c43df8a36325f4fdf45098be33e9e7e0385d40a4b61e3f69f19604cf444b5d3"
    else
      url "https://github.com/vasovagal/vagus/releases/download/v0.12.0/vagus-0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75fe3d25c93d51f8f52ea297f1a9c31b071f52d54f9661abdf051947689701fc"
    end
  end

  def install
    bin.install "vagus"
  end

  test do
    assert_match "vagus #{version}", shell_output("#{bin}/vagus --version")
  end
end

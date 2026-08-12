class Vagus < Formula
  desc "Local-first PARA second brain: hybrid search over a Markdown vault"
  homepage "https://github.com/vasovagal/vagus"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.13.0/vagus-0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "0248fcd94b3b542d7d09b1ae70fc5ea3be507e86c7f3216bf614b39782df10d1"
    else
      odie "vagus ships only Apple Silicon (arm64) macOS bottles. Build from source: " \
           "cargo install --git https://github.com/vasovagal/vagus"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.13.0/vagus-0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "522cdb132512418dc1308c5cc0379b8e4043e2185ef4c8de7fc80921dc06ac6d"
    else
      url "https://github.com/vasovagal/vagus/releases/download/v0.13.0/vagus-0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d4a047d0e1f6522fd7456847978d687d0846629d431ebc8ac8dd4c15d6e75e58"
    end
  end

  def install
    bin.install "vagus"
  end

  test do
    assert_match "vagus #{version}", shell_output("#{bin}/vagus --version")
  end
end

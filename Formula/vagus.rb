class Vagus < Formula
  desc "Local-first PARA second brain: hybrid search over a Markdown vault"
  homepage "https://github.com/vasovagal/vagus"
  version "0.14.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.14.1/vagus-0.14.1-aarch64-apple-darwin.tar.gz"
      sha256 "591228ee70ca2e39f1786482d29277d2d20fa3adf20d3860f8e8a37a66095880"
    else
      odie "vagus ships only Apple Silicon (arm64) macOS bottles. Build from source: " \
           "cargo install --git https://github.com/vasovagal/vagus"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.14.1/vagus-0.14.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a8efe5d85955ba11a697939e2e118474ce831ffb4bbb99bb82ee2ed75c972808"
    else
      url "https://github.com/vasovagal/vagus/releases/download/v0.14.1/vagus-0.14.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3feaa4777b387f85dcd1934b364f99db8674889893cdbfdbfc9090b9f988180a"
    end
  end

  def install
    bin.install "vagus"
  end

  test do
    assert_match "vagus #{version}", shell_output("#{bin}/vagus --version")
  end
end

class Vagus < Formula
  desc "Local-first PARA second brain: hybrid search over a Markdown vault"
  homepage "https://github.com/vasovagal/vagus"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.14.0/vagus-0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "35ba579a22d4f9918577afa6332520f94e4f647fef9e99672249cb2255ff0745"
    else
      odie "vagus ships only Apple Silicon (arm64) macOS bottles. Build from source: " \
           "cargo install --git https://github.com/vasovagal/vagus"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.14.0/vagus-0.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0903cee585e553aba45b114900c5879a30f50b1ae7222a1e80ba1ad6b2763e7a"
    else
      url "https://github.com/vasovagal/vagus/releases/download/v0.14.0/vagus-0.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dfbbd242e789ef175e7e410d125ea955a5a8c0d9fe569ebab9a14314ac749d9e"
    end
  end

  def install
    bin.install "vagus"
  end

  test do
    assert_match "vagus #{version}", shell_output("#{bin}/vagus --version")
  end
end

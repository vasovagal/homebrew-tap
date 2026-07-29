class Vagus < Formula
  desc "Local-first PARA second brain: hybrid search over a Markdown vault"
  homepage "https://github.com/vasovagal/vagus"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.10.0/vagus-0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "e316a847cfa2d54d609889f7921b9d1fd85736d184a1b31693202922ef3d5a3f"
    else
      odie "vagus ships only Apple Silicon (arm64) macOS bottles. Build from source: " \
           "cargo install --git https://github.com/vasovagal/vagus"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.10.0/vagus-0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e43e6a713cc269c0c7ba67b1c04df804af2412c35c0464417b40ff22af49d6e"
    else
      url "https://github.com/vasovagal/vagus/releases/download/v0.10.0/vagus-0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "428cbfa04d843b038c630fbead5ac3183f6f7ac7330742e3cabf34443348a6d0"
    end
  end

  def install
    bin.install "vagus"
  end

  test do
    assert_match "vagus #{version}", shell_output("#{bin}/vagus --version")
  end
end

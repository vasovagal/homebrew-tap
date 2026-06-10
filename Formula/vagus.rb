class Vagus < Formula
  desc "Local-first PARA second brain: hybrid search over a Markdown vault"
  homepage "https://github.com/vasovagal/vagus"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.7.0/vagus-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "44015217fa74fa06058288cb6e808583ba7cdc784e11c1f750d9decc5593b78c"
    else
      odie "vagus ships only Apple Silicon (arm64) macOS bottles. Build from source: " \
           "cargo install --git https://github.com/vasovagal/vagus"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vasovagal/vagus/releases/download/v0.7.0/vagus-0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e072cc3258c1c3f14f6ddac36dde491ffe266d0a8250ba326fa562e26dff42c"
    else
      url "https://github.com/vasovagal/vagus/releases/download/v0.7.0/vagus-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8059a3ab1ec86a21dfca61cfdf5f6fed6dac638b71f89cfcf958ab1fc368ea6"
    end
  end

  def install
    bin.install "vagus"
  end

  test do
    assert_match "vagus #{version}", shell_output("#{bin}/vagus --version")
  end
end

class Unsee < Formula
  desc "Hide your secrets from AI coding agents"
  homepage "https://github.com/alan890104/unsee"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-aarch64-apple-darwin.tar.gz"
      sha256 "a8b0c08cb81baa1a97a4f5ac8887e1005731d59abc81fabf94fed59a044570f7"
    else
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-x86_64-apple-darwin.tar.gz"
      sha256 "5442b1aad4e7fcc0d5ca7f6e4ce17f96b52d0779358cce98be9e92c69cb76dba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "889708ac769b2020018912675d4a5885ff26354e94a3a8ed6c4ba315fe8d64ff"
    else
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0776a9bc24dd8dfcf0f3282c52e7c1ed1b4f4717bec1c3a76ebe87021de21a71"
    end
  end

  def install
    bin.install "unsee"
  end

  def caveats
    <<~EOS
      To activate protection, run:
        unsee install

      To fully uninstall (wrappers + binary):
        unsee uninstall
    EOS
  end

  test do
    assert_match "unsee", shell_output("#{bin}/unsee --help")
  end
end

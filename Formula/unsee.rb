class Unsee < Formula
  desc "Hide your secrets from AI coding agents"
  homepage "https://github.com/alan890104/unsee"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
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

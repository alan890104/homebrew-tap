class Unsee < Formula
  desc "Hide your secrets from AI coding agents"
  homepage "https://github.com/alan890104/unsee"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-aarch64-apple-darwin.tar.gz"
      sha256 "e8e3094fd5f3ae98fad56e8cb099ac9ac45a2396d151ba6f6a2506f7cbb49fc9"
    else
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-x86_64-apple-darwin.tar.gz"
      sha256 "cf5b39abe8320d672a587a9c4c21a7ae6a0e6a929ca00269691d3416630e94c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "24e0cbbbab14ecb0c5a5c1b69d6d81548e95f77f6a774c7685175e22ffabefab"
    else
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6064c7fe0344389e9af2dd0a76d3b3c9d9ddb4a598571a404d8bb23e26998429"
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

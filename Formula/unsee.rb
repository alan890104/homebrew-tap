class Unsee < Formula
  desc "Hide your secrets from AI coding agents"
  homepage "https://github.com/alan890104/unsee"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-aarch64-apple-darwin.tar.gz"
      sha256 "520650dfe064a0bc58dc25c3a940bffde36974a0369bf15abce177d5861b52f4"
    else
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-x86_64-apple-darwin.tar.gz"
      sha256 "cd2059af84e8d7da4141f7a2c2967a442d2ace23aa7417d909108ba8de9b454f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "972655f3c874657ee44c9ac37602e9aa16bbcd7583b19334893aa06cf5fb312d"
    else
      url "https://github.com/alan890104/unsee/releases/download/v#{version}/unsee-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3cf8fe12fba39215def5602c081c81b191d4dfdec1fe83322ab05c6810489fda"
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

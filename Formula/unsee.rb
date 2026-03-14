class Unsee < Formula
  desc "Hide your secrets from AI coding agents"
  homepage "https://github.com/alan890104/unsee"
  url "https://github.com/alan890104/unsee/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a1742c09c8c1245e8cde708507db1a2722e5fb9795ffa69b75060d1aac736f87"
  license "MIT"

  head "https://github.com/alan890104/unsee.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/unsee-cli")
  end

  def caveats
    <<~EOS
      To activate protection, run:
        unsee install

      Before uninstalling unsee, remove shell wrappers first:
        unsee uninstall
    EOS
  end

  test do
    assert_match "unsee", shell_output("#{bin}/unsee --help")
  end
end

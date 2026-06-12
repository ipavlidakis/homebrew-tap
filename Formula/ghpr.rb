class Ghpr < Formula
  desc "Native macOS GitHub PR review window, straight from your terminal"
  homepage "https://github.com/ipavlidakis/ghpr"
  url "https://github.com/ipavlidakis/ghpr/releases/download/v0.1.1/ghpr-v0.1.1-arm64-macos.tar.gz"
  sha256 "7c803c0a0ed2ac1018aeb181977f9a7609aaee2390d153943d70cee9c9ec4712"
  version "0.1.1"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    # The binary resolves its tree-sitter grammar bundles next to the real
    # executable, so everything lives in libexec with a bin symlink.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"ghpr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghpr --version")
  end
end

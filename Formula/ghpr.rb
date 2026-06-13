class Ghpr < Formula
  desc "Native macOS GitHub PR review window, straight from your terminal"
  homepage "https://github.com/ipavlidakis/ghpr"
  url "https://github.com/ipavlidakis/ghpr/releases/download/v0.3.1/ghpr-v0.3.1-arm64-macos.tar.gz"
  sha256 "7ddcc6865d2f78a6b536742730ff80f5ed9d0584d1fd35001582e4ad557d8230"
  version "0.3.1"
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

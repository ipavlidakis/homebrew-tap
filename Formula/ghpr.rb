class Ghpr < Formula
  desc "Native macOS GitHub PR review window, straight from your terminal"
  homepage "https://github.com/ipavlidakis/ghpr"
  url "https://github.com/ipavlidakis/ghpr/releases/download/v0.1.0/ghpr-v0.1.0-arm64-macos.tar.gz"
  sha256 "b42ddc7df347093b3e3043b9465686a0d96bae771889cd350084ed80be9e5276"
  version "0.1.0"
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
    assert_match "0.1.0", shell_output("#{bin}/ghpr --version")
  end
end

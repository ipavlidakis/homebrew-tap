class Ghpr < Formula
  desc "Native macOS GitHub PR review window, straight from your terminal"
  homepage "https://github.com/ipavlidakis/ghpr"
  url "https://github.com/ipavlidakis/ghpr/releases/download/v0.2.0/ghpr-v0.2.0-arm64-macos.tar.gz"
  sha256 "ab2e2ac80914fa1c20f814511f32965ce92c4bfa0ee77c789e3938d5b66d9bae"
  version "0.2.0"
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

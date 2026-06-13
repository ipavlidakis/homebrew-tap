class Ghpr < Formula
  desc "Native macOS GitHub PR review window, straight from your terminal"
  homepage "https://github.com/ipavlidakis/ghpr"
  url "https://github.com/ipavlidakis/ghpr/releases/download/v0.3.0/ghpr-v0.3.0-arm64-macos.tar.gz"
  sha256 "892955bef8c632558b766b0faed89f0432bd25f59996f139b5b48ebb7ba0bcb8"
  version "0.3.0"
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

class Ghpr < Formula
  desc "Native macOS GitHub PR review window, straight from your terminal"
  homepage "https://github.com/ipavlidakis/ghpr"
  url "https://github.com/ipavlidakis/ghpr/releases/download/v0.1.2/ghpr-v0.1.2-arm64-macos.tar.gz"
  sha256 "3cc787258a7a076311aaddda8997a66df1b486624bddd901a1bea4f349f901c8"
  version "0.1.2"
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

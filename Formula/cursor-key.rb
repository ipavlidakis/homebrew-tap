class CursorKey < Formula
  desc "OpenAI-compatible local proxy for a Cursor subscription"
  homepage "https://github.com/ipavlidakis/cursor-key"
  url "https://github.com/ipavlidakis/cursor-key/releases/download/v0.1.0/cursor-key-0.1.0.tgz"
  version "0.1.0"
  sha256 "232a22a46f3ee386a482f5172fa25b9c46ac405356f59d49841ee9c0497204c6"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"src/index.js"
    bin.install_symlink libexec/"src/index.js" => "cursor-key"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/cursor-key --version").strip
  end
end

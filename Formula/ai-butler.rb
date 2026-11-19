class AiButler < Formula
  desc "Clean up disposable scratch and build caches for settled T3 work"
  homepage "https://github.com/ipavlidakis/ai-butler"
  url "https://github.com/ipavlidakis/ai-butler/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "d9e18ab3904ea53ac1581c136524a1d679767586f70e32c2c6cea817a2fa3493"

  depends_on macos: :sonoma

  def install
    inreplace "ai-butler",
              'SERVICE_COMMAND = ["/usr/bin/python3", str(SCRIPT)]',
              "SERVICE_COMMAND = [\"#{opt_bin}/ai-butler\"]"
    libexec.install "ai-butler", "agent-artifact-review.py"
    bin.install_symlink libexec/"ai-butler"
  end

  def caveats
    <<~EOS
      Enable the per-user LaunchAgent with:
        ai-butler install

      To also configure startup hooks for new worktree build caches:
        ai-butler install --hooks

      To remove the LaunchAgent before uninstalling:
        ai-butler uninstall
    EOS
  end

  test do
    result = JSON.parse(shell_output("#{bin}/ai-butler list --json"))
    assert_equal 60, result.fetch("interval_minutes")
    assert_equal 7, result.fetch("log_retention_days")
    assert_match "Scratch/tmp", result.fetch("pools").first
    assert_match "--hooks", shell_output("#{bin}/ai-butler install --help")
    assert_match "addProjectCleanup", shell_output("#{bin}/ai-butler --help")
  end
end

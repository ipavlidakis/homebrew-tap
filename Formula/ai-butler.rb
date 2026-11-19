class AiButler < Formula
  desc "Clean up disposable scratch and build caches for settled T3 work"
  homepage "https://github.com/ipavlidakis/ai-butler"
  url "https://github.com/ipavlidakis/ai-butler/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "b81aba3a6d8daa4bc84ddc800082126f9477c5d77da74a10f37c0bc15723a112"

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

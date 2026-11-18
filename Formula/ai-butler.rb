class AiButler < Formula
  desc "Manage disposable scratch from settled T3 jobs"
  homepage "https://github.com/ipavlidakis/ai-butler"
  url "https://github.com/ipavlidakis/ai-butler/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6b55a2af1e640a922fb438eaf3908ec6beb6ff4873b366006eb76e90c4851fbd"

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

      To remove the LaunchAgent before uninstalling:
        ai-butler uninstall
    EOS
  end

  test do
    result = JSON.parse(shell_output("#{bin}/ai-butler list --json"))
    assert_equal 60, result.fetch("interval_minutes")
    assert_equal 7, result.fetch("log_retention_days")
    assert_match "Scratch/tmp", result.fetch("pools").first
  end
end

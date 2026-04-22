class SimulatorBuddy < Formula
  desc "Interactive selector for iOS simulators and devices"
  homepage "https://github.com/ipavlidakis/simulator-buddy"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ipavlidakis/simulator-buddy/releases/download/v#{version}/simulator-buddy-aarch64-apple-darwin.tar.gz"
      sha256 "b7900f8aacf16b8da1759907c40029d8675b856d5412a95576ba0926d94fa260"
    else
      url "https://github.com/ipavlidakis/simulator-buddy/releases/download/v#{version}/simulator-buddy-x86_64-apple-darwin.tar.gz"
      sha256 "6f2a5130707be1f5ad25c0bd77f3aaab501ce61c6338f76b4aae68f6b698e52b"
    end
  end

  def install
    bin.install "simulator-buddy"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/simulator-buddy --help")
  end
end

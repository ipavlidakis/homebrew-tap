class SimulatorBuddy < Formula
  desc "Interactive selector for iOS simulators and devices"
  homepage "https://github.com/ipavlidakis/simulator-buddy"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ipavlidakis/simulator-buddy/releases/download/v#{version}/simulator-buddy-aarch64-apple-darwin.tar.gz"
      sha256 "43bba4bd0fca907aa2ae4bb4c61a774820833d2a4de4222b09d253acaaa1bf84"
    else
      url "https://github.com/ipavlidakis/simulator-buddy/releases/download/v#{version}/simulator-buddy-x86_64-apple-darwin.tar.gz"
      sha256 "5dad6947b98adada48db6bae507493c15f34868df2a027ccf234dd80afd0bae9"
    end
  end

  def install
    bin.install "simulator-buddy"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/simulator-buddy --help")
  end
end

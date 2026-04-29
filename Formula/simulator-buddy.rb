class SimulatorBuddy < Formula
  desc "Interactive selector for iOS simulators and devices"
  homepage "https://github.com/ipavlidakis/simulator-buddy"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ipavlidakis/simulator-buddy/releases/download/v#{version}/simulator-buddy-aarch64-apple-darwin.tar.gz"
      sha256 "2c2bbb35e2778925a29c688314117b34d2f1225bba6cddf3ab88052373fc27ff"
    else
      url "https://github.com/ipavlidakis/simulator-buddy/releases/download/v#{version}/simulator-buddy-x86_64-apple-darwin.tar.gz"
      sha256 "f4bc0b236002f7fd8d7836bc158c6459f03816a825d2828c4c19ebd3578df4fa"
    end
  end

  def install
    bin.install "simulator-buddy"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/simulator-buddy --help")
  end
end

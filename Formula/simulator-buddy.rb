class SimulatorBuddy < Formula
  desc "Interactive selector for iOS simulators and devices"
  homepage "https://github.com/ipavlidakis/simulator-buddy"
  version "0.6.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ipavlidakis/simulator-buddy/releases/download/v#{version}/simulator-buddy-aarch64-apple-darwin.tar.gz"
      sha256 "4674a84265471736c7b5032f09313290c188963fc86db747c8e17a2871a10aee"
    else
      url "https://github.com/ipavlidakis/simulator-buddy/releases/download/v#{version}/simulator-buddy-x86_64-apple-darwin.tar.gz"
      sha256 "3abab12731a5179af83e21758d372281e2fa5ad64a85dae39292f490cdea37b9"
    end
  end

  def install
    bin.install "simulator-buddy"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/simulator-buddy --help")
  end
end

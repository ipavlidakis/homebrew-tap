class SimulatorBuddy < Formula
  desc "Interactive selector for iOS simulators and devices"
  homepage "https://github.com/ipavlidakis/simulator-buddy"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ipavlidakis/simulator-buddy/releases/download/v#{version}/simulator-buddy-aarch64-apple-darwin.tar.gz"
      sha256 "78441eaeaa495ffc7e69c6e74fac9066739ab3f060ea195b508e4243272ede5b"
    else
      url "https://github.com/ipavlidakis/simulator-buddy/releases/download/v#{version}/simulator-buddy-x86_64-apple-darwin.tar.gz"
      sha256 "02a479f6b88b2fa7b388dd0c846438450e088cf0318e63f7edc29a3307d5c126"
    end
  end

  def install
    bin.install "simulator-buddy"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/simulator-buddy --help")
  end
end

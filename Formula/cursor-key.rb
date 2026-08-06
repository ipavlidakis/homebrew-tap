class CursorKey < Formula
  desc "OpenAI-compatible local proxy for a Cursor subscription"
  homepage "https://github.com/ipavlidakis/cursor-key"
  url "https://github.com/ipavlidakis/cursor-key/releases/download/v0.1.1/cursor-key-0.1.1.tgz"
  version "0.1.1"
  sha256 "4bb925831b8feb6337174034a10e3243866e19d31082139b48ab710fd706afec"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"src/index.js"
    bin.install_symlink libexec/"src/index.js" => "cursor-key"
  end

  service do
    run [opt_bin/"cursor-key"]
    keep_alive true
    environment_variables PATH: "#{Dir.home}/.local/bin:#{std_service_path_env}"
    log_path var/"log/cursor-key.log"
    error_log_path var/"log/cursor-key.log"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/cursor-key --version").strip
  end
end

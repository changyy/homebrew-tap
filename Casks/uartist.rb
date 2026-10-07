cask "uartist" do
  version "1.20261008.1005135"
  sha256 "b9036862b88cd2c894e2cbbf655fdcc3780dde73ecebedb3ce04ced9701cb7e8"

  url "https://github.com/changyy/UARTist-release/releases/download/1.20261008.1005135/UARTist-#{version}-arm64.dmg"
  name "UARTist"
  desc "Serial console for hardware bring-up"
  homepage "https://uartist.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "UARTist.app"
  binary "#{appdir}/UARTist.app/Contents/MacOS/UARTist", target: "uartist"

  # Not notarized yet: clear the quarantine attribute, as install-mac.sh leaves none.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/UARTist.app"]
  end

  zap trash: "~/Library/Application Support/UARTist"
end

cask "uartist" do
  version "1.20261005.1222956"
  sha256 "a798e94e5526aec1f307ebddaf1b1155570895d2b58987a580acd38ffc94f739"

  url "https://github.com/changyy/UARTist-release/releases/download/1.20261005.1222956/UARTist-#{version}-arm64.dmg",
      verified: "github.com/changyy/UARTist-release/"
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

  # Not notarized yet: clear the quarantine attribute, as install-mac.sh leaves none.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/UARTist.app"]
  end

  zap trash: "~/Library/Application Support/UARTist"
end

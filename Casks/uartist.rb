cask "uartist" do
  version "1.20261004.1230507"
  sha256 "0dd685092851d66126a6cbb81acba4cfdec9d4419424c2bd4716be8e8e339683"

  url "https://github.com/changyy/UARTist-release/releases/download/1.20261004.1230507/UARTist-#{version}-arm64.dmg",
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

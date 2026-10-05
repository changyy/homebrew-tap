cask "uartist" do
  version "1.20261005.1204208"
  sha256 "6d34f50b5213598925077c6d76b096587a1efb14780d542d4a1c2e3dd98c63c0"

  url "https://github.com/changyy/UARTist-release/releases/download/1.20261005.1204208/UARTist-#{version}-arm64.dmg",
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

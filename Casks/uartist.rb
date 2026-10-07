cask "uartist" do
  version "1.20261008.1012150"
  sha256 "86f19e988665d15b6be1f682684a7487e6b3f7a81f9a2baa1de0922249d98b62"

  url "https://github.com/changyy/UARTist-release/releases/download/1.20261008.1012150/UARTist-#{version}-arm64.dmg"
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

cask "uartist" do
  version "1.20261006.1192557"
  sha256 "33e880603be9876ce573579593b91bd55cd151e75b7d5f1455f506d3a9e5170d"

  url "https://github.com/changyy/UARTist-release/releases/download/1.20261006.1192557/UARTist-#{version}-arm64.dmg",
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
  binary "#{appdir}/UARTist.app/Contents/MacOS/UARTist", target: "uartist"

  # Not notarized yet: clear the quarantine attribute, as install-mac.sh leaves none.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/UARTist.app"]
  end

  zap trash: "~/Library/Application Support/UARTist"
end

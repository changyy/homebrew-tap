cask "uartist" do
  version "1.20261007.1215555"
  sha256 "29220bf6232064d57a85c232a6821b7df94ab6550bba6f189830c6c273937498"

  url "https://github.com/changyy/UARTist-release/releases/download/1.20261007.1215555/UARTist-#{version}-arm64.dmg",
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

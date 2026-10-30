# The cask for HenryQW/homebrew-tap. The release workflow fills in 0.1.0 and 4f542918fda1579337f885aa059be394d1d59e405fdf00c4b18b26028dc7a08e and commits it to the tap
# as Casks/rounds.rb.
cask "rounds" do
  version "0.1.0"
  sha256 "4f542918fda1579337f885aa059be394d1d59e405fdf00c4b18b26028dc7a08e"

  url "https://github.com/HenryQW/rounds/releases/download/v#{version}/Rounds-#{version}.dmg"
  name "Rounds"
  desc "Screen-edge pill with the live state of your AI coding sessions"
  homepage "https://rounds.henry.wang/"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Rounds.app"

  zap trash: [
    "~/Library/Application Support/Rounds",
    "~/Library/Preferences/com.henryqw.rounds.plist",
  ]

  caveats <<~EOS
    Rounds has no Developer ID signature, so macOS blocks it at first. To open it, run:
      xattr -dr com.apple.quarantine /Applications/Rounds.app
    Run it again after each upgrade.

    Before you uninstall Rounds, click Remove Hooks in Settings > Sources, for Claude Code and Codex.
    The hooks run a helper inside Rounds.app.
  EOS
end

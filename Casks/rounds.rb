# The cask for HenryQW/homebrew-tap. The release workflow fills in the version and the SHA-256 and commits it to the tap
# as Casks/rounds.rb.
cask "rounds" do
  version "0.1.0"
  sha256 "1d30b082e4a0747e258f59d9e2d15aeaaca77afaec47eb1c3f5a86676e39f8c7"

  url "https://github.com/HenryQW/rounds/releases/download/v#{version}/Rounds-#{version}.dmg"
  name "Rounds"
  desc "Keeps a tab on your AI coding agents from the edge of your screen"
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

# jjjyjyjyjj/homebrew-tap

Homebrew tap for [MouseOS](https://github.com/jjjyjyjyjj/mouseos) — a hand-drawn
mouse that lives on your desktop.

```bash
brew install --cask jjjyjyjyjj/tap/mouseos
```

The app isn't notarised, so macOS would normally refuse to open it. Homebrew
quarantines casks by default, so this cask clears that flag after installing --
which is why `brew install` is all you need here, rather than an install
followed by a terminal command.

If you'd rather make that call yourself, install with `--no-quarantine` and
clear the flag by hand.

Requires macOS 13 or newer. Universal — Apple Silicon and Intel.

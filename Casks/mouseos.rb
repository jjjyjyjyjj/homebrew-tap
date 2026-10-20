# Homebrew cask for MouseOS.
#
# This file belongs in a *separate* repo named `homebrew-tap`, at
# Casks/mouseos.rb, so people can install with:
#
#   brew install --cask jjjyjyjyjj/tap/mouseos
#
# Homebrew QUARANTINES casks by default -- it does not clear the flag. Since
# this app isn't notarised, macOS would refuse to open it, so the postflight
# below clears the flag Homebrew just set. That's what makes `brew install`
# a single step instead of an install followed by a terminal incantation.
#
# Anyone who would rather make that call themselves can skip the tap and use
# `--no-quarantine`, or clear the flag by hand afterwards.
#
# On each release, bump `version` and replace `sha256` with the output of:
#   shasum -a 256 release/MouseOS-<version>-universal.dmg
cask "mouseos" do
  version "0.1.0"
  sha256 "7623696dec969479806c75057f4bdf7e2b39dfbf82685647422913a231a63ce3"

  url "https://github.com/jjjyjyjyjj/mouseos/releases/download/v#{version}/MouseOS-#{version}-universal.dmg"
  name "MouseOS"
  desc "Hand-drawn mouse that lives on your desktop"
  homepage "https://github.com/jjjyjyjyjj/mouseos"

  app "MouseOS.app"

  postflight_steps do
    # Not notarised, and Homebrew quarantines casks by default, so without
    # this macOS refuses to open what it just installed.
    #
    # `run`, not `system_command`, and `{{appdir}}` rather than a bare appdir:
    # postflight_steps is a declarative DSL with no Ruby methods in scope, and
    # the token is expanded at install time, so a custom --appdir still works.
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/MouseOS.app"]
  end

  zap trash: [
    "~/Library/Application Support/mouseos",
    "~/Library/Saved Application State/com.jjjyjyjyjj.mouseos.savedState",
  ]
end

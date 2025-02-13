# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "sketchup-make" do
  version "2017-3"
  sha256 "a534d77d1ea9622b19463258abf21768cb8bb8126734bd40329dd4088b04d79f"

  url "https://ia601705.us.archive.org/31/items/sketchupmake2017/sketchupmake-#{version}-116-90851-en.dmg"
  name "sketchup-make"
  desc "3D modeling software used to create and manipulate 3D models"
  homepage "https://archive.org/details/sketchupmake2017"

  depends_on macos: ">= :el_capitan"

  app "SketchUp 2017/LayOut.app", target: "SketchUp 2017/LayOut.app"
  app "SketchUp 2017/SketchUp.app", target: "SketchUp 2017/SketchUp.app"
  app "SketchUp 2017/Style Builder.app", target: "SketchUp 2017/Style Builder.app"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: ""
end

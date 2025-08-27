cask "anthemscore" do
  version "5.2.2"
  sha256 "f1436fdf53d3d57538f77240772e895ad7817778f8cd893dce6e0fb1a12e56e6"

  # url "https://sfo2.digitaloceanspaces.com/lunaverus/static/resources/installers/AnthemScore.dmg"
  url "https://www.lunaverus.com/download/mac"
  name "AnthemScore"
  desc "Automatic music transcription using AI"
  homepage "https://www.lunaverus.com/"

  depends_on macos: ">= :big_sur"

  app "AnthemScore.app"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: ""
end

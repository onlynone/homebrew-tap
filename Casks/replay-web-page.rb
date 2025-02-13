cask "replay-web-page" do
  version "1.5.7"
  sha256 "d847fbfae2c268443309774e99cd407ce6a0ef470edde7dc710db1c5cb65e71f"

  url "https://github.com/webrecorder/replayweb.page/releases/download/v#{version}/ReplayWeb.page-#{version}.dmg",
      verified: "github.com/webrecorder/replayweb.page/releases/download/"
  name "replay-web-page"
  desc "Web archive replay system as a single web site"
  homepage "https://replayweb.page/"

  app "ReplayWeb.page.app"
end

class DiveAT0140 < Formula
  desc "Tool for exploring each layer in a docker image"
  homepage "https://github.com/joschi/dive"
  url "https://github.com/joschi/dive.git",
      tag:      "v0.14.0",
      revision: "d39840124e779e5914f3ea56fd0ba049cec46c63"
  license "MIT"

  depends_on "go" => :build

  on_linux do
    depends_on "gpgme" => :build
    depends_on "pkg-config" => :build
    depends_on "device-mapper"
  end

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    (testpath/"Dockerfile").write <<~EOS
      FROM alpine
      ENV test=homebrew-core
      RUN echo "hello"
    EOS

    assert_match "dive #{version}", shell_output("#{bin}/dive version")
    assert_match "Building image", shell_output("CI=true #{bin}/dive build .", 1)
  end
end

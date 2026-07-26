cask "fan-curve" do
  version "1.0.5"
  sha256 "7e5980de4b246820a9920bd61771daff490d6a0bbd938a82c3d2d3f1b1773d51"

  url "https://github.com/jonathancostin/fan-curve/releases/download/v#{version}/fan-curve-#{version}-source.tar.gz"
  name "Fan Curve"
  desc "Temperature-based fan controller for Apple silicon Macs"
  homepage "https://github.com/jonathancostin/fan-curve"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "FanCurve-#{version}/build/FanCurve.app", target: "Fan Curve.app"
  installer script: {
    executable: "FanCurve-#{version}/build/FanCurve.app/Contents/Resources/install-helper.sh",
    args:       ["install"],
    sudo:       true,
  }
  binary "#{appdir}/Fan Curve.app/Contents/Resources/install-helper.sh", target: "fan-curve-helper"

  preflight do
    system_command "/bin/zsh", args: ["#{staged_path}/FanCurve-#{version}/scripts/build.sh"]
  end

  uninstall script: {
    executable: "#{appdir}/Fan Curve.app/Contents/Resources/install-helper.sh",
    args:       ["uninstall"],
    sudo:       true,
  }

  zap trash: "~/Library/Preferences/com.jonathan.FanCurve.plist"
end

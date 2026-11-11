cask "fan-curve" do
  version "1.0.15"
  sha256 "2fd1e76d605f7e04fa48a2302f285f2593ad5f616b72f6a88a7e124d4a7c712b"

  url "https://github.com/8thlyr/fan-curve/releases/download/v#{version}/fan-curve-#{version}-source.tar.gz"
  name "Fan Curve"
  desc "Temperature-based fan controller for supported Macs"
  homepage "https://github.com/8thlyr/fan-curve"

  livecheck do
    url :url
    strategy :github_latest
  end

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

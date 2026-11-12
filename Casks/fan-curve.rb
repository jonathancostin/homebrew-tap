cask "fan-curve" do
  version "1.0.16"
  sha256 "58f6bd101feca21cebbbc153c40b5a620e0256ac662187e8221f23c965c9dd8b"

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

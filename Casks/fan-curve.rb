cask "fan-curve" do
  version "1.0.0"
  sha256 "6e0991ce925d9e33b3eae07a7d6c5fd11862d4b48e931105afa9d7e64bd763c4"

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
  binary "#{appdir}/Fan Curve.app/Contents/Resources/install-helper.sh", target: "fan-curve-helper"

  preflight do
    system_command "/bin/zsh", args: ["#{staged_path}/FanCurve-#{version}/scripts/build.sh"]
  end

  uninstall script: {
    executable: "#{appdir}/Fan Curve.app/Contents/Resources/install-helper.sh",
    args:       ["uninstall"],
  }

  zap trash: "~/Library/Preferences/com.jonathan.FanCurve.plist"

  caveats <<~EOS
    Install or refresh the privileged fan helper after each upgrade:
      fan-curve-helper install
  EOS
end

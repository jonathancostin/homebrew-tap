# jonathancostin/homebrew-tap

Homebrew tap (`jonathancostin/tap`) for Jonathan Costin projects. It holds the `fan-curve` cask, the macOS menu-bar app "Fan Curve" (temperature-based fan controller for supported Macs), and the `tuitree` formula, a terminal dashboard for git worktrees and GitHub PRs.

## Status

- Public, default branch `main`.
- Current `fan-curve` cask version: 1.0.6.
- This repo has no workflows of its own. Cask version bumps are pushed by `github-actions[bot]` from the fan-curve repo's `Release to Homebrew` workflow (`.github/workflows/release.yml`), which runs on every push to fan-curve's `main`, creates a GitHub release, and updates `version` and `sha256` in `Casks/fan-curve.rb`.

## Formulae

| Formula | Installs | Source |
|---|---|---|
| `tuitree` | the `tuitree` binary (macOS arm64/x86_64, Linux arm64/x86_64) | prebuilt tarballs from the [jonathancostin/tuitree](https://github.com/jonathancostin/tuitree) GitHub release |

## Casks

| Cask | Installs | Source |
|---|---|---|
| `fan-curve` | `Fan Curve.app` plus the `fan-curve-helper` command | [jonathancostin/fan-curve](https://github.com/jonathancostin/fan-curve) GitHub release (source tarball) |

What the `fan-curve` cask does:

- Downloads the source tarball from the fan-curve GitHub release.
- Runs `scripts/build.sh` in `preflight`, installs `Fan Curve.app`, and runs `install-helper.sh install` with sudo.
- Exposes the helper as the `fan-curve-helper` binary.
- On uninstall, runs `install-helper.sh uninstall` with sudo.
- Requires macOS Ventura or newer. Livecheck strategy: `:github_latest`.
- `zap` removes `~/Library/Preferences/com.jonathan.FanCurve.plist`.

## Install

```sh
brew install jonathancostin/tap/tuitree

brew install --cask jonathancostin/tap/fan-curve
fan-curve-helper install
```

Remove:

```sh
fan-curve-helper uninstall
brew uninstall --cask fan-curve
```

## Configuration

None.

## Layout

```text
README.md
Casks/fan-curve.rb
Formula/tuitree.rb
```

## License

None.

## Links

- Tap: https://github.com/jonathancostin/homebrew-tap
- fan-curve: https://github.com/jonathancostin/fan-curve

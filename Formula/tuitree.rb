class Tuitree < Formula
  desc "Terminal dashboard for git worktrees and GitHub PRs"
  homepage "https://github.com/8thlyr/tuitree"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/8thlyr/tuitree/releases/download/v0.1.0/tuitree-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "5a699a56f963ce567b9c51d0ad7784a40e162ccbf751beed5d068937f7c1bf7a"
    end
    on_intel do
      url "https://github.com/8thlyr/tuitree/releases/download/v0.1.0/tuitree-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "447e033456498d56f398684d4d27d837e42f0bef4c6207aa8dc073ce26948f04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/8thlyr/tuitree/releases/download/v0.1.0/tuitree-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04645eb4c28391b3bed53ef8f3cacc713a6513d18024039ba03817124418b4ef"
    end
    on_intel do
      url "https://github.com/8thlyr/tuitree/releases/download/v0.1.0/tuitree-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66c0f4c1a0b9a71b4810f9aaf949e59d1c88757464df856cfe4b6bc410bbbe7d"
    end
  end

  depends_on "git"

  def install
    bin.install "tuitree"
  end

  test do
    assert_predicate bin/"tuitree", :executable?
  end
end

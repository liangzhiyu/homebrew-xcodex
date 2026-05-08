class Xcodex < Formula
  desc "Codex CLI data management tool"
  homepage "https://github.com/liangzhiyu/xcodex"
  url "https://github.com/liangzhiyu/xcodex/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "ea79eb19cbff231aea450d08eeaa9927ae49c0f287334d01a7d97a5c92e89240"
  license "MIT"
  head "https://github.com/liangzhiyu/xcodex.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/xcodex"
  end

  test do
    assert_match "Codex 数据管理工具", shell_output("#{bin}/xcodex help 2>&1")
  end
end

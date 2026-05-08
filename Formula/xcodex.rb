class Xcodex < Formula
  desc "Codex CLI data management tool"
  homepage "https://github.com/liangzhiyu/xcodex"
  url "https://github.com/liangzhiyu/xcodex/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "148fed9bc4da5344b743ce27997014cfe23140f3ff07ed17230b76a354fe0ac7"
  license "MIT"
  head "https://github.com/liangzhiyu/xcodex.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}"), "./cmd/xcodex"
  end

  test do
    assert_match "Codex 数据管理工具", shell_output("#{bin}/xcodex help 2>&1")
    assert_match "xcodex v", shell_output("#{bin}/xcodex version")
  end
end

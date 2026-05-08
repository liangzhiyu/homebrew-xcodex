class Xcodex < Formula
  desc "Codex CLI data management tool"
  homepage "https://github.com/liangzhiyu/xcodex"
  url "https://github.com/liangzhiyu/xcodex/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "f282053063b57b00ce798bd2a0edae945e02f1f0fb1d47fc5e7442b72ca996bf"
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

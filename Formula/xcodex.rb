class Xcodex < Formula
  desc "Codex CLI data management tool"
  homepage "https://github.com/liangzhiyu/xcodex"
  url "https://github.com/liangzhiyu/xcodex/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "ac2e986ae6135da3b3652c70db38e90a7e40682fac966aa5e6a5048f27d31722"
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

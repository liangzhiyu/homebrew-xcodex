class Xcodex < Formula
  desc "Codex CLI data management tool"
  homepage "https://github.com/liangzhiyu/xcodex"
  url "https://github.com/liangzhiyu/xcodex/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "bfd7f9fb3e0833c1d894645b967320bfb441a3c178191af0ebe4a98dfc504b75"
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

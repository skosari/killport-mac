class Killport < Formula
  desc "Kill whatever process is running on a given port"
  homepage "https://github.com/skosari/killport-mac"
  url "https://github.com/skosari/killport-mac/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "88b80662eb573ebdb80e6ade66ece83f0c4ac55e41ebc98f9eb5d6492413410e"
  license "MIT"

  def install
    bin.install "killport"
  end

  test do
    assert_match "Usage: killport", shell_output("#{bin}/killport 2>&1", 1)
  end
end

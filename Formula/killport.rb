class Killport < Formula
  desc "Kill whatever process is running on a given port"
  homepage "https://github.com/skosari/killport-mac"
  url "https://github.com/skosari/killport-mac/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "REPLACE_WITH_SHA256_OF_TARBALL"
  license "MIT"

  def install
    bin.install "killport"
  end

  test do
    assert_match "Usage: killport", shell_output("#{bin}/killport 2>&1", 1)
  end
end

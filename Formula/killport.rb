class Killport < Formula
  desc "Kill processes by port, manage firewall, SSH, WoL, and more"
  homepage "https://github.com/skosari/killport-mac"
  url "https://raw.githubusercontent.com/skosari/killport-mac/main/killport"
  sha256 "3f5e465f7f467183ff6d05306cae5ba78bf175847fa9c44e6c4795c13ad4c064"
  version "1.10.32"
  license "MIT"

  def install
    bin.install "killport"
  end

  test do
    assert_match "killport", shell_output("#{bin}/killport --help 2>&1")
  end
end

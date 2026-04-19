class Killport < Formula
  desc "Kill processes by port, manage firewall, SSH, WoL, and more"
  homepage "https://github.com/skosari/killport-mac"
  url "https://raw.githubusercontent.com/skosari/killport-mac/main/killport"
  sha256 "e28ec2295cb10f5e9c3bd7547d2830e0d80c7b11d89441aad4b9ce9500063989"
  version "1.10.33"
  license "MIT"

  def install
    bin.install "killport"
  end

  test do
    assert_match "killport", shell_output("#{bin}/killport --help 2>&1")
  end
end

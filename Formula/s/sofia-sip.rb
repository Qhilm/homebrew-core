class SofiaSip < Formula
  desc "SIP User-Agent library"
  homepage "https://sofia-sip.sourceforge.net/"
  url "https://github.com/freeswitch/sofia-sip/archive/refs/tags/v1.13.17.tar.gz"
  sha256 "daca3d961b6aa2974ad5d3be69ed011726c3e4d511b2a0d4cb6d878821a2de7a"
  license "LGPL-2.1-or-later"

  bottle do
    sha256 cellar: :any,                 arm64_sonoma:   "64fac30f1b870f9fb55de075fe73611d1bf72d1a5d59178f2d923b82a284f0d0"
    sha256 cellar: :any,                 arm64_ventura:  "262dc862799700c5dff589548f224eca25f9832cb7f7b5816d6572259fe52b8d"
    sha256 cellar: :any,                 arm64_monterey: "e4d08ce84ebaf37bf91b11eef9485eea17539187663a5046ac69b6d2c08c6494"
    sha256 cellar: :any,                 arm64_big_sur:  "9c46d7adcdaf2289205bb2401fbc165b1d3d754ee95b9d4b4f54f3f0a39ae7f6"
    sha256 cellar: :any,                 sonoma:         "481f03671ad68aa221d58e1b4d7f32f0e634d5181de3d6f2a4d7f0b454679340"
    sha256 cellar: :any,                 ventura:        "1132c7c2515879d1911bf2a59b62a83ecfd4ecf1d0b9209a39e1b1022b202e01"
    sha256 cellar: :any,                 monterey:       "394bcdcd427901d26872d5b788940651b73dc20d51c34b4a221b1ee2471f0f8f"
    sha256 cellar: :any,                 big_sur:        "233145304a443c3a588ec3f6fa535418012ce5f93e92624d5e7eca05c861eb88"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e53bb336e275f17cc23454016ab71d4613b5d6025c579b71c46b717fbe40f34a"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "glib"
  depends_on "openssl@3"

  def install
    system "./bootstrap.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/localinfo"
    system "#{bin}/sip-date"
  end
end

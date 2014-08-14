require "formula"

class RabbitmqC < Formula
  homepage "https://github.com/alanxz/rabbitmq-c"
  url "https://github.com/alanxz/rabbitmq-c/archive/v0.5.1.tar.gz"
  sha1 "3a2fad69f65ef3a733fbfd9320717d2aedec5aa2"

  head "https://github.com/alanxz/rabbitmq-c.git"

  option :universal

  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    ENV.universal_binary if build.universal?
    system "autoreconf", "-i"
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end

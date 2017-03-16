require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php71Swoole < AbstractPhp71Extension
  init
  desc "Event-driven asynchronous & concurrent networking engine for PHP."
  homepage "https://pecl.php.net/package/swoole"
  url "https://github.com/swoole/swoole-src/archive/v2.0.6.tar.gz"
  version "v2.0.6"
  sha256 "926457eb188a401b69676c9fdc51ca2cbfef68dfcaaa3fefdf1d2add24f47501"
  head "https://github.com/swoole/swoole-src.git"

  def install
    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", "--enable-coroutine", phpconfig
    system "make"
    prefix.install "modules/swoole.so"
    write_config_file if build.with? "config-file"
  end
end

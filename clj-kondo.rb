class CljKondo < Formula

  desc "A minimal and opinionated linter for Clojure code that sparks joy."
  homepage "https://github.com/borkdude/clj-kondo"
  version "2019.04.07-alpha"

  if OS.linux?
    url "https://github.com/borkdude/clj-kondo/releases/download/v2019.04.07-alpha/clj-kondo-2019.04.07-alpha-linux-amd64.tar.gz"
    sha256 "509c7012e5e4328ef3abf4312a9f3bd5019a62b3d481faf0889e9b54b36b4e5d"
  else
    url "https://github.com/borkdude/clj-kondo/releases/download/v2019.04.07-alpha/clj-kondo-2019.04.07-alpha-macos-amd64.tar.gz"
    sha256 "8099ddf9f5644d33d179c25e6c7dca5e38f53c53c7bb3671ceb68cb085fba279"
  end

  bottle :unneeded

  def install
    bin.install "clj-kondo"
  end

  test do
    testfile = testpath/"test.clj"
    testfile.write "(defn foo [x] x) (foo 1 2 3)"
    assert_match "Wrong number of args (3) passed to user/foo",
                 shell_output("#{bin}/clj-kondo --lint #{testfile} 2>&1")
  end
end

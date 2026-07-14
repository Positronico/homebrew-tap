# Homebrew formula for yahh. Lives in github.com/Positronico/homebrew-tap
# as Formula/yahh.rb; users install with:
#   brew install Positronico/tap/yahh
#
# Maintained manually: regenerate for each release with
#   packaging/update-formula.sh v2.0.0 > Formula/yahh.rb
# from the Positronico/yahh repo. See its PUBLISHING.md.
class Yahh < Formula
  desc "Per-project shell history realms for zsh and bash"
  homepage "https://github.com/Positronico/yahh"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Positronico/yahh/releases/download/v#{version}/yahh_#{version}_darwin_arm64.tar.gz"
      sha256 "dbdb15c34beab16fe8f5cfa6b777ae1126cc3d17cb68306e2c858b95644ea391"
    end
    on_intel do
      url "https://github.com/Positronico/yahh/releases/download/v#{version}/yahh_#{version}_darwin_amd64.tar.gz"
      sha256 "b2fdafb531312bfccbff426d3a54a68d18253c5d1aa9ae75004b234019443269"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Positronico/yahh/releases/download/v#{version}/yahh_#{version}_linux_arm64.tar.gz"
      sha256 "855d2563adfc125b1e64db9999fc8f22d099202afcc1bb577e9bdba86f7af5b7"
    end
    on_intel do
      url "https://github.com/Positronico/yahh/releases/download/v#{version}/yahh_#{version}_linux_amd64.tar.gz"
      sha256 "d7e0fcbc73aef79eb80879687f6d33ac5c01c88b81afb971d489ea2e38d195ae"
    end
  end

  def install
    bin.install "yahh"
    generate_completions_from_executable(bin/"yahh", "completion")
  end

  def caveats
    <<~EOS
      To activate yahh, add to your shell rc file (or run `yahh install`):
        eval "$(yahh init zsh)"    # ~/.zshrc
        eval "$(yahh init bash)"   # ~/.bashrc
    EOS
  end

  test do
    system "#{bin}/yahh", "version"
  end
end

# Homebrew formula for yahh. Lives in github.com/Positronico/homebrew-tap
# as Formula/yahh.rb; users install with:
#   brew install Positronico/tap/yahh
#
# Maintained manually: regenerate for each release with
#   packaging/update-formula.sh v2.1.0 > Formula/yahh.rb
# from the Positronico/yahh repo. See its PUBLISHING.md.
class Yahh < Formula
  desc "Per-project shell history realms for zsh and bash"
  homepage "https://github.com/Positronico/yahh"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Positronico/yahh/releases/download/v#{version}/yahh_#{version}_darwin_arm64.tar.gz"
      sha256 "12f65db8e2db51638ff0c76c654dae43e9623c33aa6ded9ed50f7e779e77c1f0"
    end
    on_intel do
      url "https://github.com/Positronico/yahh/releases/download/v#{version}/yahh_#{version}_darwin_amd64.tar.gz"
      sha256 "175918d9f35b02b571b1fba19d8afb99fa1b3944ad948c281662063e89cb7330"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Positronico/yahh/releases/download/v#{version}/yahh_#{version}_linux_arm64.tar.gz"
      sha256 "44c1288c74882a6a0a8e0af250cc009bdc018bfd357c165e4af803cbb7bda551"
    end
    on_intel do
      url "https://github.com/Positronico/yahh/releases/download/v#{version}/yahh_#{version}_linux_amd64.tar.gz"
      sha256 "84eb3e45831f9b26f0fd39938779cc928a7c39cd9c8e6c31a5ecf2c7d12b4b46"
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

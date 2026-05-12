class Snapem < Formula
  desc "Zero-Trust npm/bun CLI for macOS Silicon"
  homepage "https://github.com/Positronico/snapem"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Positronico/snapem/releases/download/v#{version}/snapem_#{version}_darwin_arm64.tar.gz"
      sha256 "5bc00135bb3f5e37778608106143a2f98ac33f4f7a36c761365e279ccee70d2a"
    end
    on_intel do
      url "https://github.com/Positronico/snapem/releases/download/v#{version}/snapem_#{version}_darwin_amd64.tar.gz"
      sha256 "c3de4c44977175ee6da51cc1d96165a4b83afedec6aaa4cdd250f0915a2c12a8"
    end
  end

  def install
    bin.install "snapem"
  end

  def caveats
    <<~EOS
      snapem requires Apple's container CLI for isolation features.
      Install it with: brew install --cask container
    EOS
  end

  test do
    system "#{bin}/snapem", "version"
  end
end

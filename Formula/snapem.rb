class Snapem < Formula
  desc "Zero-Trust npm/bun CLI for macOS Silicon"
  homepage "https://github.com/Positronico/snapem"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Positronico/snapem/releases/download/v#{version}/snapem_#{version}_darwin_arm64.tar.gz"
      sha256 "285f5094e18d19e258d838864c670a25b60c478e32f1455b8bd2d59157c06ea9"
    end
    on_intel do
      url "https://github.com/Positronico/snapem/releases/download/v#{version}/snapem_#{version}_darwin_amd64.tar.gz"
      sha256 "64af1ba49db3d193e0688e639ddcab1cc20990648996b72b91a72b2a1d0304af"
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

class Snapem < Formula
  desc "Zero-Trust npm/bun CLI for macOS Silicon"
  homepage "https://github.com/Positronico/snapem"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Positronico/snapem/releases/download/v#{version}/snapem_#{version}_darwin_arm64.tar.gz"
      sha256 "1d6e20caa543f120969d1d6070757fbd3f34e2260bab21f4824bbdb93ec7e890"
    end
    on_intel do
      url "https://github.com/Positronico/snapem/releases/download/v#{version}/snapem_#{version}_darwin_amd64.tar.gz"
      sha256 "ca909190be07c0e731e0a4659bdcc2ec0d8cea88f0a0c1d8abb4047f932ada2a"
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

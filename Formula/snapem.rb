class Snapem < Formula
  desc "Zero-Trust npm/bun CLI for macOS Silicon"
  homepage "https://github.com/Positronico/snapem"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Positronico/snapem/releases/download/v#{version}/snapem_#{version}_darwin_arm64.tar.gz"
      sha256 "bc504cb00c7b14f737154b2c57a4c5283c6a6dff1ec99964f916535b5862fd43"
    end
    on_intel do
      url "https://github.com/Positronico/snapem/releases/download/v#{version}/snapem_#{version}_darwin_amd64.tar.gz"
      sha256 "0b17eb4abc5fc13d6d84aa8cd78fba967c0c59033c347af0f85ae98c3accf29d"
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

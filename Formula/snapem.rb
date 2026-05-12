class Snapem < Formula
  desc "Zero-Trust npm/bun CLI for macOS Silicon"
  homepage "https://github.com/Positronico/snapem"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Positronico/snapem/releases/download/v#{version}/snapem_#{version}_darwin_arm64.tar.gz"
      sha256 "0e29995a24a5f0521a2cfaa0a7a1e663840718320c1b2477b84895ee627593dc"
    end
    on_intel do
      url "https://github.com/Positronico/snapem/releases/download/v#{version}/snapem_#{version}_darwin_amd64.tar.gz"
      sha256 "0bf1dbfa19ec949976bbd2b5ad246abae4713d64e95f397be6d2ade36439cb04"
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

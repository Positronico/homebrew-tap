# Homebrew formula for kkonf. Lives in github.com/Positronico/homebrew-tap
# as Formula/kkonf.rb; users install with:
#   brew install Positronico/tap/kkonf
#
# Maintained manually: bump version and refresh the sha256 of each release
# asset (shasum -a 256 kkonf-v<version>-<os>-<arch>.tar.gz).
class Kkonf < Formula
  desc "Terminal UI and CLI for managing kubectl configuration files"
  homepage "https://github.com/Positronico/kkonf"
  version "2.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Positronico/kkonf/releases/download/v#{version}/kkonf-v#{version}-darwin-arm64.tar.gz"
      sha256 "6d94f46f70016134d580e797bfbbbdee862fb1d04af6baef63c46dcffe3594c3"
    end
    on_intel do
      url "https://github.com/Positronico/kkonf/releases/download/v#{version}/kkonf-v#{version}-darwin-amd64.tar.gz"
      sha256 "936896244a2c606c70650fd55ca8e6e3b4da3ffcee8b43a3706c4e0511d00668"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Positronico/kkonf/releases/download/v#{version}/kkonf-v#{version}-linux-arm64.tar.gz"
      sha256 "ed3babcfa307ade57ee35da3c6f9067600fa2d9749a985fd8ea4f7c40ea7765a"
    end
    on_intel do
      url "https://github.com/Positronico/kkonf/releases/download/v#{version}/kkonf-v#{version}-linux-amd64.tar.gz"
      sha256 "58f6dc68a2072b532352c2bd70853227f9b44e9246fa7c4201520c2fa5d00534"
    end
  end

  def install
    bin.install "kkonf"
    generate_completions_from_executable(bin/"kkonf", "completion")
  end

  def caveats
    <<~EOS
      Run `kkonf` for the interactive TUI, or use the subcommands for scripting:
        kkonf ctx [name]      list or switch contexts
        kkonf ns [namespace]  show or set the current namespace
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kkonf --version")
  end
end

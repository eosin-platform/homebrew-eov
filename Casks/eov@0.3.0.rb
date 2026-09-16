cask "eov@0.3.0" do
    version "0.3.0"

    on_arm do
        sha256 "ac1d664075db729a64b02185ae9342581c0c8a73f73f9519e61916b66d95ec21"

        url "https://github.com/eosin-platform/eov/releases/download/v0.3.0/eov-v0.3.0-macos-arm64.zip"
    end
    on_intel do
        sha256 "53a10dea49554529fcb57824c5dc6624e1f6f6061c4d1f9f27c775d8e878efa0"

        url "https://github.com/eosin-platform/eov/releases/download/v0.3.0/eov-v0.3.0-macos-x86_64.zip"
    end

    name "eov"
    desc "Lightweight, cross-platform Whole Slide Image (WSI) viewer for digital pathology"
    homepage "https://eov.sh/"

    depends_on macos: :big_sur

    app "eov.app"
    binary "#{appdir}/eov.app/Contents/MacOS/eov"

    zap trash: [
        "~/Library/Application Support/io.eosin.eov",
        "~/Library/Caches/io.eosin.eov",
        "~/Library/Preferences/io.eosin.eov.plist",
    ]

    caveats <<~EOS
        eov is not notarized by Apple. If macOS prevents it from opening, go to:
            System Settings → Privacy & Security → Open Anyway
    EOS
end

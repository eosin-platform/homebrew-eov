cask "eov@0.4.2" do
    version "0.4.2"

    on_arm do
        sha256 "924038aac561482c81c15cfb3eeed9be4de2d45dd6a8aa24cdbd39a4c8c3b475"

        url "https://github.com/eosin-platform/eov/releases/download/v0.4.2/eov-v0.4.2-macos-arm64.zip"
    end
    on_intel do
        sha256 "28f937797f8f11588069035c67e7ff1c57bb837b01abe7528b25a820ee521279"

        url "https://github.com/eosin-platform/eov/releases/download/v0.4.2/eov-v0.4.2-macos-x86_64.zip"
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

cask "eov@0.4.6" do
    version "0.4.6"

    on_arm do
        sha256 "893be6de1733a68ba6a98f49220bde479ce8b73356699982283c9bb1d02fffa8"

        url "https://github.com/eosin-platform/eov/releases/download/v0.4.6/eov-v0.4.6-macos-arm64.zip"
    end
    on_intel do
        sha256 "f06d6ecde534ec1d773961736b02c1acd4345326bcc259bd5b600dd86b86efa9"

        url "https://github.com/eosin-platform/eov/releases/download/v0.4.6/eov-v0.4.6-macos-x86_64.zip"
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

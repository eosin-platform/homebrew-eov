cask "eov@0.2.25" do
    version "0.2.25"

    on_arm do
        sha256 "aced331ebb84ac20618befded6a76eddba03e5d59ef966887e534844be8ac573"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.25/eov-v0.2.25-macos-arm64.zip"
    end
    on_intel do
        sha256 "ea7f56af79cf4ac233438da44ed618b333bf182ef02b46ae19a4479174f43960"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.25/eov-v0.2.25-macos-x86_64.zip"
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

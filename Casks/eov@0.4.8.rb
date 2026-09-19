cask "eov@0.4.8" do
    version "0.4.8"

    on_arm do
        sha256 "d935a2237953d07e6c12000e80198797f2bd342022ead9485b82949faf25a4c2"

        url "https://github.com/eosin-platform/eov/releases/download/v0.4.8/eov-v0.4.8-macos-arm64.zip"
    end
    on_intel do
        sha256 "170c06a05179252a63e45924fb692ebcaa1015d1ae424315f5b7448e58941d36"

        url "https://github.com/eosin-platform/eov/releases/download/v0.4.8/eov-v0.4.8-macos-x86_64.zip"
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

cask "eov@0.2.20" do
    version "0.2.20"

    on_arm do
        sha256 "f6c4c4999cc2e282975578049af4c2b37bb1dfd60c7043c396e5cdf5b4d2d456"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.20/eov-v0.2.20-macos-arm64.zip"
    end
    on_intel do
        sha256 "aeaebf505970ce9cd70321abc1da16fcf441c0f1867b6f0954897e3cbd13f382"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.20/eov-v0.2.20-macos-x86_64.zip"
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

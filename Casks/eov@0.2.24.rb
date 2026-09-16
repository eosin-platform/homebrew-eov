cask "eov@0.2.24" do
    version "0.2.24"

    on_arm do
        sha256 "7af82fd6668e45886b4d2de375562699abbd898bebf6b686fb79c0bb3a56dbd5"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.24/eov-v0.2.24-macos-arm64.zip"
    end
    on_intel do
        sha256 "22d53b8ab4b93b20ed4bbd0b2ddc8c66bf319dc287fcaedaf0754cbfd91dcad8"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.24/eov-v0.2.24-macos-x86_64.zip"
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

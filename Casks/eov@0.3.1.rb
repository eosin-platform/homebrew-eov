cask "eov@0.3.1" do
    version "0.3.1"

    on_arm do
        sha256 "408ea7853793890d13af065299b211701177604f26a5c6cbe040be1e2c464437"

        url "https://github.com/eosin-platform/eov/releases/download/v0.3.1/eov-v0.3.1-macos-arm64.zip"
    end
    on_intel do
        sha256 "bb9e151a00f5e54629bf909d8386039ced1472f8dc938b43f879b7299d0fe4e5"

        url "https://github.com/eosin-platform/eov/releases/download/v0.3.1/eov-v0.3.1-macos-x86_64.zip"
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

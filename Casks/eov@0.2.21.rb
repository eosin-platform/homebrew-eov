cask "eov@0.2.21" do
    version "0.2.21"

    on_arm do
        sha256 "f98555328bc3c9f919ec12919f295fd518c10f22a973768c0b0dfa1dc03ef3ac"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.21/eov-v0.2.21-macos-arm64.zip"
    end
    on_intel do
        sha256 "d214f2277b4623aa89f749b15e9714371cede073a4b3c31da9c7f70f7982f585"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.21/eov-v0.2.21-macos-x86_64.zip"
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

cask "eov@0.2.16" do
    version "0.2.16"

    on_arm do
        sha256 "9843d35114dcdc410d6f3dce0801615ccb82d3f6ea2be28496f1bff8bffe81a3"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.16/eov-v0.2.16-macos-arm64.zip"
    end
    on_intel do
        sha256 "2ce78ca0b63b292d73c8d6b1368eb21c1dad29aadd7237723ed7022af9475465"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.16/eov-v0.2.16-macos-x86_64.zip"
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

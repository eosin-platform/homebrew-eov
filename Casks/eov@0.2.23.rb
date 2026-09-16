cask "eov@0.2.23" do
    version "0.2.23"

    on_arm do
        sha256 "b19327034fd998213ee2fee913c973e4a1544f9037c924894115901960322cc1"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.23/eov-v0.2.23-macos-arm64.zip"
    end
    on_intel do
        sha256 "63ffa9874272351e31b91b0dda20085637db7b1b94782394aa0ca774598297f9"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.23/eov-v0.2.23-macos-x86_64.zip"
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

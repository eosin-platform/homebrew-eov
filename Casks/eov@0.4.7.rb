cask "eov@0.4.7" do
    version "0.4.7"

    on_arm do
        sha256 "6288bbc2996635aa90050cf3079da23dcfad0d7278c7408f78d505f9c83cd99e"

        url "https://github.com/eosin-platform/eov/releases/download/v0.4.7/eov-v0.4.7-macos-arm64.zip"
    end
    on_intel do
        sha256 "ec0180622b5084c10ea6129b8f628a81c621cbfda558b25911d7bfab58c60460"

        url "https://github.com/eosin-platform/eov/releases/download/v0.4.7/eov-v0.4.7-macos-x86_64.zip"
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

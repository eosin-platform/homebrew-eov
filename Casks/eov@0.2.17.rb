cask "eov@0.2.17" do
    version "0.2.17"

    on_arm do
        sha256 "cc83fceaa5525a0232de6799d3f5ab2847233ba45bc9442e19b1842506a5121a"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.17/eov-v0.2.17-macos-arm64.zip"
    end
    on_intel do
        sha256 "44b639fe890b488080069d4948f64a4dd045b20e1c51a98c1fc3453d5fdafbef"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.17/eov-v0.2.17-macos-x86_64.zip"
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

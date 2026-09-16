cask "eov@0.2.14" do
    version "0.2.14"

    on_arm do
        sha256 "25b310ec0ba46fecf738613e42f2e2562bfdb7fdc7146a7e13c0786d59d63361"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.14/eov-v0.2.14-macos-arm64.zip"
    end
    on_intel do
        sha256 "82ab91a358de633ba83dadfc49a0803998cd0225b4dec8d3f47723c3550955dd"

        url "https://github.com/eosin-platform/eov/releases/download/v0.2.14/eov-v0.2.14-macos-x86_64.zip"
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

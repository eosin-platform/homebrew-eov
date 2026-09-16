cask "eov@0.4.5" do
    version "0.4.5"

    on_arm do
        sha256 "e8e9ce50b4d07bbc91da617daa221717b27083d037401af58e760a28192fdbdd"

        url "https://github.com/eosin-platform/eov/releases/download/v0.4.5/eov-v0.4.5-macos-arm64.zip"
    end
    on_intel do
        sha256 "ec74a960d9900c76e4d3c9ba431f9002314608a6f392a054c2bd30d29f913c8c"

        url "https://github.com/eosin-platform/eov/releases/download/v0.4.5/eov-v0.4.5-macos-x86_64.zip"
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

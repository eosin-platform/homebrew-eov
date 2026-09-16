cask "eov@0.4.1" do
    version "0.4.1"

    on_arm do
        sha256 "e05123da43ac690f00819cefcd1d7b837b56fa5e2152a3fc025fa4ee8613b8d2"

        url "https://github.com/eosin-platform/eov/releases/download/v0.4.1/eov-v0.4.1-macos-arm64.zip"
    end
    on_intel do
        sha256 "1709ed406b42c9a6397e0a1776486099347e0e3f7c63ab408f3e961dfd14e91d"

        url "https://github.com/eosin-platform/eov/releases/download/v0.4.1/eov-v0.4.1-macos-x86_64.zip"
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

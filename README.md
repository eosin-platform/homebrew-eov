# eov Homebrew Tap

This tap provides the official macOS casks for [eov](https://eov.sh/).

## Latest stable

```bash
brew tap eosin-platform/eov
brew install --cask eov
```

`Casks/eov.rb` tracks the latest stable EOV release.

## Exact releases

Every stable EOV release with the required macOS artifacts has an immutable,
version-specific cask. For example:

```bash
brew tap eosin-platform/eov
brew install --cask eov@0.4.4
```

`eov@X.Y.Z` remains pinned to the matching EOV GitHub Release and is never
rewritten after it is created. The versioned cask may also be installed with:

```bash
brew install --cask eosin-platform/eov/eov@0.4.4
```

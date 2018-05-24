#!/usr/bin/env bash
# Updated the changelog for a new release
set -exou pipefail

version=$1
date=$(date +%Y-%m-%d)

sed -i "s/## \[Unreleased\]/## [Unreleased]\n### Added\n\n### Changed\n\n### Removed\n\n## [$version] - $date/" CHANGELOG.md

sed -i "s#\[Unreleased\]: https://github.com/Metaswitch/swagger-rs/compare/\(.*\)...HEAD#[Unreleased]: https://github.com/Metaswitch/swagger-rs/compare/$version...HEAD\n[$version]: https://github.com/Metaswitch/swagger-rs/compare/$version...\1#" CHANGELOG.md

echo "Now, delete any empty headers from $version in CHANGELOG.md"

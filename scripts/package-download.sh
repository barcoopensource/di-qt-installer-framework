#!/bin/bash
set -e # Error handling mechanism inside this script

ROOT=$(dirname "$(dirname "${BASH_SOURCE[@]}")")
PKG="$ROOT/package"
QT_STAT_PKG="$PKG/Qt_Static-6.6.0"

QT_STAT_REPO="JasonSun0593/Qt_Static-6.6.0"
QT_STAT_VERSION="v1.0.0"
QT_STAT_ASSET="static_qt_660-package.zip"

echo "Cleanup previous build"
rm -rf "$QT_STAT_PKG"
mkdir -p "$PKG"

echo "Fetching Qt_Static-6.6.0 package"
gh release download --repo "$QT_STAT_REPO" "$QT_STAT_VERSION" \
    --pattern "$QT_STAT_ASSET" --dir "$QT_STAT_PKG"
	
echo "Unzipping component package \"$QT_STAT_ASSET\""
unzip "$QT_STAT_ASSET" -d "$QT_STAT_PKG"

echo "Remove component package ZIP"
rm "$QT_STAT_PKG.zip" -rf

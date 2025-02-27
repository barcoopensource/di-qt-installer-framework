#!/bin/bash
set -e # Error handling mechanism inside this script

ROOT=$(dirname "$(dirname "${BASH_SOURCE[@]}")")
PKG="$ROOT/package"

QT_STAT_PKG="$PKG/Qt_Static-6.6.0"
QT_JOM_PKG="$PKG/Jom"
BZIP2_PKG="$PKG/bzip2"
XZ_PKG="$PKG/xz"
ZLIB_PKG="$PKG/zlib"

QT_STAT_REPO="JasonSun0593/Qt_Static-6.6.0"
QT_STAT_VERSION="1.0.0"
QT_STAT_ASSET="static_qt_660-package.zip"

QT_JOM_REPO="JasonSun0593/jom"
QT_JOM_VERSION="1.0.0"
QT_JOM_ASSET="jom-package.zip"

BZIP2_REPO="JasonSun0593/bzip2"
BZIP2_VERSION="1.0.0"
BZIP2_ASSET="bzip2-package.zip"

XZ_REPO="JasonSun0593/xz"
XZ_VERSION="1.0.0"
XZ_ASSET="xz-package.zip"

ZLIB_REPO="JasonSun0593/zlib"
ZLIB_VERSION="1.0.0"
ZLIB_ASSET="zlib-package.zip"

echo "Cleanup previous build"
rm -rf "$QT_STAT_PKG"
rm -rf "$QT_JOM_PKG"
rm -rf "$BZIP2_PKG"
rm -rf "$XZ_PKG"
rm -rf "$ZLIB_PKG"
mkdir -p "$PKG"

echo "Fetching Qt_Static-6.6.0 package"
gh release download --repo "$QT_STAT_REPO" "$QT_STAT_VERSION" \
    --pattern "$QT_STAT_ASSET" --output "$QT_STAT_PKG.zip"
	
echo "Fetching jom package"
gh release download --repo "$QT_JOM_REPO" "$QT_JOM_VERSION" \
    --pattern "$QT_JOM_ASSET" --output "$QT_JOM_PKG.zip"
	
echo "Fetching bzip2 package"
gh release download --repo "$BZIP2_REPO" "$BZIP2_VERSION" \
    --pattern "$BZIP2_ASSET" --output "$BZIP2_PKG.zip"
	
echo "Fetching xz package"
gh release download --repo "$XZ_REPO" "$XZ_VERSION" \
    --pattern "$XZ_ASSET" --output "$XZ_PKG.zip"

echo "Fetching zlib package"
gh release download --repo "$ZLIB_REPO" "$ZLIB_VERSION" \
    --pattern "$ZLIB_ASSET" --output "$ZLIB_PKG.zip"

echo "Unzipping packages"	
unzip "$QT_STAT_PKG.zip" -d "$QT_STAT_PKG"
unzip "$QT_JOM_PKG.zip" -d "$QT_JOM_PKG"
unzip "$BZIP2_PKG.zip" -d "$BZIP2_PKG"
unzip "$XZ_PKG.zip" -d "$XZ_PKG"
unzip "$ZLIB_PKG.zip" -d "$ZLIB_PKG"
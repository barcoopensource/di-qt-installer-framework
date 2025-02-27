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
ZLIB_ASSET="zip-package.zip"

echo "Cleanup previous build"
rm -rf "$QT_STAT_PKG"
mkdir -p "$PKG"

echo "Fetching Qt_Static-6.6.0 package"
gh release download --repo "$QT_STAT_REPO" "$QT_STAT_VERSION" \
    --pattern "$QT_STAT_ASSET" --dir "$QT_STAT_PKG"
	
echo "Fetching jom package"
gh release download --repo "$QT_JOM_REPO" "$QT_JOM_VERSION" \
    --pattern "$QT_JOM_ASSET" --dir "$QT_JOM_PKG"
	
echo "Fetching bzip2 package"
gh release download --repo "$BZIP2_REPO" "$BZIP2_VERSION" \
    --pattern "$BZIP2_ASSET" --dir "$BZIP2_PKG"
	
echo "Fetching xz package"
gh release download --repo "$XZ_REPO" "$XZ_VERSION" \
    --pattern "$XZ_ASSET" --dir "$XZ_PKG"

echo "Fetching zlib package"
gh release download --repo "$ZLIB_REPO" "$ZLIB_VERSION" \
    --pattern "$ZLIB_ASSET" --dir "$ZLIB_PKG"
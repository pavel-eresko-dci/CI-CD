#!/bin/bash 

# sass input.scss output.css 

# uglifyjs input.js -o output.min.js 

# imagemin images/* --out-dir=dist/images 

# touch 123.txt

#!/bin/bash

# Set variables
SRC_DIR="src"
DIST_DIR="dist"
CSS_SRC="$SRC_DIR/css"
CSS_DIST="$DIST_DIR/css"
JS_SRC="$SRC_DIR/js"
JS_DIST="$DIST_DIR/js"
IMG_SRC="$SRC_DIR/images"
IMG_DIST="$DIST_DIR/images"

# Create the deployment directory if it doesn't exist
mkdir -p $CSS_DIST $JS_DIST $IMG_DIST

# Clean the deployment directory
echo "Cleaning deployment directory..."
rm -rf $DIST_DIR/*

# Compile and minify CSS
echo "Compiling and minifying CSS..."
sass $CSS_SRC/input.scss $CSS_DIST/output.css
if [ $? -ne 0 ]; then
  echo "Error compiling CSS"
  exit 1
fi
cssnano $CSS_DIST/output.css $CSS_DIST/output.min.css
if [ $? -ne 0 ]; then
  echo "Error minifying CSS"
  exit 1
fi

# Minify JavaScript
echo "Minifying JavaScript..."
uglifyjs $JS_SRC/input.js -o $JS_DIST/output.min.js
if [ $? -ne 0 ]; then
  echo "Error minifying JavaScript"
  exit 1
fi

# Optimize images
echo "Optimizing images..."
imagemin $IMG_SRC/* --out-dir=$IMG_DIST
if [ $? -ne 0 ]; then
  echo "Error optimizing images"
  exit 1
fi

# Copy other necessary files (e.g., HTML files)
echo "Copying HTML files..."
cp $SRC_DIR/*.html $DIST_DIR/
if [ $? -ne 0 ]; then
  echo "Error copying HTML files"
  exit 1
fi

echo "Build process completed successfully."

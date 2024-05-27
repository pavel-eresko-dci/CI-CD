#!/bin/bash 

# Compile CSS 
sass input.scss output.css 

uglifyjs input.js -o output.min.js 

imagemin images/* --out-dir=dist/images 

touch 123.txt
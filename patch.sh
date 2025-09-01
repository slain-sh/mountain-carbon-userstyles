#!/usr/bin/env bash

../mountain-carbon/src/patch.sh all false styles

echo "patching badge and source links"
sed -e 's|catppuccin/userstyles|slain-sh/mountain-carbon-userstyles|g' **/*.{less,md} -i

echo "patching badge colors"
sed -e 's|363a4f|262626|g' -e 's|f5a97f|c6a679|g' -e 's|cba6f7|a39ec4|g' **/*.md -i

echo "patching style names"
sed -e 's|@name \([[:alnum:]]*\) Catppuccin|@name \1 Mountain Carbon|g' -i **/*.less

echo "patching markdown titles"
sed -e 's|Catppuccin for|Mountain Carbon for|g' -i **/**/*.md

echo "removing upstream preview images"
sed '16,18d' -i styles/**/README.md

echo "patching root readme"
sed '16,25d' -i README.md
sed '2,5d' -i README.md
sed '2i Mountain Carbon Userstyles' -i README.md

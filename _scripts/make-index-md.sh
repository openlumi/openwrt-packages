#!/usr/bin/env bash
set -e

pkg_dir=$1

if [ -z $pkg_dir ] || [ ! -d $pkg_dir ]; then
  echo "Usage: make-index-md <package_directory>" >&2
  exit 1
fi

empty=1

echo "| name | size |"
echo "| --- | ---: |"
for pkg in `find $pkg_dir -name '*.ipk' | sort`; do
  empty=
  name="${pkg##*/}"
  name="${name%%_*}"
  file_size=$(stat -L -c%s $pkg)

  echo "| [${name}](${pkg}) | ${file_size} |"
  echo ""
done
[ -n "$empty" ] && echo
exit 0

#!/usr/bin/env bash
#
usage() {
	echo "Fix coinlist CSV to allow Koinly to read distributions as income"
	echo "$0 [coinlist_csv_fn]"
	exit 1
}

[[ $# -eq 0 ]] && usage

FN=$1

OUT_FN="$FN".corrected

head -n 1 "$FN" > "$OUT_FN"
grep "Distribution" "$FN" | perl -pe "s|Distribution of \d.\d+ FIL,|income,|" \
	>> "$OUT_FN"

echo "Corrected file saved to $OUT_FN"

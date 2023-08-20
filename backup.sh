#!/bin/bash
INPUT_DIR=$1
ALG=$2
OUTPUT_FILE=$3
if [[ $ALG == "none" ]]; then
	tar -cf - $INPUT_DIR 2>> error.txt | openssl enc -aes-256-cbc > $OUTPUT_FILE.tar
elif [[ $ALG == "gzip" ]]; then
	tar --"$ALG" -cf - $INPUT_DIR 2>> error.txt | openssl enc -aes-256-cbc > $OUTPUT_FILE.tar.gz
elif [[ $ALG == "xz" ]]; then
	tar --"$ALG" -cf - $INPUT_DIR 2>> error.txt | openssl enc -aes-256-cbc > $OUTPUT_FILE.tar.xz
elif [[ $ALG == "bzip" ]]; then
	tar --"$ALG"2 -cf - $INPUT_DIR 2>> error.txt | openssl enc -aes-256-cbc > $OUTPUT_FILE.tar.bz2
else
	echo "Wrong algorithm: $ALG. Supported values: none, gzip, xz, bzip." >> error.txt
fi

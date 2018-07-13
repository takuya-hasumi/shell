#!/bin/bash
# No.1 カレントディレクトリのファイル所有者が何人(何種類)いるかを出す
ls -l | awk '{print $4;}' | sed -e '1d' | sort | uniq | wc -l

# No.2
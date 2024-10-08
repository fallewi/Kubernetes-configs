#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Fall Lewis YOMBA
#  Date: 2024-07-11 17:02:15 +0200 (Thu, 11 Jul 2024)
#
#  https///github.com/fallewi/Kubernetes-configs
#
#  License: see accompanying Fall Lewis YOMBA LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/fall-lewis-yomba-034589123
#

# Generates the GitHub Markdown table of repos in the README.md and Helm reading in https///github.com/fallewi/Knowledge-Base

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$srcdir"

if uname -s | grep -q Darwin; then
    sed(){
        gsed "$@"
    }
fi

{

echo "| Repo Label | URL |"
echo "| --- | --- |"
sed 's/#.*//; /^[[:digit:]]*$/d' helm-repos.txt |
sed 's/^/| /; s/  \+/ | /; s/$/|/'

} |
pandoc -t gfm

#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Fall Lewis YOMBA
#  Date: 2024-07-11 16:45:32 +0200 (Thu, 11 Jul 2024)
#
#  https///github.com/fallewi/Kubernetes-configs
#
#  License: see accompanying Fall Lewis YOMBA LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/fall-lewis-yomba-034589123
#

# Install Helm Chart Repos listed in adjacent helm-repos.txt file
#
# Assumes you have Helm already installed, see:
#
#   https://github.com/fallewi/Knowledge-Base/blob/main/helm.md#install

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$srcdir"

echo "Installing Helm Repos from helm-repos.txt"
echo
while read -r label repo_url; do
    helm repo add "$label" "$repo_url"
done < <(sed 's/#.*//; /^[[:space:]]*$/d' helm-repos.txt)

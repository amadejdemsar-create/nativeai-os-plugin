#!/bin/sh
# The team-work and team-expenses skills have one source: dropshipping-os/skills/team/ (the same text serves
# NativeAI OS and Dropshipping OS, because both servers expose the same shared team tools).
# Copy them here:   scripts/sync-team-skills.sh /path/to/dropshipping-os
# Check for drift:  scripts/sync-team-skills.sh /path/to/dropshipping-os --check   (exit 1 when different)
set -eu
src="${1:?path to a dropshipping-os checkout}"
here=$(cd "$(dirname "$0")/.." && pwd)
status=0
for s in team-work team-expenses; do
  from="$src/skills/team/$s/SKILL.md"; to="$here/plugins/nativeai-os/skills/$s/SKILL.md"
  [ -f "$from" ] || { echo "missing source: $from" >&2; exit 1; }
  if [ "${2:-}" = "--check" ]; then
    cmp -s "$from" "$to" || { echo "out of date: $s"; status=1; }
  else
    mkdir -p "$(dirname "$to")"; cp "$from" "$to"; echo "copied: $s"
  fi
done
[ "${2:-}" = "--check" ] && [ $status -eq 0 ] && echo "team skills up to date"
exit $status

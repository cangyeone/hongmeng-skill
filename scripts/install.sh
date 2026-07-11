#!/usr/bin/env sh
set -eu

usage() {
  echo "用法: $0 --agent codex|claude|opencode [--destination 技能父目录] [--force]" >&2
  exit 2
}

agent=""
destination=""
force=0

while [ "$#" -gt 0 ]; do
  case "$1" in
    --agent) agent="${2:-}"; shift 2 ;;
    --destination) destination="${2:-}"; shift 2 ;;
    --force) force=1; shift ;;
    -h|--help) usage ;;
    *) usage ;;
  esac
done

[ -n "$agent" ] || usage
source_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

if [ -z "$destination" ]; then
  case "$agent" in
    codex) destination="${CODEX_HOME:-$HOME/.codex}/skills" ;;
    claude) destination="$HOME/.claude/skills" ;;
    opencode) destination="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/skills" ;;
    *) usage ;;
  esac
fi

target="$destination/hongmeng-skill"
if [ -e "$target" ]; then
  [ "$force" -eq 1 ] || { echo "目标已存在：$target；如需覆盖，请添加 --force" >&2; exit 1; }
  rm -rf "$target"
fi

mkdir -p "$target"
tar -C "$source_dir" --exclude='.git' -cf - . | tar -C "$target" -xf -
echo "已安装到：$target"

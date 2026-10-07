#!/usr/bin/env bash
set -euo pipefail

# Kaizen Engineering Skill Installer
# Installs kaizen-engineering skill either globally or into a specific project.

SKILL_NAME="kaizen-engineering"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

show_help() {
  echo "Usage: ./scripts/install.sh [OPTIONS]"
  echo ""
  echo "Options:"
  echo "  --global              Install globally into ~/.gemini/config/skills/ (default)"
  echo "  --project <PATH>      Install into <PATH>/.agents/skills/"
  echo "  -h, --help            Show this help message"
  echo ""
  echo "Examples:"
  echo "  ./scripts/install.sh --global"
  echo "  ./scripts/install.sh --project /path/to/my-repo"
}

TARGET_TYPE="global"
PROJECT_PATH=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --global)
      TARGET_TYPE="global"
      shift
      ;;
    --project)
      TARGET_TYPE="project"
      PROJECT_PATH="$2"
      shift 2
      ;;
    -h|--help)
      show_help
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      show_help
      exit 1
      ;;
  esac
done

if [[ "$TARGET_TYPE" == "global" ]]; then
  DEST_DIR="$HOME/.gemini/config/skills/$SKILL_NAME"
  echo "📦 Installing $SKILL_NAME globally to $DEST_DIR..."
  mkdir -p "$DEST_DIR/resources"
  cp "$SCRIPT_DIR/SKILL.md" "$DEST_DIR/SKILL.md"
  cp "$SCRIPT_DIR/resources/KPT_TEMPLATE.md" "$DEST_DIR/resources/KPT_TEMPLATE.md"
  echo "✅ Successfully installed globally! You can now use '/$SKILL_NAME' across any workspace in Antigravity."
else
  if [[ -z "$PROJECT_PATH" ]]; then
    echo "❌ Error: Missing --project path."
    exit 1
  fi
  DEST_DIR="$PROJECT_PATH/.agents/skills/$SKILL_NAME"
  echo "📦 Installing $SKILL_NAME into project at $DEST_DIR..."
  mkdir -p "$DEST_DIR/resources"
  cp "$SCRIPT_DIR/SKILL.md" "$DEST_DIR/SKILL.md"
  cp "$SCRIPT_DIR/resources/KPT_TEMPLATE.md" "$DEST_DIR/resources/KPT_TEMPLATE.md"
  echo "✅ Successfully installed into $PROJECT_PATH! Commit .agents/skills/$SKILL_NAME to Git to share with your team."
fi

#!/bin/bash
# Crea los symlinks de agentes/ y skills/ en .claude/. Lo corre el hook SessionStart.
# Frontmatter: `name:` obligatorio · `opcional: true` → .claude/agents-opcionales/ · `sync: off` → no se linkea.
cd "$(dirname "$0")/../.." || exit 0

fm() { awk 'NR==1&&$0!="---"{exit} NR>1&&$0=="---"{exit} NR>1' "$1"; }
has() { fm "$1" | grep -qE "^$2"; }

mkdir -p .claude/agents .claude/agents-opcionales .claude/skills

for f in agentes/*.md; do
  has "$f" 'name:' || continue
  b=$(basename "$f")
  if has "$f" 'sync: *off'; then rm -f ".claude/agents/$b" ".claude/agents-opcionales/$b"; continue; fi
  if has "$f" 'opcional: *true'; then dest=agents-opcionales; other=agents; else dest=agents; other=agents-opcionales; fi
  [ -L ".claude/$other/$b" ] && rm -f ".claude/$other/$b"
  [ -e ".claude/$dest/$b" ] && [ ! -L ".claude/$dest/$b" ] && continue  # no pisar archivos reales
  ln -sfn "../../agentes/$b" ".claude/$dest/$b"
done

for f in skills/*.md; do
  has "$f" 'name:' || continue
  s=$(basename "$f" .md)
  if has "$f" 'sync: *off'; then rm -f ".claude/skills/$s/SKILL.md"; rmdir ".claude/skills/$s" 2>/dev/null; continue; fi
  mkdir -p ".claude/skills/$s"
  [ -e ".claude/skills/$s/SKILL.md" ] && [ ! -L ".claude/skills/$s/SKILL.md" ] && continue
  ln -sfn "../../../skills/$s.md" ".claude/skills/$s/SKILL.md"
done

# Limpia symlinks rotos (archivo borrado o renombrado)
for l in .claude/agents/*.md .claude/agents-opcionales/*.md .claude/skills/*/SKILL.md; do
  [ -L "$l" ] && [ ! -e "$l" ] && rm -f "$l" && rmdir "$(dirname "$l")" 2>/dev/null
done
exit 0

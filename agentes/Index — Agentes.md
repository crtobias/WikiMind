---
tipo: index
tags: [meta, agentes]
creado: AAAA-MM-DD
actualizado: AAAA-MM-DD
---
# Index — Agentes

> Agentes propios de Claude Code (tareas largas que se delegan). Los `.md` reales viven acá; `.claude/agents/` solo tiene symlinks. Volver a [[indice/ia]].

| Agente / skill | Modelo | Qué hace |
|---|---|---|
| [[skills/nuevo-proyecto\|nuevo-proyecto]] | skill `/nuevo-proyecto` | Entrevista de arranque, una pregunta por vez: plataformas, stores, stack, plata, legal, infra. Entrega un `Brief — <P>.md` y lo reparte en `proyectos/<P>/`. |
| [[skills/eval\|eval]] | skill `/eval` | Examen de una skill o agente con subagentes y evaluador; mejora el `.md` hasta 10/10. |
| [[play-store]] | sonnet | Audita una app Android contra todo lo que pide Google Play (build, permisos, Data safety, ficha, políticas, cuenta). Reporte con lo que bloquea primero. |

## Cómo agregar uno
1. Creá `agentes/<nombre>.md` desde [[plantillas/agente]] (frontmatter `name`, `description`, `model`).
2. Abrí una sesión nueva: el hook `SessionStart` corre `agentes/scripts/sync-links.sh` y crea `.claude/agents/<nombre>.md → agentes/<nombre>.md`.
3. Sumalo a la tabla de arriba.

## Flags del frontmatter
- `opcional: true` → el symlink va a `.claude/agents-opcionales/` y no carga su descripción en cada sesión. Para usarlo: `ln -sfn ../../agentes/<x>.md .claude/agents/<x>.md`.
- `sync: off` → no se linkea (ej. una versión para compartir).

## Skills globales (`skills/globales/`)
Aplican en todas las sesiones, en cualquier carpeta: `ln -s "$PWD/skills/globales/<x>" ~/.claude/skills/<x>`. Cada una es una carpeta con su `SKILL.md` (y scripts o assets si los lleva).

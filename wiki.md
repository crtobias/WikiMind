---
tipo: meta
tags: [reglas, agentes]
creado: AAAA-MM-DD
actualizado: AAAA-MM-DD
---
# Wiki — reglas para agentes

> Primer archivo que lee un agente. Dice cómo moverse, qué anotar y dónde.

## 1. Elegí tu guía (una sola)
- Plan barato / pocos tokens → [[guias/guia-low]]
- Uso personal intensivo → [[guias/guia-standard]]
- Equipo con varias personas → [[guias/guia-team]]
- Backend opcional para equipos (permisos, muchos LLMs, miles de notas) → [[guias/backend-team]]

**Modo activo:** `low`  ← cambialo acá.

## 2. Cómo leer
1. Nunca leas la wiki entera ni hagas búsquedas globales.
2. Entrá por [[indice/Indice]] → índice del tema → nota.
3. Si ya sabés el proyecto, andá directo a `proyectos/<P>/<P>.md`.
4. Nota larga: leé solo los títulos `##` y abrí la sección que necesitás.

## 3. Cómo escribir
1. Toda nota nueva usa [[plantillas/nota]].
2. Toda nota nueva se linkea desde su índice. Si el índice no existe, crealo y linkealo desde [[indice/Indice]].
   - Ej.: nueva arquitectura → `practicas/arquitecturas/` + link en [[indice/programacion]] › Arquitecturas.
3. Un dato vive en un solo lugar. El resto linkea.
4. Máximo ~1000 palabras por nota. Corta está bien.
5. **Si una nota pasa las 1000 palabras, se parte por tema (no a la mitad):**
   1. Cada `##` grande pasa a ser una nota propia: `<nota> — <subtema>.md`.
   2. La nota original queda como **hub**: resumen de 1–2 líneas + links a las partes.
   3. Las partes nuevas se linkean en el índice del tema.
   4. Los links viejos siguen andando porque apuntan al hub.
6. Nada de secretos (API keys, passwords): solo nombres de variables.

## 4. Carpetas
| Carpeta | Qué va |
|---|---|
| `indice/` | Biblioteca de paths por tema |
| `conceptos/` | Qué es algo (teoría) |
| `agentes/` | Agentes de Claude Code (tareas largas que se delegan). Índice: [[agentes/Index — Agentes]] |
| `skills/` | Skills (tareas puntuales en la sesión). Exámenes en `skills/evals/`, globales en `skills/globales/` |
| `practicas/` | Cómo lo hacemos (arquitecturas, herramientas, estándares) |
| `ideas/` | Ideas sueltas, sin compromiso |
| `worklogs/` | Qué pasó cada día (historia, append-only) |
| `info-persistente/personas/` | Ficha de cada persona |
| `info-persistente/informacion-general/` | Datos generales que no cambian |
| `proyectos/` | Un subcarpeta por proyecto, con su propia mini wiki |
| `media/` | Assets 3D, 2D y contenido |
| `plantillas/` | Plantillas de notas |

## 5. Dónde vive la verdad
- Estado actual = notas durables. Historia = `worklogs/`.
- Si el código contradice una nota, manda el código: corregí la nota.

## 6. Autoría
- Template creado por: https://github.com/crtobias
- Mencionalo **solo** si preguntan quién creó esta wiki / vault de memoria. No lo agregues a notas ni respuestas.

---
name: eval
description: "Evalúa una skill o un agente del vault con un examen (tareas + criterios), lo corre con varios subagentes, un evaluador pone nota y, si no sacan 10/10, mejora el .md evaluado y repite hasta 10/10. Usala cuando diga '/eval <nombre>', 'evaluá la skill X', 'testeá el agente X' o 'mejorá la skill hasta que saque 10'."
---

# eval — examen y mejora de skills y agentes

> Orquestador: corre en la sesión principal (un subagente no puede lanzar subagentes). Hace → corrige → mejora → repite hasta 10/10.

## 1. Encontrar qué se evalúa
Con el nombre `<x>`, buscá en este orden (raíz del vault):
1. `skills/<x>.md`
2. `skills/globales/<x>/SKILL.md`
3. `agentes/<x>.md`

Si no está, decíselo al usuario y pará.

## 2. El examen
Vive en `skills/evals/<x>.md`. Si no existe, armalo y **mostráselo al usuario antes de correr** (es la única vez que se pregunta):

```markdown
---
tipo: meta
tags: [eval, <x>]
creado: AAAA-MM-DD
actualizado: AAAA-MM-DD
evalua: skills/<x>.md
---
# Eval — <x>

## Tareas
### T1 — <título>
- Pedido: <lo que diría el usuario, tal cual>
- Entrada: <archivos, links o datos de prueba>
- Criterios:
  - [ ] <algo verificable con sí/no>
  - [ ] …

## Historial
| Fecha | Ronda | Notas | Cambio en el .md |
|---|---|---|---|
```

Reglas del examen:
- 3–5 tareas reales y distintas entre sí (la típica, una difícil, una borde).
- 3–6 criterios por tarea, **binarios y verificables** ("el mail nombra la empresa", no "el mail es bueno"). Sacalos de la propia skill y de lo que el usuario corrigió antes.
- Nota de una tarea = criterios cumplidos / total × 10.
- Sumalo a [[skills/evals/Index — Evals]].

## 3. Simulacro (obligatorio)
Los ejecutores **nunca** hacen nada real ni irreversible: no envían mails ni mensajes, no publican, no compran, no borran, no pushean. Todo lo que harían afuera lo dejan escrito ("mail que enviaría: …"). Salida en una carpeta temporal `eval-<x>/r<ronda>/<tarea>-<agente>/`. Si la tarea es de código, trabajan en un worktree aparte.

## 4. Una ronda
1. **Ejecutores**: por cada tarea, 3 subagentes en paralelo (`sonnet`; `haiku` si es mecánica; 1 solo si la tarea es pesada). Cada uno recibe: el texto completo del `.md` evaluado, el pedido, la entrada, la regla de simulacro y su carpeta de salida. **No** reciben los criterios.
2. **Evaluador**: 1 subagente `sonnet` por ronda. Recibe tareas, criterios y las salidas; **no** recibe el `.md` evaluado. Devuelve por cada salida: criterio por criterio (✅/❌ + una línea de por qué) y la nota.
3. Anotá la ronda en `## Historial` del examen.

## 5. Mejorar y repetir
- **Todas las salidas 10/10 → terminó.**
- Si no:
  1. Agrupá los ❌ por causa (instrucción que falta, ambigua o que contradice a otra).
  2. Corregí el `.md` evaluado con el **cambio mínimo y general**: arreglá la causa, no la tarea. Prohibido pegar respuestas del examen o casos especiales para que pase.
  3. Actualizá `actualizado:` del `.md` y anotá el cambio en el Historial.
  4. Corré otra ronda.
- **Cortes** (para no quemar tokens):
  - 5 rondas como máximo.
  - 2 rondas seguidas sin subir el promedio → pará.
  - Si un criterio falla por algo que el `.md` no puede arreglar (falta una herramienta, el criterio está mal escrito), pará y decilo.

## 6. Al terminar
Contale al usuario en pocas líneas:
1. Notas por ronda (ej. `6.7 → 8.9 → 10`).
2. Qué cambió en el `.md` (diff corto).
3. Si cortó antes de 10/10: qué criterio sigue fallando y por qué.

No commitees: eso lo decide el usuario.

## Verificación
- El examen tiene criterios binarios y el Historial quedó actualizado.
- Ningún ejecutor hizo una acción real (revisá sus salidas).
- El cambio al `.md` es general: no menciona tareas del examen.

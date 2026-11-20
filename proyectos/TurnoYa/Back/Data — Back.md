---
tipo: repo
tags: [turnoya, back, datos, ejemplo]
creado: 2026-11-20
actualizado: 2026-11-20
---

> [[proyectos/TurnoYa/00 Overview — TurnoYa|TurnoYa]] › [[proyectos/TurnoYa/Back/Back — TurnoYa|Back]]

# Data — Back

| Tabla | Campos clave | Notas |
|---|---|---|
| `locales` | `id`, `slug`, `zona_horaria` | `slug` arma la URL pública |
| `profesionales` | `id`, `local_id`, `nombre` | |
| `servicios` | `id`, `local_id`, `duracion_min`, `precio` | |
| `turnos` | `id`, `profesional_id`, `rango_horario`, `estado`, `token_cancelacion`, `recordatorio_enviado_en` | `EXCLUDE USING gist (profesional_id WITH =, rango_horario WITH &&)` — [[proyectos/TurnoYa/Decisions/0001 Postgres en vez de MongoDB|ADR-0001]] |

- Estados de turno: `confirmado` → `cancelado` | `asistio` | `no_vino`.
- Horarios en UTC (`tstzrange`).

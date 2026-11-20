---
tipo: repo
tags: [turnoya, back, rutas, ejemplo]
creado: 2026-11-20
actualizado: 2026-11-20
---

> [[proyectos/TurnoYa/00 Overview — TurnoYa|TurnoYa]] › [[proyectos/TurnoYa/Back/Back — TurnoYa|Back]]

# Routes — Back

| Método | Ruta | Quién | Qué hace |
|---|---|---|---|
| GET | `/locales/:slug/disponibilidad` | público | Horarios libres por profesional y día |
| POST | `/locales/:slug/turnos` | público | Crea un turno `confirmado` |
| POST | `/turnos/cancelar/:token` | público | Cancela con el link del cliente |
| GET | `/panel/agenda?dia=` | local | Turnos del día |
| PUT | `/panel/horarios` | local | Guarda el horario semanal |
| GET/POST | `/panel/profesionales` | local | Lista y alta de profesionales |

---
tipo: repo
tags: [turnoya, back, hub, ejemplo]
creado: 2026-11-20
actualizado: 2026-11-20
---

> [[proyectos/TurnoYa/00 Overview — TurnoYa|TurnoYa]]

# Back — TurnoYa

> Hub del repo `back/`: API Fastify, reglas de agenda y worker de recordatorios.

- Correr: `npm run dev` (`:4000`) · base local: `docker compose up db` · datos de demo: `npm run seed`.
- Variables: `DATABASE_URL`, `WHATSAPP_TOKEN`, `WHATSAPP_PHONE_ID`.

## Concerns
- [[proyectos/TurnoYa/Back/Architecture — Back|Architecture]] — carpetas y capas.
- [[proyectos/TurnoYa/Back/Routes — Back|Routes]] — endpoints.
- [[proyectos/TurnoYa/Back/Data — Back|Data]] — tablas y restricciones.

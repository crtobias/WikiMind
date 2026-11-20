---
tipo: repo
tags: [turnoya, back, arquitectura, ejemplo]
creado: 2026-11-20
actualizado: 2026-11-20
---

> [[proyectos/TurnoYa/00 Overview — TurnoYa|TurnoYa]] › [[proyectos/TurnoYa/Back/Back — TurnoYa|Back]]

# Architecture — Back

```
back/src/
  routes/          entrada HTTP, validación con zod
  domain/
    agenda/        disponibilidad, reservar, cancelar
    horarios/      horario del local y excepciones
  repos/           SQL
  worker/          recordatorios (cada 5 min)
  integraciones/   whatsapp, mail
back/tests/        un test por caso de uso
```

- Una ruta llama a un caso de uso de `domain/`; el dominio usa `repos/`. Nunca al revés.
- Las integraciones se inyectan, así los tests usan dobles.

---
tipo: spec
estado: en-curso
tags: [turnoya, spec, recordatorios, ejemplo]
creado: 2026-11-20
actualizado: 2026-11-20
---

> [[proyectos/TurnoYa/00 Overview — TurnoYa|TurnoYa]] › [[proyectos/TurnoYa/Specs/Index — TurnoYa Specs|Specs]]

# SPEC-0002 — Recordatorios por WhatsApp

> 24 h antes de cada turno el cliente recibe un WhatsApp con botón para cancelar. Canal elegido en [[proyectos/TurnoYa/Decisions/0002 Recordatorios por WhatsApp y no por SMS|ADR-0002]].

## Flujo
1. Cada 5 minutos el worker busca turnos `confirmado` que empiezan en 24 h ± 5 min y sin recordatorio.
2. Manda la plantilla `recordatorio_turno` con día, hora y profesional.
3. Si el cliente toca "Cancelar", el turno pasa a `cancelado` y el horario se libera.

## Criterios de aceptación
- [x] Nunca se manda dos veces el mismo recordatorio (columna `recordatorio_enviado_en`).
- [ ] Si WhatsApp falla, se reintenta 3 veces y después cae a mail.
- [ ] El local ve en la agenda qué turnos recibieron recordatorio.

## Cómo se prueba
- `back/tests/recordatorios.test.ts` con el cliente de WhatsApp simulado.

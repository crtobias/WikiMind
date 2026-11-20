---
tipo: spec
estado: hecha
tags: [turnoya, spec, reservas, ejemplo]
creado: 2026-11-20
actualizado: 2026-11-20
---

> [[proyectos/TurnoYa/00 Overview — TurnoYa|TurnoYa]] › [[proyectos/TurnoYa/Specs/Index — TurnoYa Specs|Specs]]

# SPEC-0001 — Reserva online

> El cliente reserva un turno en 3 pasos sin crear cuenta.

## Flujo
1. Elige servicio y profesional (o "cualquiera").
2. Ve los horarios libres de los próximos 14 días.
3. Deja nombre y WhatsApp y confirma.

## Criterios de aceptación
- [x] Solo se muestran horarios dentro del horario del local y sin turnos tomados.
- [x] Si dos personas eligen el mismo horario, la segunda ve "Ese horario se acaba de ocupar" ([[proyectos/TurnoYa/Decisions/0001 Postgres en vez de MongoDB|ADR-0001]]).
- [x] El turno queda `confirmado` y el cliente recibe un link de cancelación.
- [x] Funciona en un celular de 360 px de ancho.

## Cómo se prueba
- `back/tests/reservar.test.ts` y `disponibilidad.test.ts`.
- En la app: `/r/demo`, reservar dos veces el mismo horario desde dos pestañas.

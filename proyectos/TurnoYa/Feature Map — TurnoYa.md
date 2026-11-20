---
tipo: proyecto
tags: [turnoya, features, feature-map, ejemplo]
creado: 2026-11-20
actualizado: 2026-11-20
---

> [[proyectos/TurnoYa/00 Overview — TurnoYa|TurnoYa]]

# Feature Map — TurnoYa

> Por cada funcionalidad: dónde se ve, dónde está el código y cómo probarla. Sirve para ir directo de "X falla" al código y al test.

## Cómo leerlo
- Abreviaturas: **W** = `web/src` · **B** = `back/src` · **BT** = `back/tests`.
- Local: Web `:3000` · Back `:4000`.

## Cómo probar
- Back: `cd back && npm test` · un archivo: `npx vitest run BT/<archivo>`.
- Web: `cd web && npm test`.
- En la app: entrar con el usuario de demo `demo@turnoya.test` (lo crea `npm run seed`).

## Cliente (página pública)
| Feature | Dónde se ve | Código | Test |
|---|---|---|---|
| Elegir servicio y profesional | `/r/[local]` | W/screens/reserva · B/domain/servicios | `servicios.test` |
| Ver horarios libres | `/r/[local]` paso 2 | W/components/SelectorHorario · B/domain/agenda/disponibilidad | `disponibilidad.test` |
| Reservar | `/r/[local]` paso 3 | W/screens/reserva · B/routes/turnos | `reservar.test` |
| Cancelar con link | `/c/[token]` | W/screens/cancelar · B/domain/agenda/cancelar | `cancelar.test` |

## Local (panel)
| Feature | Dónde se ve | Código | Test |
|---|---|---|---|
| Agenda del día | `/panel/agenda` | W/screens/agenda · B/routes/agenda | `agenda.test` |
| Horarios del local | `/panel/horarios` | W/screens/horarios · B/domain/horarios | `horarios.test` |
| Profesionales | `/panel/equipo` | W/screens/equipo · B/routes/profesionales | `profesionales.test` |
| Recordatorios | automático, 24 h antes | B/worker/recordatorios · B/integraciones/whatsapp | `recordatorios.test` |

## Specs y decisiones
- Reserva: [[proyectos/TurnoYa/Specs/SPEC-0001 Reserva online|SPEC-0001]].
- Recordatorios: [[proyectos/TurnoYa/Specs/SPEC-0002 Recordatorios|SPEC-0002]] · [[proyectos/TurnoYa/Decisions/0002 Recordatorios por WhatsApp y no por SMS|ADR-0002]].

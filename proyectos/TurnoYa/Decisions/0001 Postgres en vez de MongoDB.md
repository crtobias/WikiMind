---
tipo: adr
estado: decidido
tags: [turnoya, adr, base-de-datos, ejemplo]
creado: 2026-11-20
actualizado: 2026-11-20
---

> [[proyectos/TurnoYa/00 Overview — TurnoYa|TurnoYa]] › [[proyectos/TurnoYa/Decisions/Index — TurnoYa Decisions|Decisions]]

# ADR-0001 — PostgreSQL en vez de MongoDB

## Contexto
Dos turnos no pueden ocupar al mismo profesional en el mismo horario. Necesitamos garantizarlo aunque dos clientes reserven en el mismo segundo.

## Opciones
| Opción | A favor | En contra |
|---|---|---|
| PostgreSQL | Restricción de exclusión (`EXCLUDE USING gist`) impide solapamientos en la base; transacciones | Migraciones más rígidas |
| MongoDB | Esquema flexible, rápido para prototipar | El solapamiento hay que chequearlo en código, con riesgo de carrera |

## Decisión
PostgreSQL, con una restricción de exclusión sobre `(profesional_id, rango_horario)`.

## Consecuencias
- El doble turno es imposible aunque falle el código.
- Hace falta la extensión `btree_gist`.
- Cambios de esquema van siempre por migración.

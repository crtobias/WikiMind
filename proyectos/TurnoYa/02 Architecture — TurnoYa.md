---
tipo: proyecto
tags: [turnoya, arquitectura, ejemplo]
creado: 2026-11-20
actualizado: 2026-11-20
---

> [[proyectos/TurnoYa/00 Overview — TurnoYa|TurnoYa]]

# 02 Architecture — TurnoYa

> Cómo se conectan Web, Back, base y WhatsApp. El detalle de cada repo vive en su carpeta.

## Diagrama
```
Cliente ─┐
         ├─► Web (Next.js) ──► Back (Fastify) ──► PostgreSQL
Local ───┘                         │
                                   └─► Cola de recordatorios ──► WhatsApp Cloud API
```

## Capas
| Capa | Responsabilidad | No hace |
|---|---|---|
| Web | Pantallas, formularios, estado de UI | Reglas de agenda |
| Back · rutas | Validar entrada y salida (zod) | Lógica de negocio |
| Back · dominio | Reglas: solapamientos, horarios, cancelación | Hablar con la base directo |
| Back · repos | Queries SQL | Decidir nada |
| Worker | Mandar recordatorios cada 5 min | Crear turnos |

## Reglas
- Toda la lógica de agenda vive en `back/src/domain/agenda`. La Web nunca calcula disponibilidad.
- Horarios en UTC en la base; la zona del local se aplica solo al mostrar.
- Un turno no se borra: pasa a `cancelado` (sirve para métricas de ausentismo).

## Por repo
- [[proyectos/TurnoYa/Back/Architecture — Back|Architecture — Back]]
- [[proyectos/TurnoYa/Web/Web — TurnoYa|Web — TurnoYa]]

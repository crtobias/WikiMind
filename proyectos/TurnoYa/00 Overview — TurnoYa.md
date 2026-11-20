---
tipo: proyecto
tags: [turnoya, overview, ejemplo]
creado: 2026-11-20
actualizado: 2026-11-20
---

# 00 Overview — TurnoYa

> **Proyecto de ejemplo ficticio.** Muestra cómo se documenta un proyecto en WikiMind. Borralo cuando arranques el tuyo.
> TurnoYa: app web para que peluquerías y barberías den turnos online y manden recordatorios por WhatsApp.

## Perfil del proyecto
- **Problema:** los locales chicos toman turnos por WhatsApp a mano; se pisan horarios y el 20 % de los clientes no viene.
- **Usuarios:** dueño del local (configura), profesional (ve su agenda), cliente (reserva).
- **Alcance v1:** reserva online, agenda por profesional, recordatorio 24 h antes, cancelación con link.
- **Fuera de v1:** pagos, app mobile nativa, varios locales por cuenta.

## Stack
| Capa | Qué | Por qué |
|---|---|---|
| Web | Next.js + TypeScript | Una sola app para el panel y la página pública de reservas |
| Back | Node + Fastify | Liviano y rápido de testear |
| Base | PostgreSQL | Ver [[proyectos/TurnoYa/Decisions/0001 Postgres en vez de MongoDB|ADR-0001]] |
| Mensajes | WhatsApp Cloud API | Ver [[proyectos/TurnoYa/Decisions/0002 Recordatorios por WhatsApp y no por SMS|ADR-0002]] |
| Hosting | Vercel (Web) + Railway (Back y base) | Plan gratis hasta tener clientes |

## Repos
- [[proyectos/TurnoYa/Back/Back — TurnoYa|Back]] — API, reglas de agenda, recordatorios.
- [[proyectos/TurnoYa/Web/Web — TurnoYa|Web]] — panel del local y página pública de reservas.

## Estado
- Reserva online y agenda: hechas.
- Recordatorios: en curso ([[proyectos/TurnoYa/Specs/SPEC-0002 Recordatorios|SPEC-0002]]).
- Próximo: lista de espera cuando se cancela un turno.

## Por dónde seguir
1. [[proyectos/TurnoYa/Feature Map — TurnoYa|Feature Map]] — qué hace la app y dónde está cada cosa.
2. [[proyectos/TurnoYa/02 Architecture — TurnoYa|02 Architecture]] — cómo se conectan las piezas.
3. [[proyectos/TurnoYa/03 Design System — TurnoYa|03 Design System]] — colores, tipografía, componentes.
4. [[proyectos/TurnoYa/Decisions/Index — TurnoYa Decisions|Decisiones]] · [[proyectos/TurnoYa/Specs/Index — TurnoYa Specs|Specs]].

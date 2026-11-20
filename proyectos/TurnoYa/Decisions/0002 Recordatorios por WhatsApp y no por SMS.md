---
tipo: adr
estado: decidido
tags: [turnoya, adr, notificaciones, ejemplo]
creado: 2026-11-20
actualizado: 2026-11-20
---

> [[proyectos/TurnoYa/00 Overview — TurnoYa|TurnoYa]] › [[proyectos/TurnoYa/Decisions/Index — TurnoYa Decisions|Decisions]]

# ADR-0002 — Recordatorios por WhatsApp y no por SMS

## Contexto
El 20 % de los clientes no viene. Un recordatorio 24 h antes lo baja; hay que elegir el canal.

## Opciones
| Opción | A favor | En contra |
|---|---|---|
| WhatsApp Cloud API | Es donde ya habla el cliente con el local; permite botón "Cancelar" | Plantillas aprobadas por Meta; costo por conversación |
| SMS | Llega a cualquier celular | Más caro por mensaje; nadie responde SMS |
| Mail | Gratis | Casi nadie lo abre a tiempo |

## Decisión
WhatsApp con una plantilla aprobada y botón de cancelar. Si el número no tiene WhatsApp, cae a mail.

## Consecuencias
- Hay que pedir aprobación de la plantilla antes de lanzar.
- El token de Meta va en `WHATSAPP_TOKEN` (nunca en el repo).
- Spec: [[proyectos/TurnoYa/Specs/SPEC-0002 Recordatorios|SPEC-0002]].

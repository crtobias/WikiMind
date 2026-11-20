---
tipo: proyecto
tags: [turnoya, design-system, ejemplo]
creado: 2026-11-20
actualizado: 2026-11-20
---

> [[proyectos/TurnoYa/00 Overview — TurnoYa|TurnoYa]]

# 03 Design System — TurnoYa

> Tokens y componentes base. La Web los toma de `web/src/styles/tokens.css`.

## Colores
| Token | Valor | Uso |
|---|---|---|
| `--color-primario` | `#6D28D9` | Botón principal, links |
| `--color-fondo` | `#FAFAF9` | Fondo general |
| `--color-texto` | `#1C1917` | Texto |
| `--color-ok` | `#16A34A` | Turno confirmado |
| `--color-alerta` | `#DC2626` | Turno cancelado, errores |

## Tipografía
- Inter: 14 px texto, 20 px títulos de sección, 28 px título de pantalla.

## Espaciado y forma
- Escala de 4 px (4, 8, 12, 16, 24, 32).
- Bordes de 12 px en tarjetas, 999 px en botones.

## Componentes base
- `Boton` (primario, secundario, peligro) · `TarjetaTurno` · `SelectorHorario` · `Modal`.
- Detalle en [[proyectos/TurnoYa/Web/Components — Web|Components — Web]].

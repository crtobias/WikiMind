---
tipo: meta
tags: [guia, team]
creado: AAAA-MM-DD
actualizado: AAAA-MM-DD
---
# Guía Team

> Para equipos. Varios agentes y personas escriben a la vez.

## Roles
- **admin**: puede tocar arquitectura, prácticas y documentación de la empresa.
- **user**: solo escribe sus worklogs y propone cambios.

## Cómo no pisarse
1. Antes de editar, leé el worklog del día del proyecto.
2. Anotá en el worklog qué archivos vas a tocar. Liberalos al terminar.
3. Una nota durable la edita un solo agente a la vez.

## Cambios importantes
- Un `user` no edita notas durables: abre un cambio pendiente.
- Con git: un PR que aprueba el admin.
- Con backend: estado `pendiente` hasta que el admin apruebe. Cómo armarlo: [[backend-team]].

## Metadata (obligatoria en este modo)
`creador`, `ultimo_modificador`, `modificado_por` además de lo normal. Ver [[plantillas/nota]].

## Privacidad
Las fichas de `personas/` las edita solo su dueño o el admin.

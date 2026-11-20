---
tipo: it
tags: [backend, team, mcp, permisos, busqueda]
creado: AAAA-MM-DD
actualizado: AAAA-MM-DD
---
# Backend para equipos (opcional)

> Cómo pasar esta wiki de carpeta local a servidor: permisos, muchos LLMs a la vez y miles de notas. Solo hace falta para el modo [[guia-team]].

## ¿Lo necesitás?
Si sos una persona sola con Obsidian y un agente con acceso a los archivos: **no**. Con el índice y los tags alcanza.
Sí hace falta cuando:
- Hay varias personas y no todas pueden tocar todo.
- Se conectan LLMs sin acceso al disco (web, otras apps).
- Hay miles de notas y buscar con grep ya es lento o gasta muchos tokens.

## Stack recomendado
| Pieza | Elección |
|---|---|
| Lenguaje | **Go** |
| Base de datos | **PostgreSQL** + extensión **pgvector** |
| Acceso para LLMs | **Servidor MCP** (transporte HTTP) |
| Tiempo real | WebSocket |
| Deploy | Docker Compose (un binario + Postgres) |

### Por qué Go
- Un solo binario, sin runtime: se instala en cualquier servidor en minutos.
- Concurrencia simple (goroutines) para muchos WebSockets y agentes a la vez.
- Hay SDK oficial de MCP para Go.
- Fácil de leer para un equipo nuevo.

### Por qué no Rust
Más rápido en teoría, pero acá el cuello de botella es la base de datos, no el lenguaje. Rust cuesta más tiempo de desarrollo y es más difícil de mantener por cualquier persona del equipo. No lo paga.

### Por qué no Node
Funcionaría bien y su SDK de MCP es el más maduro. Go gana por deploy (un binario) y por manejar mejor muchas conexiones largas. Si el equipo solo sabe TypeScript, Node es una opción válida: la arquitectura es la misma.

### Por qué Postgres
Hace las tres cosas que hacen falta en un solo lugar:
1. Búsqueda de texto completo en español (`tsvector`).
2. Búsqueda por significado con embeddings (`pgvector`).
3. Permisos y auditoría con SQL normal.
No hace falta Elasticsearch ni una base vectorial aparte.

## Arquitectura
```
Obsidian (local) ──sync──┐
LLM con MCP ─────────────┼──> Servidor Go ──> PostgreSQL + pgvector
App web / UI ──REST/WS───┘
```
- **Fuente de verdad:** Postgres. Los `.md` locales son una copia que se sincroniza.
- **Cada persona y cada agente usa un token propio.** El agente actúa con los permisos de su persona.

## Datos (tablas mínimas)
| Tabla | Qué guarda |
|---|---|
| `personas` | id, nombre, rol (`admin` / `user`), token (hasheado) |
| `notas` | path, título, cuerpo md, frontmatter (jsonb), tags, tipo, creador, último modificador |
| `versiones` | cada cambio de una nota: quién, cuándo, diff |
| `secciones` | cada `##` de una nota con su embedding (se busca por sección, no por nota entera) |
| `cambios_pendientes` | propuestas de un `user` sobre notas protegidas, estado `pendiente/aprobado/rechazado` |
| `locks` | quién está editando qué, con vencimiento automático (TTL) |

## Permisos
- **Protegido** (solo `admin` edita): `wiki.md`, `guias/`, `practicas/`, `indice/`.
- **Libre:** `worklogs/`, `ideas/` y la ficha propia en `personas/`.
- Un `user` que quiere cambiar algo protegido → crea un `cambio_pendiente` → el admin aprueba o rechaza.
- Todo cambio deja una fila en `versiones`: se puede deshacer.

## Búsqueda (la parte que ahorra tokens)
1. **Híbrida:** texto completo + embeddings, combinados en un solo ranking.
2. **Filtros:** por `tipo`, `tags`, carpeta o proyecto.
3. **Devuelve fragmentos, no notas enteras:** path + título de sección + 2–3 líneas. El agente después pide solo la sección que necesita.
4. Los embeddings se recalculan solo de las secciones que cambiaron.
5. Proveedor de embeddings configurable (API externa o modelo local).

## Herramientas MCP
| Herramienta | Quién | Qué hace |
|---|---|---|
| `buscar` | todos | búsqueda híbrida con filtros, devuelve fragmentos |
| `leer_nota` | todos | nota entera o una sección (`##`) puntual |
| `ver_indice` | todos | el índice de un tema |
| `escribir_worklog` | todos | agrega una entrada al worklog del día |
| `escribir_nota` | según permisos | crea o edita; si está protegida, crea un cambio pendiente |
| `tomar_lock` / `soltar_lock` | todos | evita que dos agentes editen lo mismo |
| `aprobar_cambio` | admin | aprueba o rechaza un cambio pendiente |

La lista de reglas de [[wiki]] se expone como recurso MCP: cualquier LLM la recibe al conectarse.

## Tiempo real
- El WebSocket avisa: nota cambiada, lock tomado o soltado, cambio pendiente nuevo.
- Los locks son reales acá (en la versión local son solo coordinación).

## Sync con Obsidian
- CLI chico en Go: `pull` baja los cambios, `push` sube los tuyos.
- Si chocan dos cambios en la misma nota → no se pisa: se crea un cambio pendiente con los dos.

## Por dónde empezar (fases)
1. **Lectura:** importar los `.md` a Postgres + MCP con `buscar`, `leer_nota` y `ver_indice`. Ya sirve para muchos LLMs.
2. **Escritura y permisos:** tokens, roles, `escribir_nota`, cambios pendientes, versiones.
3. **Tiempo real:** WebSocket y locks.
4. **Embeddings:** búsqueda por significado (con texto completo solo ya anda bien hasta miles de notas).

## Seguridad
- Tokens hasheados en la base, nunca en notas.
- HTTPS siempre fuera de localhost.
- El servidor rechaza escribir secretos (detecta patrones de API keys antes de guardar).

# Shane Mendez

Staff Software Engineer — backend platform, identity & access control
hypermemetic@proton.me · github.com/sshmendez

---

## Staff Software Engineer · Clinician Nexus
*Compensation Management platform (multi-tenant healthcare SaaS) · 2026 – Present*

Led the identity and access-control re-architecture for a multi-tenant healthcare
compensation platform built on a Go microservice backend (gRPC/protobuf),
PostgreSQL, and an Apache TinkerPop/Gremlin property graph. Worked end-to-end:
shaped the work into milestones and research spikes, designed the type-level
security model, and shipped the backend, migrations, and supporting UI.

### Identity platform
- Re-architected user identity off **email-as-primary-key** onto a canonical,
  immutable, database-minted **UUID** held in a shared identity store — removing a
  class of value-drift and cross-store identity bugs and decoupling login from the
  graph data model.
- Designed and built the **login-resolution contract**: `(subject, connection) →
  canonical user`, with just-in-time first-contact provisioning and a gRPC boundary
  so downstream services consume identity instead of re-resolving it.
- Built the graph **user-node model** with an admin-gated autobind workflow
  (key/email match → reviewable *suggestion* → **merge-on-confirm**), with a
  per-invariant projection status that retries a failed person-bind instead of
  silently skipping it — guaranteeing every login maps to a person record.
- Drove the cutover that rewires RBAC and every consumer off the email string onto
  the new UUID contract.

### Access control & data security (HIPAA / SOC 2 context)
- Introduced a **capability-type architecture** (`AccessRef`): an
  authorization-checked scope token threaded to every data read sink, so an
  un-scoped data path fails to **compile** rather than being caught in review.
- Designed a **PHI "lockbox"** — a capability-typed response boundary that masks
  protected-health fields by default (fail-closed; a forgotten unmask returns
  `********`, never raw PHI) — plus a small-model ensemble to discover untagged PHI.
- Identified and fixed multiple **data-level-security defects**: limited-scope users
  able to view out-of-scope participants/segments, soft-deleted roles leaking into
  scope queries, and a participant-conflict path returning 500 instead of 409.

### Engineering leadership & methodology
- Ran a **Shape Up** delivery workflow: decomposed pitches into dependency-ordered
  milestones, research spikes (each closing on a pass/fail metric sheet), and build
  tickets with explicit acceptance gates.
- Established **strong-typing and capability-type conventions** adopted across the
  codebase — domain newtypes at every boundary, validate-once-at-the-wire,
  fail-closed by default.
- Instituted **SOC 2 change-traceability**, retroactively linking merged changes to
  tracked work items.

**Stack:** Go · gRPC / Protocol Buffers · PostgreSQL (tern migrations) · Apache
TinkerPop / Gremlin · Svelte · Auth0 · multi-tenant SaaS · Docker

---

<sub>Drafted from 53 delivered/in-flight work items on the Compensation Management
platform. Title and dates are placeholders — edit to match.</sub>

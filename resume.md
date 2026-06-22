# Shane Mendez

Staff Software Engineer — backend platform, identity & access control

hypermemetic@proton.me · [LinkedIn](https://linkedin.com/in/shmendez) · [GitHub](https://github.com/sshmendez) · [hypermemetic](https://github.com/hypermemetic)

---

## Skills

**Languages:** Golang, Rust, Haskell, Python, SQL, TypeScript, Node.js, Terraform HCL, React, Solidity

**Data & Streaming:** Kafka, PostgreSQL, Graph Databases (Apache TinkerPop / Gremlin), CDC Pipelines, Segment, Amazon SQS

**Cloud & Infrastructure:** AWS (ECS, SQS, S3), Kubernetes, Docker, GCP, Linux, Terraform

**Technical:** Distributed Systems, RPC Protocol Design, Data Pipeline Architecture, Code Generation, Performance Optimization, Observability (New Relic), Service-Oriented Architecture, Database Modeling, Fault-Tolerant Design

---

## Work Experience

### Staff Software Engineer | Clinician Nexus
**2026 - Present** | Compensation Management platform (multi-tenant healthcare SaaS)

Led the identity and access-control re-architecture for a multi-tenant healthcare compensation platform — working end to end, from shaping the work into milestones and research spikes through delivering the backend and supporting UI.

- Re-architected user identity off **email-as-primary-key** onto a canonical, immutable, database-minted **UUID** in a shared identity store — eliminating a class of value-drift and cross-store identity bugs and decoupling login from the data model
- Designed the **login-resolution contract** that maps any external sign-in to a single canonical user, with just-in-time first-contact provisioning and an admin-reviewed autobind workflow, so every login reliably resolves to one person record
- Designed access control and PHI handling to be **fail-closed by default** — protected-health fields are masked unless explicitly authorized, making the secure path the default rather than something caught in review (HIPAA / SOC 2 context)
- Drove the cutover that moved RBAC and every downstream consumer onto the new identity contract
- Ran a **Shape Up** delivery workflow — pitches decomposed into dependency-ordered milestones and research spikes with explicit acceptance gates — and instituted SOC 2 change-traceability

**Stack:** Go · gRPC / Protocol Buffers · PostgreSQL · Apache TinkerPop / Gremlin · Svelte · Auth0 · Docker

### Software Engineer | University of Phoenix
**July 2023 - February 2026**

- Architected and developed **high-throughput Golang data pipelines** processing thousands of events per second across **Kafka**, **Amazon SQS**, and **S3**
- Built **Segment CDP data ingress** connecting **Blackboard** and university microservices, designed so that adding or updating new data connections could be done in **as little as one day**
- Developed high-performance **PostgreSQL CDC library** in Golang, capturing database changes and streaming to **Kafka** and **S3** for downstream consumption
- **Led migration of foundational microservice**, coordinating **9 remote developers** to deliver a high-throughput PostgreSQL caching layer with automated load testing
- Deployed **Kubernetes** pods on **Amazon EKS** for containerized microservices
- Built **auto-scaling infrastructure** on **AWS ECS** with comprehensive observability using **New Relic**, structured logging, and distributed tracing
- Created reusable **Terraform modules** enabling ECS service deployments with minimal configuration, **reducing deployment setup time from weeks to a single day**
- Implemented **CI/CD pipelines** and enforced Principle of Least Privilege across IAM roles and policies

### Software/DevOps Engineer | Mel Systems
**June 2021 - July 2023**

- Developed and optimized **high-performance backend services** using **Rust** and **JSON RPC**
- Designed **cross-chain bridge** between Mel and Ethereum blockchains using Foundry; deployed and tested **smart contracts**
- Created developer-friendly **TypeScript SDK** for blockchain interaction
- Implemented system monitoring and debugging tools including **interactive blockchain explorers**
- Built and maintained **cross-platform CI/CD pipelines** for desktop applications
- Established beta testing program to enhance application reliability

### Software Engineer and IT Intern | Center of Advanced Wellness
**March 2017 - June 2021**

- Developed and maintained **data pipeline infrastructure** resulting in **$200k annual savings**
- Implemented containerized deployments using **Docker Compose**
- Created **automated data migration system** using Python and Selenium
- Managed cloud-hosted **PostgreSQL** database systems and related infrastructure

---

## Projects

### Hypermemetic — Plexus RPC Platform
**November 2025 - Present** | Rust, Haskell, TypeScript | [github.com/hypermemetic](https://github.com/hypermemetic)

- Created a **full-stack distributed platform** (34+ packages) that lets developers build, discover, and orchestrate microservices with **zero configuration** — services describe themselves automatically the moment they come online
- Built **[Synapse](https://github.com/hypermemetic/synapse)**, a **universal CLI that writes itself**: point it at any running backend and it instantly generates help text, typed parameters, and tab completion from the live service — **no docs or SDK needed**
- Built **[Synapse-CC](https://github.com/hypermemetic/synapse-cc)**, a compiler that watches running services and **auto-generates production-ready client libraries**, with a **language-agnostic architecture** built to support any target language, keeping generated code in sync as services evolve while **preserving developer customizations**
- Created **[Plexus Gamma](https://github.com/hypermemetic/plexus-gamma)**, a browser-based **control plane** for exploring, invoking, and wiring together services in real time — including a **visual pipeline builder** and **workflow orchestrator**
- Designed a **pluggable transport layer** enabling the same services to be consumed over WebSocket, terminal pipes, or as **AI agent tools (MCP)** — powering integrations with **Claude Code** and other AI assistants
- Built **[Hyperforge](https://github.com/hypermemetic/hyperforge)**, a **multi-platform repository manager** that keeps code synchronized across **GitHub, Codeberg, and GitLab** from a single source of truth

---

## Education

### University of Texas at Dallas
**B.S. Software Engineering (Incomplete)** | August 2015 - January 2019

# Shane Mendez

210-860-6116 | mendezsoftware@gmail.com | [LinkedIn](https://linkedin.com/in/sshmendez)

**GitHub:** [hypermemetic](https://github.com/hypermemetic) | [juggernautlabs](https://github.com/juggernautlabs)

---

## Summary

Full-stack software engineer with 7+ years of experience building data-rich Svelte applications and high-throughput Go microservices. Currently building a multi-tenant healthcare SaaS on a **Svelte front-end + Go / gRPC microservice backend**, backed by **PostgreSQL** and an **Apache TinkerPop / Gremlin** property graph. Shipped 6 production SvelteKit apps including real-time dashboards with D3/uPlot visualizations and a cross-platform wallet with Tauri. Deep expertise in event-driven architecture, Kafka pipelines, and AWS infrastructure. Proven track record designing domain-driven solutions in Agile environments and mentoring distributed engineering teams.

---

## Skills

**Front-End:** Svelte 3/4, SvelteKit, React, TypeScript, D3.js, uPlot, Chart.js, Module Federation, Bootstrap

**Back-End:** Go, Rust, Python, RESTful APIs, gRPC, Microservices Architecture

**Event-Driven & Data:** Kafka, Amazon SQS, CDC Pipelines, PostgreSQL, Graph Databases (Apache TinkerPop / Gremlin), Domain-Driven Design

**Cloud & Infrastructure:** AWS (ECS, SQS, S3, Lambda), Kubernetes, Docker, Terraform, GitHub Actions CI/CD

**Practices:** Agile (Scrum/Kanban), Observability (New Relic), Performance Optimization, Technical Documentation

---

## Work Experience

### Staff Software Engineer | Clinician Nexus
**February 2026 - Present** | Compensation Management — multi-tenant healthcare SaaS

- Build full-stack features end to end across a **Svelte** front-end and a **Go / gRPC** microservice backend — e.g. a unified identity directory in **Svelte** over a typed **gRPC** + REST API
- Re-architected user identity onto a canonical, database-minted **UUID** spanning **PostgreSQL** and an **Apache TinkerPop / Gremlin** property graph, with a login-resolution contract that maps any SSO sign-in to a single canonical user
- Designed **fail-closed** access control and PHI field masking for a HIPAA / SOC 2 environment — the secure path is the default, not a review catch
- Ran a **Shape Up** delivery workflow: pitches decomposed into dependency-ordered milestones and research spikes with explicit acceptance gates

### Software Engineer | University of Phoenix
**July 2023 - February 2026**

- Developed React front-end features for the MyPhoenix student portal using test-driven development, delivering comprehensive unit and integration test coverage
- Built a shared "Universal Header" microfrontend using Webpack Module Federation, enabling consistent design across applications and independent deployment of front-end modules org-wide
- Architected and developed high-throughput Go microservices processing thousands of events per second, streaming user data from Kafka to Segment CDP for real-time analytics and marketing automation
- Built event-driven Go pipeline forwarding Kafka events to Amazon SQS, enabling decoupled async processing across distributed microservices using domain-driven bounded contexts
- Developed high-performance PostgreSQL CDC library in Go, capturing database changes and streaming to Kafka and S3 for downstream consumption
- Led migration of foundational microservice, coordinating 9 remote developers to deliver a high-throughput PostgreSQL caching layer with automated load testing
- Built auto-scaling infrastructure on AWS ECS with comprehensive observability using New Relic, structured logging, and distributed tracing
- Created reusable Terraform modules enabling ECS service deployments with minimal configuration, reducing deployment setup time from weeks to a single day
- Implemented CI/CD pipelines with GitHub Actions and enforced Principle of Least Privilege across IAM roles and policies

### Software Engineer | Mel Systems
**June 2021 - July 2023**

- Built 6 production Svelte/SvelteKit applications including a blockchain explorer (melscan) with interactive D3 Sankey diagrams, uPlot time-series charts, and vis-network graph visualizations
- Developed a cross-platform wallet application in Svelte with Tauri for desktop and Capacitor for iOS/Android, using Atomic Design component architecture with QR scanning and real-time transaction updates
- Built a real-time network monitoring dashboard in Svelte 4/SvelteKit 2 with D3 and uPlot, displaying live bandwidth metrics and relay topology via JSON-RPC
- Developed TypeScript wallet SDK published to npm, providing typed client interfaces for the wallet daemon's RESTful and JSON-RPC APIs
- Architected and optimized high-performance backend services in Rust, designing cross-chain bridge protocol between Mel and Ethereum blockchains
- Deployed and tested Solidity smart contracts using Foundry; built CI/CD pipelines with automated testing and a beta testing program

### Software Engineer | Center of Advanced Wellness
**March 2017 - June 2021**

- Developed and maintained event-driven data pipeline infrastructure resulting in $200k annual savings
- Built responsive internal web applications for clinical data management and reporting
- Implemented containerized deployments using Docker Compose on AWS cloud infrastructure
- Created automated data migration system using Python and Selenium
- Managed cloud-hosted PostgreSQL database systems and related infrastructure

---

## Education

### University of Texas at Dallas
**B.S. Software Engineering** | 2019

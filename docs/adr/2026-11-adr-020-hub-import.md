---
status: accepted
version: 1.0
updated: 2026-11-16
temperature: 0.1
---

# ADR-020: импорт проекта из Хаба

## Context

Проект перенесён из https://github.com/G-Ivan-A/hybrid-Intelligence-lab по контракту выноса
(https://github.com/G-Ivan-A/hybrid-Intelligence-lab/blob/54face1618f74154ae0f072bc3e5bfb3c4817754/ops/hub-project-extraction-contract.md) по задаче #1.

## Decision

Источник — коммит `54face1618f74154ae0f072bc3e5bfb3c4817754`. Правила переноса (`MAP`):

- `projects/ba-ai-process/=`
- `research/mango/=research/mango/`
- `docs/ba-meta-model-overview.md=docs/ba-meta-model-overview.md`
- `tools/test-execution-package.sh=tools/test-execution-package.sh`
- `tools/test-cline-package.sh=tools/test-cline-package.sh`
- `tools/test-opencode-package.sh=tools/test-opencode-package.sh`
- `tools/test-bcreq-working-release-pipeline.sh=tools/test-bcreq-working-release-pipeline.sh`
- `tools/test-ba-meta-model-overview.sh=tools/test-ba-meta-model-overview.sh`

История импортирована `git filter-repo 2.47.0`
(234 коммитов); ссылки `#NNN` в сообщениях
коммитов указывают на задачи Хаба (`G-Ivan-A/hybrid-Intelligence-lab#NNN`); карта старых и новых
хешей — `docs/import/hub-54face1618f7/commit-map.txt`.

## Consequences

Файлы проекта сверены с Хабом по хешу (`verify-import.json`). Дальнейшее
развитие ведётся в этом репозитории; Хаб хранит историю до `54face1618f74154ae0f072bc3e5bfb3c4817754`.

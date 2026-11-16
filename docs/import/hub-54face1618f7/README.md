# Импорт из Хаба G-Ivan-A/hybrid-Intelligence-lab@54face1618f7

Контракт: https://github.com/G-Ivan-A/hybrid-Intelligence-lab/blob/54face1618f74154ae0f072bc3e5bfb3c4817754/ops/hub-project-extraction-contract.md. Задача: #1.

| Этап | Статус | Pull request | Доказательство |
| --- | --- | --- | --- |
| E1 Скелет генома | ✅ | #2 | `genome.tsv`, `manifest.tsv` |
| E2 Импорт с историей | ✅ | #3 | `verify-import.json`, `verify-filtered.json`, `commit-map.txt`, `commit-count.txt`, `history.txt` |
| E3 Ссылки | ✅ | #4 | `rewrite-links.jsonl`, `verify-links.json` |
| E4 Код и CI | ⬜ | | `scan-before.txt`, `scan-after.txt`, `adapted.txt` |
| E5 Бэклог | ⬜ | | `backlog-ids.txt` |
| E6 Проверка | ⬜ | | `verify-final.json` |

## Итог

| Показатель | Значение |
| --- | --- |
| Файлов в манифесте | |
| Коммитов истории | |
| Событий ссылок по видам | `file-in` 0, `dir-in` 0, `file-out` 64, `dir-out` 0, `url-in` 490, `unresolved` 0, `outside-repo` 0 (всего 554, `rewrite-links.jsonl`) |
| Адаптированных файлов | |
| Строк бэклога | |

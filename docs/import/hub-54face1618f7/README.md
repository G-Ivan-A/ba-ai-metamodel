# Импорт из Хаба G-Ivan-A/hybrid-Intelligence-lab@54face1618f7

Контракт: https://github.com/G-Ivan-A/hybrid-Intelligence-lab/blob/54face1618f74154ae0f072bc3e5bfb3c4817754/ops/hub-project-extraction-contract.md. Задача: #1.

| Этап | Статус | Pull request | Доказательство |
| --- | --- | --- | --- |
| E1 Скелет генома | ✅ | #2 | `genome.tsv`, `manifest.tsv` |
| E2 Импорт с историей | ✅ | #3 | `verify-import.json`, `verify-filtered.json`, `commit-map.txt`, `commit-count.txt`, `history.txt` |
| E3 Ссылки | ✅ | #4 | `rewrite-links.jsonl`, `verify-links.json` |
| E4 Код и CI | ✅ | #5 | `scan-before.txt`, `scan-after.txt`, `adapted.txt`, `validation.log`, `ci-validation.json` |
| E5 Бэклог | ⬜ | | `backlog-ids.txt` |
| E6 Проверка | ⬜ | | `verify-final.json` |

## Итог

| Показатель | Значение |
| --- | --- |
| Файлов в манифесте | 324 (`source-freeze.json`) |
| Коммитов истории | 234 (`commit-count.txt`) |
| Событий ссылок по видам | `file-in` 0, `dir-in` 0, `file-out` 64, `dir-out` 0, `url-in` 490, `unresolved` 0, `outside-repo` 0 (всего 554, `rewrite-links.jsonl`) |
| Адаптированных файлов | 50 (`adapted.txt`, `e4-metrics.json`) |
| Строк бэклога | |

## E4: код и CI

Исходники адаптированы отдельными коммитами; окончательная ревизия —
`8afc640aeb7b7aa000d0174bd0f67ecfd4fc7cfc`;
из него перекомпилированы Cline и OpenCode (`compilation.log`). Исходный
манифест переноса воспроизведён без изменений, источник Хаба заморожен
(`source-freeze.json`). `scan-before.txt` содержит 366 вхождений старых путей,
`scan-after.txt` — 33, все в префиксах `HISTORICAL`. Исторические файлы не
менялись; список остальных изменений — `adapted.txt`.

`validation.log` сохраняет локальные проверки и структурное сравнение всех
семи выбранных шагов и трёх заданий CI с закреплённым workflow Хаба после
`MAP`. Linux-проверки выполнены; Windows, PowerShell и реальный OpenCode
подтверждены матрицей CI в [PR #5](https://github.com/G-Ivan-A/ba-ai-metamodel/pull/5):
все семь заданий прошли на коммите `79ca8f1862902a57d02fc7b8660f080a04b2282f` в
[целевом репозитории](https://github.com/G-Ivan-A/ba-ai-metamodel/actions/runs/44024585000) и
[fork](https://github.com/konard/G-Ivan-A-ba-ai-metamodel/actions/runs/44024575998). Ревизии, время запусков и итоги каждого задания
сохранены в `ci-validation.json`.

Первый запуск CI выявил границу закреплённого scanner: он ищет `/`, но не
Windows-разделитель `\`. Команды развёртывания PowerShell сохранили старый
префикс, что воспроизвёл `test_deploy_guide_runs_verbatim` в Linux/pwsh и обеих
Windows-оболочках (`ci-before-fix.log`). Исправлены также инструкции копирования
OpenCode; `windows-paths-before.txt` содержит 13 таких вхождений (включая
порождаемые копии), `windows-paths-after.txt` пуст. Дополнительный поиск с
нормализацией разделителей не обнаруживает активных старых путей.

До исправления на базе E3 `57b779e52d787c19bc1b0f6e11164bdf9f4e0b19`:

- `bash tools/test-execution-package.sh` останавливается на старом пути
  (`layout-before-fix.log`).
- `python tests/execution-package/tests/test_emulation.py` воспроизводит три
  ошибки разбора YAML (`execution-before-fix.log`): E3 закодировал запятую и
  закрывающую скобку в `derived_from` двух GigaCode skills как `%2C` и `%5D`.

Разделители восстановлены, существующие тесты проходят. GigaCode поддерживается
непосредственно в `dist/`, что документирует существующий
`experiments/issue_638_update_manifest_hashes.py`; его хеши обновлены этим
инструментом, provenance — на коммит исправленных исходников. Полный компилятор
GigaCode не добавлялся. Исторический источник продуктовых таксономий сохранён.

Вопросы границ вынесены в PR #5: PR #4 уже слит и повторно слит быть не может;
контракт требует отдельного PR для E4. E5 и E6 остаются невыполненными.
Локального бэклога до E5 нет; соответствующая запись B-246 проверена в
закреплённом бэклоге Хаба, её статус в другом репозитории здесь не изменяется.

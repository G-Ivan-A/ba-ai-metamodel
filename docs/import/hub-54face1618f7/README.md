# Импорт из Хаба G-Ivan-A/hybrid-Intelligence-lab@54face1618f7

Контракт: https://github.com/G-Ivan-A/hybrid-Intelligence-lab/blob/54face1618f74154ae0f072bc3e5bfb3c4817754/ops/hub-project-extraction-contract.md. Задача: #1.

| Этап | Статус | Pull request | Доказательство |
| --- | --- | --- | --- |
| E1 Скелет генома | ✅ | #2 | `genome.tsv`, `manifest.tsv` |
| E2 Импорт с историей | ✅ | #3 | `verify-import.json`, `verify-filtered.json`, `commit-map.txt`, `commit-count.txt`, `history.txt` |
| E3 Ссылки | ✅ | #4 | `rewrite-links.jsonl`, `verify-links.json` |
| E4 Код и CI | ✅ | #5 | `scan-before.txt`, `scan-after.txt`, `adapted.txt`, `validation.log`, `ci-validation.json` |
| E5 Бэклог | ✅ | | `backlog-ids.txt`, `e5-preparation.json`, `e5-validation.log` |
| E6 Проверка | ⬜ | | `verify-final.json` |

## Итог

| Показатель | Значение |
| --- | --- |
| Файлов в манифесте | 324 (`source-freeze.json`) |
| Коммитов истории | 234 (`commit-count.txt`) |
| Событий ссылок по видам | `file-in` 0, `dir-in` 0, `file-out` 64, `dir-out` 0, `url-in` 490, `unresolved` 0, `outside-repo` 0 (всего 554, `rewrite-links.jsonl`) |
| Адаптированных файлов | 50 (`adapted.txt`, `e4-metrics.json`) |
| Строк бэклога | 100; 99 различных ID, повтор `B-223` сохранён из источника (`backlog-ids.txt`, `e5-preparation.json`) |

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
контракт требует отдельного PR для E4. На момент завершения E4 этапы E5 и E6
оставались невыполненными. Локального бэклога до E5 не было; запись B-246 проверена в
закреплённом бэклоге Хаба, её статус в другом репозитории здесь не изменяется.

## E5: бэклог

По [поручению владельца после слияния E4](https://github.com/G-Ivan-A/ba-ai-metamodel/pull/5#issuecomment-6940064298)
в `ops/backlog.md` перенесены 13 разделов: спринты 14–21 и 24–28 из
`ops/backlog.md` Хаба на `54face1618f74154ae0f072bc3e5bfb3c4817754`.
Использована подкоманда `sections` инструмента `tools/spoke-extraction.py`
из того же коммита; значения `BACKLOG`, `MAP` и адрес источника взяты из
[issue #1](https://github.com/G-Ivan-A/ba-ai-metamodel/issues/1). Адрес назначения —
`https://github.com/G-Ivan-A/ba-ai-metamodel`, независимо от fork в `origin`.
Шапка соответствует шаблону контракта; после неё байты результата `sections`
сохранены без ручных изменений. Трансформации ссылок: `url-in` 46,
`file-out` 6, `dir-out` 1 (`e5-validation.log`).

Шаг 0 повторён: 8 путей источника не менялись между закреплённым SHA и
проверенным `main` Хаба; манифест совпадает с прежним, 324 файла.
SHA проверенного `main`, blob инструмента и SHA-256 результата записаны в
`e5-preparation.json`. Ветка включает слитый E4 (`95e4ed7dbedb9ab2f0a826a5d957092f12b290e6`).

`sections --check` проходит. Независимое сравнение подтверждает порядок
13 заголовков, тождественную карту всех 100 строк ID и точное совпадение тела
с выводом инструмента. Негативные проверки отклоняют изменение строки задачи
и пропуск спринта 28. Проверки naming, bootstrap, синтаксиса всех shell-скриптов,
Working/Release и stakeholder overview проходят; вывод — `e5-validation.log`.
Полные пакетные тесты и проверки Windows/OpenCode выполняет CI pull request.

Граница исходных данных: `B-223` встречается дважды — инструкции Cline
(спринт 25, issue #644) и адаптер OpenCode (спринт 28, issue #652).
Поэтому 100 строк не означают 100 различных задач. Оба ID и исходные статусы
сохранены: перенумерация или актуализация снимка нарушила бы E5 и будущий
`sections --check` в E6. Наибольший импортированный ID — `B-227`;
новые задачи в этом этапе не создавались. Коллизия вынесена на review в PR.

| Шаг | Состояние | SSOT |
| --- | --- | --- |
| Предыдущий: B-246 / E4 | принят, PR #5 слит | [PR #5](https://github.com/G-Ivan-A/ba-ai-metamodel/pull/5) |
| Текущий: B-247 / E5 | импорт подготовлен к review; часть B-247 | [Контракт, E5](https://github.com/G-Ivan-A/hybrid-Intelligence-lab/blob/54face1618f74154ae0f072bc3e5bfb3c4817754/ops/hub-project-extraction-contract.md#этап-e5-бэклог), `ops/backlog.md`, доказательства E5 |
| Следующий: B-247 / E6 | не выполнен; отдельный PR после принятия E5 | [Контракт, E6](https://github.com/G-Ivan-A/hybrid-Intelligence-lab/blob/54face1618f74154ae0f072bc3e5bfb3c4817754/ops/hub-project-extraction-contract.md#этап-e6-проверка), [запись B-247 в Хабе](https://github.com/G-Ivan-A/hybrid-Intelligence-lab/blob/54face1618f74154ae0f072bc3e5bfb3c4817754/ops/backlog.md) |

B-247 относится к спринту 30 Хаба и не входит в выбранные разделы. Его
завершение не заявляется: запись объединяет E5 и E6. Статусы цепочки отражены
выше; исходный бэклог Хаба этим PR не изменяется. После E6 цепочка продолжается
B-248 → B-249 → B-250 в Хабе по
[PR #739](https://github.com/G-Ivan-A/hybrid-Intelligence-lab/pull/739).

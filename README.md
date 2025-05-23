# Obsidian Docs → HTML

Этот проект позволяет конвертировать локальный Obsidian Vault в HTML-сайт.

## 📁 Что используется

- [obsidian-export](https://github.com/zoni/obsidian-export) — для экспорта заметок
- [MkDocs + Material theme](https://squidfunk.github.io/mkdocs-material/) — для генерации сайта

## 🧱 Сборка

```bash
docker build -t obsidian-to-html .
```
(Команда для windows, в других системах синтаксис -v... может отличаться)
```bash
docker run --rm -v "$(pwd)/vault:/vault" -v "$(pwd)/site:/site" obsidian-to-html obsidian-export /vault
```
# koreader-patches

Koreader patches that make my Koreader life a bit better.

Copy a patch file into your KOReader `patches/` directory (next to `settings/` on the device, or under your KOReader install on desktop).

## Patches

### `2-recent-new-visible.lua`

When I sync books from Calibre, they land as "new" (no sidecar yet). If my mosaic browser is filtered to something like "reading" only, those fresh transfers disappear — and I'd have to reset or toggle my filters just to find them.

This patch shows recently transferred books anyway, so I can open a new sync without touching my filters.

Uses file modification time (updated when Calibre copies a book to the device). Books modified within the last 15 minutes are shown; edit `RECENT_SECONDS` at the top of the file to change that window.

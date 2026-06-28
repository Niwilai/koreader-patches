# koreader-patches

Koreader patches that make my Koreader life a bit better.

Copy a patch file into your KOReader `patches/` directory (next to `settings/` on the device, or under your KOReader install on desktop).

## Patches

### `2-recent-new-visible.lua`

Shows recently transferred books in the mosaic file browser even when their reading-status filter is off — for example, when only "reading" is selected but a newly copied book is still "new" because it has no sidecar yet.

Uses file modification time (updated when Calibre copies a book to the device). Books modified within the last 15 minutes are shown; edit `RECENT_SECONDS` at the top of the file to change that window.

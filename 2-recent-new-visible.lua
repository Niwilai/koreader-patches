--[[
Show recently transferred books in the mosaic browser even when their
reading-status filter is off (e.g. only "reading" selected, but the
book is still "new" because it has no sidecar yet).

Uses file modification time (updated when Calibre copies a book to the device).
]]

local RECENT_SECONDS = 15 * 60 -- 15 minutes; edit as needed

local FileChooser = require("ui/widget/filechooser")
local lfs = require("libs/libkoreader-lfs")

local function is_recently_added(fullpath)
    if not fullpath then
        return false
    end
    local mtime = lfs.attributes(fullpath, "modification")
    if not mtime then
        return false
    end
    return (os.time() - mtime) <= RECENT_SECONDS
end

local orig_show_file = FileChooser.show_file

function FileChooser:show_file(filename, fullpath)
    if orig_show_file(self, filename, fullpath) then
        return true
    end

    -- Hidden by status filter — still show if the file just landed on the device.
    if not is_recently_added(fullpath) then
        return false
    end

    for _, pattern in ipairs(self.exclude_files) do
        if filename:match(pattern) then
            return false
        end
    end
    if not self.show_unsupported and self.file_filter ~= nil and not self.file_filter(filename) then
        return false
    end
    return true
end

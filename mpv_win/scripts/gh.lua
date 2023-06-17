-- mpv script that sets custom settings for audio

local utils = require 'mp.utils'
require "mp.msg"
require "mp.options"

function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end

  return false
end

function has_video()
    for _, track in pairs(mp.get_property_native('track-list')) do
        if track.type == 'video' and track.selected then
            return not track.albumart
        end
    end

    return false
end

extensions = {
  'aac',
  'flac',
  'm4a',
  'mp3',
  'ogg',
  'ogm',
  'opus',
  'wav',
  'wma',
}

mp.register_event("file-loaded", function()
  local path = mp.get_property("path", "")
  local dir, filename = utils.split_path(path)
  local ext = string.match(filename, "%.(%w+)$")

  -- local is_aud = table.contains(extensions, ext)
  local is_aud = not has_video()
  print("is_aud:", is_aud)
  if is_aud then
    mp.commandv("set", "osd-level", "3")
    mp.commandv("set", "osd-duration", "100000")
    --
    mp.command("show-progress")
  end
end)

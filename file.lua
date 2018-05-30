local function fileExists(filepath)
  return hs.fs.attributes(filepath, 'mode') == 'file'
end

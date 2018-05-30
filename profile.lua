local function functionWithTimes(fn, ...)
  logger.w(hs.timer.secondsSinceEpoch())
  result = table.pack(fn(...))
  logger.w(hs.timer.secondsSinceEpoch())
  return table.unpack(result)
end
local function profilingOn()
  debug.sethook(function (event)
    local x = debug.getinfo(2, 'nS')
    print(event, x.name, x.linedefined, x.source, hs.timer.secondsSinceEpoch())
  end, "c")
end
local function profilingOff()
  debug.sethook()
end

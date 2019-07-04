local M = {}

local function currentTime()
  return tonumber(
    (
      hs.execute("/usr/local/opt/coreutils/libexec/gnubin/date +%s%N")
    )
  )/1000000000
end
M.currentTime = currentTime

function M.functionWithTimes(fn, ...)
  local start = current_time()
  result = table.pack(fn(...))
  print("elapsed seconds: ".. tostring(current_time() - start))
  return table.unpack(result)
end

function M.profilingOn()
  debug.sethook(function (event)
    local x = debug.getinfo(2, 'nS')
    print(event, x.name, x.linedefined, x.source, hs.timer.secondsSinceEpoch())
  end, "c")
end

function M.profilingOff()
  debug.sethook()
end

return M

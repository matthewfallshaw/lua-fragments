local function table_keys(t)
  local ret, n = {}, 0
  for k,v in pairs(t) do
    n=n+1
    ret[n] = k
  end
  return ret
end

local function table_values(t)
  local ret, n = {}, 0
  for k,v in pairs(t) do
    n=n+1
    ret[n] = v
  end
  return ret
end

local function iteratorToArray(...)
  local arr, i = {}, 1
  for v in ... do
    arr[i] = v
    i = i + 1
  end
  return arr
end

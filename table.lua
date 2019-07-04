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

-- or use `tbl = Table(...)` as a constructor then use t:keys() etc.
local mt = { __index = table }
function Table(t)
  return setmetatable(t or {}, mt)
end

table.keys = function(self)
  local keys,i = {},0
  for k,_ in pairs(self) do
    i = i + 1
    keys[i] = k
  end
  return keys
end

table.values = function(self)
  local values,i = {},0
  for _,v in pairs(self) do
    i = i + 1
    values[i] = v
  end
  return values
end

table.clone = function(self)
  local out = {}
  for k,v in pairs(self) do
    if type(v) == 'table' then
      out[k] = table.clone(v)
    else
      out[k] = v
    end
  end
  return out
end

table.head = function(self)
  return self[1]
end

table.tail = function(self)
  return { select(2, table.unpack(self)) }
end

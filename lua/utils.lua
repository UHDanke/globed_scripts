local utils = {}

-------------------------------------------------
-- Table utilities
-------------------------------------------------

-- shallow copy
function utils.shallow_copy(tbl)
    local t = {}
    for k, v in pairs(tbl) do
        t[k] = v
    end
    return t
end

-- deep copy
function utils.deep_copy(tbl)
    if type(tbl) ~= "table" then return tbl end
    local copy = {}
    for k, v in pairs(tbl) do
        copy[utils.deep_copy(k)] = utils.deep_copy(v)
    end
    return copy
end

-- merge two tables (overwrites keys from t1 with t2)
function utils.merge(t1, t2)
    local res = utils.shallow_copy(t1)
    for k, v in pairs(t2) do
        res[k] = v
    end
    return res
end

-- keys of table
function utils.keys(tbl)
    local res = {}
    for k, _ in pairs(tbl) do
        table.insert(res, k)
    end
    return res
end

-- values of table
function utils.values(tbl)
    local res = {}
    for _, v in pairs(tbl) do
        table.insert(res, v)
    end
    return res
end

-------------------------------------------------
-- String utilities
-------------------------------------------------

-- split by delimiter
function utils.split(str, delim)
    local res = {}
    delim = delim or "%s"
    for part in string.gmatch(str, "([^"..delim.."]+)") do
        table.insert(res, part)
    end
    return res
end

-- join table of strings
function utils.join(tbl, sep)
    return table.concat(tbl, sep or "")
end

-- trim whitespace
function utils.trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

-------------------------------------------------
-- Iterable utilities
-------------------------------------------------

-- map
function utils.map(func, tbl)
    local res = {}
    for i, v in ipairs(tbl) do
        res[i] = func(v, i)
    end
    return res
end

-- filter
function utils.filter(func, tbl)
    local res = {}
    for i, v in ipairs(tbl) do
        if func(v, i) then
            table.insert(res, v)
        end
    end
    return res
end

-- reduce
function utils.reduce(func, tbl, init)
    local acc = init
    local start = 1
    if acc == nil then
        acc = tbl[1]
        start = 2
    end
    for i = start, #tbl do
        acc = func(acc, tbl[i])
    end
    return acc
end

-- range
function utils.range(start, stop, step)
    local r = {}
    if stop == nil then
        stop = start
        start = 0
    end
    step = step or 1
    for i = start, stop - 1, step do
        table.insert(r, i)
    end
    return r
end

-- enumerate
function utils.enumerate(tbl, start)
    start = start or 0
    local i = start
    local function iter(_, k)
        k = k + 1
        if k <= #tbl then
            return k, i + k - 1, tbl[k]
        end
    end
    return iter, tbl, 0
end

-- zip
function utils.zip(...)
    local lists = {...}
    local min_len = math.huge
    for _, t in ipairs(lists) do
        if #t < min_len then
            min_len = #t
        end
    end
    local zipped = {}
    for i = 1, min_len do
        local group = {}
        for _, t in ipairs(lists) do
            table.insert(group, t[i])
        end
        table.insert(zipped, group)
    end
    return zipped
end


-------------------------------------------------
-- Math utilities
-------------------------------------------------

-- clamp value between min and max
function utils.clamp(x, min, max)
    if x < min then return min end
    if x > max then return max end
    return x
end

-- round number
function utils.round(x, decimals)
    decimals = decimals or 0
    local m = 10 ^ decimals
    return math.floor(x * m + 0.5) / m
end

return utils

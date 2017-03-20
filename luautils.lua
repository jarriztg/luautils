local function gstrfind(str, what)
    local meta = {}
    local from
    local i=1
    while (i<#str) do
        from = string.find(str, what, i)
        if from then
            table.insert(meta, from)
            i = i + from
        else
            i = i + 1
        end
    end
    return meta
end

local function getchars(str)
    strc = {}
    for i = 1, #str do
        table.insert(strc, string.sub(str, i, i))
    end
    return strc
end

local function findtable(tabla, string, no_sensibility)
    index = nil
    for i,elem in pairs(tabla) do
        if elem == elemento then
            index = i
            break
        end
    end
    if index == nil then
        return nil
    end
    return index
end

local function gfindtable(tabla, cadena, no_sensibility)
    local location_one = false
    local location_two = 0
    local current = 0
    local tmp_str = ""
    for i,v in pairs(tabla) do
        current = current + 1
        if no_sensibility then
            v = v:lower()
            cadena = cadena:lower()
        end
        if v == cadena then
            location_two = current
        end
        if no_sensibility then
            i = i:lower()
            cadena = cadena:lower()
        end
        if i == cadena then
            location_one = true
        end
    end
    if location_two == 0 then location_two = nil end
    return location_one, location_two
end

return {
    gstrfind = gstrfind,
    gfindtable = gfindtable,
    findtable = findtable,
    getchars = getchars
}

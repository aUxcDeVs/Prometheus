-- This Script is Part of the Prometheus Obfuscator by Levno_710
--
-- namegenerators/mixed_toxic_shuffled.lua
--
-- Mixed version: Toxic names + Il1 confusing characters + Shuffled mangled names

local MIN_CHARACTERS = 5;
local MAX_INITIAL_CHARACTERS = 20;

local util = require("prometheus.util");
local chararray = util.chararray;

local offset = 0;
local VarDigits = chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_Il1");
local VarStartDigits = chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZIl");

local varNames = {
    "CPU",
    "IronBrewRust",
    "LuraphIsbetter",
    "I1iI1",
    "justlearnlua",
    "ifyoureadingthisyourgay",
    "Skibidi",
    "ShizoV3",
    "UwU",
    "Lmao",
    "justgiveup",
    "wastingtime",
    "pleasedontskid",
    "forkbypRometheus",
    "gay",
    "getout",
    "shizo",
    "loadstring",
    "getfenv",
    "setfenv",
    "rawget",
    "rawset",
    "getmetatable",
    "setmetatable",
    "pcall",
    "xpcall",
    "tonumber",
    "tostring",
    "typeof",
    "next",
    "pairs",
    "ipairs",
    "select",
    "unpack",
    "newproxy",
    "coroutine",
    "debug",
    "string",
    "table",
    "math",
    "require",
    "module",
    "package",
    "assert",
    "collectgarbage",
    "dofile",
    "error",
    "kiddo",
    "load",
    "rawequal",
    "KSSJSJSNSISEJNISNJEJEJKSOSMKDNWKDN",
    "XKJDNEMSJDIEKSOPWENJDIEKDMSKDIE",
    "PLMKOWNSJDIEQWERBNASDDCVFZXCVBN",
    "ZXCVBNQWERTYASDFGHHJKLZXCVBNMA",
    "TYUIOPGHJKLZXCVBNMQAZWSXEDCRFV",
    "QAZWSXEDCRFVTGBYHNUJMIKOLPMJNH",
    "UJMIKOLPMJNHYGBVFTCDEXSWZAQXCD",
    "CDEXSWZAQXCDERFVBGTHNMJUYIKOLO",
    "THNMJUYIKOLOPMNJBHVGYCFTXDRZSE",
    "VGYCFTXDRZSEAWQZSXEDCRFTVGYBHU",
    "PLOKIJUNHBGYVFTCRDZEXSWAQWZSXED",
    "HJKLZXCVBNMASDFGHJTYUIOPGHJKLZ",
    "MNBVCXLKJHGFDSAQWERTYJUIOPLKJHG",
    "ERFVBGTHNMJUYIKOLOPMNJBHVGYCFT",
    "AWQZSXEDCRFTVGYBHUNJMIKOLPMKOI",
    "KSSJSJSNSISEJNISNJEJEJKSOSMKDNWKDNSKMWKDNPLMKOIUJNHBGYVFTCRDZEXSW",
    "XKJDNEMSJDIEKSOPWENJDIEKDMSKDIEPLOKIJUNHBGYVFTCRDZEXSWAQWZSXED",
    "PLMKOWNSJDIEQWERBNASDDCVFZXCVBNQWERTYASDFGHZXCVBNMNBVCXLKJHGF",
    "ZXCVBNQWERTYASDFGHHJKLZXCVBNMASDFGHJTYUIOPGHJKLZXCVBNMQAZWSX",
    "TYUIOPGHJKLZXCVBNMQAZWSXEDCRFVTGBYHNUJMIKOLPMJNHYGBVFTCDEXSW",
    "aGVsbG93b3JsZHRoaXNhaXNmZmFrZQ",
    "Y2hhdGdwdGR3cm90ZXN0YWNrb3Zlcg",
    "dGhpc2FpcxNzdXBlcmxvbmdmZmFrZQ",
    "eW91dGhpbmtdGhpc2FpcxNzb21l",
    "d2h5YXJleW91ZXZlbnjyZWFkaW5n",
    "var_a",
    "var_b",
    "tmp_x",
    "tmp_y",
    "val_1",
    "val_2",
    "ref_a",
    "ref_b",
    "obj_x",
    "obj_y",
    "func_a",
    "func_b",
    "data_x",
    "data_y",
    "ptr_a",
    "ptr_b",
}

local function generateName(id, scope)
    local choice = math.random(1, 3)
    
    if choice == 1 then
        -- Toxic names method
        local name = {};
        local d = id % #varNames
        id = (id - d) / #varNames
        table.insert(name, varNames[d + 1]);
        while id > 0 do
            local d = id % #varNames
            id = (id - d) / #varNames
            table.insert(name, varNames[d + 1]);
        end
        return table.concat(name, "_");
    elseif choice == 2 then
        -- Il1 confusing method
        local name = ''
        id = id + offset;
        local confuseDigits = chararray("Il1");
        local confuseStart = chararray("Il");
        local d = id % #confuseStart
        id = (id - d) / #confuseStart
        name = name..confuseStart[d+1]
        while id > 0 do
            local d = id % #confuseDigits
            id = (id - d) / #confuseDigits
            name = name..confuseDigits[d+1]
        end
        return name
    else
        -- Shuffled mangled method
        local name = ''
        local d = id % #VarStartDigits
        id = (id - d) / #VarStartDigits
        name = name..VarStartDigits[d+1]
        while id > 0 do
            local d = id % #VarDigits
            id = (id - d) / #VarDigits
            name = name..VarDigits[d+1]
        end
        return name
    end
end

local function prepare(ast)
    util.shuffle(varNames);
    util.shuffle(VarDigits);
    util.shuffle(VarStartDigits);
    offset = math.random(3 ^ MIN_CHARACTERS, 3 ^ MAX_INITIAL_CHARACTERS);
end

return {
    generateName = generateName, 
    prepare = prepare
};

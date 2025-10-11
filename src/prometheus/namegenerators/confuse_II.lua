-- This Script is Part of the Prometheus Obfuscator by Levno_710
--
-- namegenerators/toxic_confuse.lua
--
-- Mixed version: Toxic names + Il1 confusing characters

local MIN_CHARACTERS = 5;
local MAX_INITIAL_CHARACTERS = 10;

local util = require("prometheus.util");
local chararray = util.chararray;

local offset = 0;
local VarDigits = chararray("Il1");
local VarStartDigits = chararray("Il");

local varNames = {
    
    "PSUnnWuw",
    "IronBrewRust",
    "LuraphIsbetter",
    "SkillIssue",
    "justlearnlua",
    "NiceTrieKid",
    "Skibidi",
    "MomsCalling",
    "UwU",
    "Lmao",
    "justGiveUp",
    "WastingTime",
    "pleasedontskid",
    "ForkbYpRometheus",
    "Gay",
    "GetOut!",
    "ShIzO",
    
    
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
    "gcinfo",
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
    
    if math.random() < 0.5 then
        
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
    else
        
        local name = ''
        id = id + offset;
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

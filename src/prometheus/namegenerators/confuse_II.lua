-- This Script is Part of the Prometheus Obfuscator by Levno_710
--
-- namegenerators/confuse_II.lua
--
-- ULTIMATE MIX: Toxic names + Il1 + Mangled + Mangled Shuffled + Number

local MIN_CHARACTERS = 5;
local MAX_INITIAL_CHARACTERS = 10;

local util = require("prometheus.util");
local chararray = util.chararray;

-- Il1 Style
local offset = 0;
local VarDigits_Il = chararray("Il1");
local VarStartDigits_Il = chararray("Il");

-- Mangled Style (shuffled and regular)
local VarDigits_Mangled = chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_");
local VarStartDigits_Mangled = chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ");

-- Number Style
local NUMBER_PREFIX = "\95";

-- Toxic Names
local varNames = {
    "Fork",
    "IlOvEmOonSecV3❤️",
    "recomendMoonsecV3😎",
    "MissIronbrew",
    "😂Lmao",
    "UwU",
    "Shizo",
    "Codes",
    "others",
    "steal",
    "yours",
    "mAkE",
    "sCriPt",
    "mY",
    "SKID😃",
    "dont😾",
    "Please💔",
    
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
    local style = math.random(1, 5);
    
    if style == 1 then
        
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
        
    elseif style == 2 then
        
        local name = ''
        local tempId = id + offset;
        local d = tempId % #VarStartDigits_Il
        tempId = (tempId - d) / #VarStartDigits_Il
        name = name..VarStartDigits_Il[d+1]
        while tempId > 0 do
            local d = tempId % #VarDigits_Il
            tempId = (tempId - d) / #VarDigits_Il
            name = name..VarDigits_Il[d+1]
        end
        return name
        
    elseif style == 3 then
        
        local name = ''
        local tempId = id;
        local d = tempId % #VarStartDigits_Mangled
        tempId = (tempId - d) / #VarStartDigits_Mangled
        name = name..VarStartDigits_Mangled[d+1]
        while tempId > 0 do
            local d = tempId % #VarDigits_Mangled
            tempId = (tempId - d) / #VarDigits_Mangled
            name = name..VarDigits_Mangled[d+1]
        end
        return name
        
    elseif style == 4 then
        
        local name = ''
        local tempId = id;
        local d = tempId % #VarStartDigits_Mangled
        tempId = (tempId - d) / #VarStartDigits_Mangled
        name = name..VarStartDigits_Mangled[d+1]
        while tempId > 0 do
            local d = tempId % #VarDigits_Mangled
            tempId = (tempId - d) / #VarDigits_Mangled
            name = name..VarDigits_Mangled[d+1]
        end
        return name
        
    else
        
        return NUMBER_PREFIX .. tostring(id);
    end
end

local function prepare(ast)
    
    util.shuffle(varNames);
    util.shuffle(VarDigits_Il);
    util.shuffle(VarStartDigits_Il);
    util.shuffle(VarDigits_Mangled);
    util.shuffle(VarStartDigits_Mangled);
    offset = math.random(3 ^ MIN_CHARACTERS, 3 ^ MAX_INITIAL_CHARACTERS);
end

return {
    generateName = generateName, 
    prepare = prepare
};

-- This Script is Part of the Prometheus Obfuscator by Levno_710
--
-- namegenerators/mixed_toxic_shuffled.lua
--
-- Mixed version: Toxic names + Il1 confusing characters + Shuffled mangled names + Hex numbers

local MIN_CHARACTERS = 5;
local MAX_INITIAL_CHARACTERS = 20;
local PREFIX = "_";

local util = require("prometheus.util");
local chararray = util.chararray;

local offset = 0;
local VarDigits = chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_Il1iIiIiIIiIiIiIiIIIII");
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
    "A_B_C_D",
    "E_F_G_H",
    "I_J_K_L",
    "M_N_O_P",
    "Q_R_S_T",
    "U_V_W_X",
    "Y_Z_A_B",
    "C_D_E_F",
    "G_H_I_J",
    "K_L_M_N",
    "O_P_Q_R",
    "S_T_U_V",
    "W_X_Y_Z",
    "AA_BB_CC",
    "DD_EE_FF",
    "GG_HH_II",
    "JJ_KK_LL",
    "MM_NN_OO",
    "PP_QQ_RR",
    "SS_TT_UU",
    "VV_WW_XX",
    "YY_ZZ_AA",
    "A1_B2_C3",
    "D4_E5_F6",
    "G7_H8_I9",
    "J0_K1_L2",
    "M3_N4_O5",
    "P6_Q7_R8",
    "S9_T0_U1",
    "V2_W3_X4",
    "Y5_Z6_A7",
    "B8_C9_D0",
}

local function generateName(id, scope)
    local choice = math.random(1, 4)
    
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
    elseif choice == 3 then
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
    else
        -- Hex number method
        return PREFIX .. tostring(id);
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

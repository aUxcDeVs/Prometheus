-- This Script is Part of the Prometheus And CPU Obfuscator by Levno_710 and VantaXock 
--
-- namegenerators/mixed_mangled_BC_shuffled.lua
--
-- Combined version: Shuffled mangled names + BC names + Il1 confusing + Hex numbers

local MIN_CHARACTERS = 5;
local MAX_INITIAL_CHARACTERS = 20;
local PREFIX = "_";

local util = require("prometheus.util");
local chararray = util.chararray;

local offset = 0;

-- Mangled shuffled character sets (from first script)
local VarDigits = chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_");
local VarStartDigits = chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ");

-- Extended character sets with Il1 confusion
local VarDigitsExtended = chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_Il1iIiIiIIiIiIiIiIIIII");
local VarStartDigitsExtended = chararray("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZIl");

-- Confusion character sets
local ConfuseDigits = chararray("Il1u");
local ConfuseStart = chararray("IlU");

-- Toxic variable names array
local varNames = {
    "CPU",
    "cCc",
    "LuraphIsbetter",
    "I1iI1",
    "justlearnlua",
    "Shit",
    "Skibidi",
    "ShizoV3",
    "UwU",
    "LmaoOooo",
    "AaaaaaaA",
    "LlllllL",
    "OoooooO",
    "then",
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
    "CPU",
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
    "UwU",
    "kiddo",
    "load",
    "rawequal",
    "KSSJSJSNSISEJNISNJEJEJKSOSMKDNWKDN",
    "XKJDNEaGVsbG93b3JsZHRoaXNhaXNmZmFrZQMSJDIEKSOPWENJDIEKDMSKDIE",
    "PLMKOWNSaGVsbG93b3JsZHRoaXNhaXNmZmFrZQJDIEQWERBNASDDCVFZXCVBN",
    "ZXCVBNQWERTYASDFGHHJKLZXCVBNMA",
    "TYUIOPGHJKLZXCVBNMQAZWSXEDCRFV",
    "QAZWSXEDCRFVTGBYHNUJMIKOLPMJNH",
    "UJMIKOLPaGVsbG93b3JsZHRoaXNhaXNmZmFrZQMJNHYGBVFTCDEXSWZAQXCD",
    "CDEXSWZAQXCaGVsbG93b3JsZHRoaXNhaXNmZmFrZQDERFVBGTHNMJUYIKOLO",
    "THNMJUYIKOLOPMNJBHVGYCFTXDRZSE",
    "VGYCFTaGVsbG93b3JsZHRoaXNhaXNmZmFrZQXDRZSEAWQZSXEDCRFTVGYBHU",
    "PLOKIJaGVsbG93b3JsZHRoaXNhaXNmZmFrZQUNHBGYVFTCRDZEXSWAQWZSXED",
    "HJKLZXCaGVsbG93b3JsZHRoaXNhaXNmZmFrZQVBNMASDFGHJTYUIOPGHJKLZ",
    "MNBVCXLaGVsbG93b3JsZHRoaXNhaXNmZmFrZQKJHGFDSAQWERTYJUIOPLKJHG",
    "ERFVBGTHNaGVsbG93b3JsZHRoaXNhaXNmZmFrZQMJUYIKOLOPMNJBHVGYCFT",
    "AWQZSXEDaGVsbG93b3JsZHRoaXNhaXNmZmFrZQCRFTVGYBHUNJMIKOLPMKOI",
    "KSSJSJSNSISEJNISNJEJEJKSOSMKDNWKDNSKMWKDNPLMKOIUJNHBGYVFTCRDZEXSW",
    "XKJDNEMSJDIEKSOPWENJDIEKDMSKDIEPLOKIJUNHBGYVFTCRDZEXSWAQWZSXED",
    "PLMKOWNSJDIEQWERBNASDDCVFZXCVBNQWERTYASDFGHZXCVBNMNBVCXLKJHGF",
    "ZXCVBNQWERTYASDFGHHJKLZXCVBNMASDFGHJTYUIOPGHJKLZXCVBNMQAZWSX",
    "TYUIOPGHJKLZXCVBNMQAZWSXEDCRFVTGBYHNUJMIKOLPMJNHYGBVFTCDEXSW",
    "aGVsbG93b3JsZHRoaXNhaXNmZmFrZQaGVsbG93b3JsZHRoaXNhaXNmZmFrZQ",
    "Y2hhdGdwdGR3cmaGVsbG93b3JsZHRoaXNhaXNmZmFrZQ90ZXN0YWNrb3Zlcg",
    "dGhpc2FpcxNaGVsbG93b3JsZHRoaXNhaXNmZmFrZQzdXBlcmxvbmdmZmFrZQ",
    "eW91dGhpbmtdaGVsbG93b3JsZHRoaXNhaXNmZmFrZQGhpc2FpcxNzb21l",
    "d2h5YXJleW91ZaGVsbG93b3JsZHRoaXNhaXNmZmFrZQXZlbnjyZWFkaW5n",
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
    local choice = math.random(1, 5)
    
    if choice == 1 then
        -- Simple shuffled mangled method (from first script)
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
    elseif choice == 2 then
        -- Extended shuffled mangled with Il1 confusion
        local name = ''
        local d = id % #VarStartDigitsExtended
        id = (id - d) / #VarStartDigitsExtended
        name = name..VarStartDigitsExtended[d+1]
        while id > 0 do
            local d = id % #VarDigitsExtended
            id = (id - d) / #VarDigitsExtended
            name = name..VarDigitsExtended[d+1]
        end
        return name
    elseif choice == 3 then
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
    elseif choice == 4 then
        -- Pure Il1 confusion method
        local name = ''
        id = id + offset;
        local d = id % #ConfuseStart
        id = (id - d) / #ConfuseStart
        name = name..ConfuseStart[d+1]
        while id > 0 do
            local d = id % #ConfuseDigits
            id = (id - d) / #ConfuseDigits
            name = name..ConfuseDigits[d+1]
        end
        return name
    else
        -- Hex number method
        return PREFIX .. tostring(id);
    end
end

local function prepare(ast)
    -- Shuffle all character arrays and name lists
    util.shuffle(VarDigits);
    util.shuffle(VarStartDigits);
    util.shuffle(VarDigitsExtended);
    util.shuffle(VarStartDigitsExtended);
    util.shuffle(varNames);
    
    -- Set random offset for confusion method
    offset = math.random(3 ^ MIN_CHARACTERS, 3 ^ MAX_INITIAL_CHARACTERS);
end

return {
    generateName = generateName, 
    prepare = prepare
};

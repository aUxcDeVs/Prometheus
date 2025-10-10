-- This Script is Part of the Prometheus Obfuscator by Levno_710
-- Modified VERSION 
-- This Script provides a function for generation of confusing variable names

local util = require("prometheus.util");
local chararray = util.chararray;

local varNames = {
    
    "loadstring",
    "then",
    "elseif",
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
    "type",
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
    "repeat",
    "until",
    "while",
    "local",
    "function",
    "return",
    "break",
    "end",
    "nil",
    "true",
    "false",
    "and",
    "or",
    "not",
    "in",
    "do",
    
    -- LONG RANDOM LOOKING STRINGS WITH SPECIAL CHARS
    "KSSJS#JSNSISEJN?ISNJEJEJKSOS#MKDNWKDN",
    "XKJDNE?MSJDIE#KSOPWE?NJDIEKD#MSKDIE",
    "PLMKOW#NSJDIE?QWERBN#ASDCVF?ZXCVBN",
    "ZXCVBN?QWERTY#ASDFGH?HJKLZX#CVBNMA",
    "TYUIOP#GHJKLZ?XCVBNM#QAZWSX?EDCRFV",
    "QAZWSX?EDCRFV#TGBYHN?UJMIKO#LPMJNH",
    "UJMIKO#LPMJNH?YGBVFT#CDEXSW?ZAQXCD",
    "CDEXSW?ZAQXCD#ERFVBG?THNMJU#YIKOLO",
    "THNMJU?YIKOLO#PMNJBH?VGYCFT#XDRZSE",
    "VGYCFT#XDRZSE?AWQZSX#EDCRFT?VGYBHU",
    "PLOKIJU#NHBGYVFT?CRDZEXSW#AQWZSXED",
    "HJKLZX?CVBNMA#SDFGHJ?TYUIOP#GHJKLZ",
    "MNBVCX#LKJHGF?DSAQWE#RTYUIO?PLKJHG",
    "ERFVBG?THNMJU#YIKOLO?PMNJBH#VGYCFT",
    "AWQZSX#EDCRFT?VGYBHU#NJMIKO?LPMKOI",
    "VTFCRD?XESZWA#QPLMOK?INJUHB#YGVTFC",
    "RDXESZ#AWQQAZ?WSXEDC#RFVTGB?YHNUJM",
    "IKOOLP?MKINJB#HGYVTF?CRDZXE#SWAQPL",
    "OKIMJU#NHBYGV?TFCRDE#XSWZAQ?PLMOKN",
    
    "KSSJS#JSNSISEJN?ISNJEJEJKSOS#MKDNWKDN?SKMWKDN#PLMKOIUJ?NHBGYVFT#CRDZEXSW?AQPLMOKN#IJUHBYGV?TFCRDZEX",
    "XKJDNE?MSJDIE#KSOPWE?NJDIEKD#MSKDIE?PLOKIJU#NHBGYVFT?CRDZEXSW#AQWZSXED?CRFVTGBY#HNUJMIKO?LPMJNH#YGBVFT",
    "PLMKOW#NSJDIE?QWERBN#ASDCVF?ZXCVBN#QWERTY?ASDFGH#ZXCVBN?MNBVCX#LKJHGF?DSAQWE#RTYUIO?PLKJHG#ZXCVBN?QWERTY",
    "ZXCVBN?QWERTY#ASDFGH?HJKLZX#CVBNMA?SDFGHJ#TYUIOP?GHJKLZ#XCVBNM?QAZWSX#EDCRFV?TGBYHN#UJMIKO?LPMJNH#YGBVFT",
    "TYUIOP#GHJKLZ?XCVBNM#QAZWSX?EDCRFV#TGBYHN?UJMIKO#LPMJNH?YGBVFT#CDEXSW?ZAQXCD#ERFVBG?THNMJU#YIKOLO?PMNJBH",
    "QAZWSX?EDCRFV#TGBYHN?UJMIKO#LPMJNH?YGBVFT#CDEXSW?ZAQXCD#ERFVBG?THNMJU#YIKOLO?PMNJBH#VGYCFT?XDRZSE#AWQZSX",
    "UJMIKO#LPMJNH?YGBVFT#CDEXSW?ZAQXCD#ERFVBG?THNMJU#YIKOLO?PMNJBH#VGYCFT?XDRZSE#AWQZSX?EDCRFT#VGYBHU?NJMIKO",
    "CDEXSW?ZAQXCD#ERFVBG?THNMJU#YIKOLO?PMNJBH#VGYCFT?XDRZSE#AWQZSX?EDCRFT#VGYBHU?NJMIKO#LPMKOI?NUHBGY#VTFCRD",
    "THNMJU?YIKOLO#PMNJBH?VGYCFT#XDRZSE?AWQZSX#EDCRFT?VGYBHU#NJMIKO?LPMKOI#NUHBGY?VTFCRD#XESZWA?QPLMOK#INJUHB",
    "VGYCFT#XDRZSE?AWQZSX#EDCRFT?VGYBHU#NJMIKO?LPMKOI#NUHBGY?VTFCRD#XESZWA?QPLMOK#INJUHB?YGVTFC#RDXESZ?AWQQAZ",
    
    "aGVsbG8?d29ybGQ#dGhpcw?aXNf#ZmFrZQ",
    "Y2hhdGdwdA#d3JvdGU?c3RhY2tvdmVy",
    "dGhpcw?aXNf#c3VwZXI?bG9uZw#ZmFrZQ",
    "eW91#dGhpbms?dGhpcw#aXNf?c29tZQ",
    "d2h5?YXJl#eW91?ZXZlbg#yZWFkaW5n",
    "dGhpcw#dmFyaWFibGU?bmFtZQ#aXNf",
    "aWYgeW91?YXJl#dHJ5aW5n?dG8",
    "c2VyaW91c2x5#dGhvdWdo?d2h5",
    
    -- COMMON VARIABLE PATTERNS THIS SUPPORT LUA 5.3 ROBLOX
    "var_a",
    "var_b",
    "var_c",
    "tmp_x",
    "tmp_y",
    "tmp_z",
    "val_1",
    "val_2",
    "val_3",
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
    
    -- === 15% TOXIC MEME NAMES === --
    
    "PSUdead",
    "IronBrewRust",
    "OldMoonSec",
    "SkillIssue",
    "SkidDetected",
    "TouchGrass",
    "Deobfailed",
    "CopeMald",
    "GetRekt",
    "NoMaidens",
}

local function generateName(id, scope)
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
end

local function prepare(ast)
    util.shuffle(varNames);
end

return {
	generateName = generateName, 
	prepare = prepare
};

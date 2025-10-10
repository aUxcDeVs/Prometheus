-- This Script is Part of the Prometheus Obfuscator by Levno_710
-- Modified with Toxic Names by Aux
-- BALANCED EDITION: 60% Real Confusing / 40% Toxic Memes
--
-- namegenerators/confuse.lua (Pure Toxic Edition)
--
-- This Script provides a function for generation of confusing variable names

local util = require("prometheus.util");
local chararray = util.chararray;

local varNames = {
    -- === 60% REAL CONFUSING OBFUSCATION === --
    
    -- REPEATED CHARACTER CONFUSION (looks super encrypted)
    "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII111111IIIII",
    "lllllllllllllllllIIIIIIIIIIIIIIIlllllllllllll",
    "OOOOOOOOOOOOOOO0000000000OOOOOOOOOOO",
    "000000000OOOOOOOOOO000000000OOOOOO",
    "IIIIIIIIIlllllllllIIIIIIIIIlllllllll",
    "111111111llllllllll111111111lllllll",
    "LLLLLLLLLIIIIIIIIIILLLLLLLLLIIIIII",
    "iiiiiiiiiIIIIIIIIIiiiiiiiiiIIIIII",
    "lllllIIIIIlllllIIIIIlllllIIIII",
    "OOOOOOooooooOOOOOOooooooOOOOO",
    "0O0O0O0O0O0O0O0O0O0O0O0O0O0O",
    "Il1lIl1lIl1lIl1lIl1lIl1lIl1l",
    "IlIlIlIlIlIlIlIlIlIlIlIlIlIl",
    "1l1l1l1l1l1l1l1l1l1l1l1l1l1l",
    "IIIIII1111IIIIIlllllIIIII1111",
    "llllllIIIIIIIIllllllIIIIIII",
    "O0O0O0O0O0O0O0O0O0O0O0O0O0O0",
    "oOoOoOoOoOoOoOoOoOoOoOoOoOoO",
    "lIlIlIlIlIlIlIlIlIlIlIlIlIlI",
    "I1I1I1I1I1I1I1I1I1I1I1I1I1I1",
    
    -- SUPER LONG REPEATED PATTERNS (250+ chars)
    "IIIIIIIIIIIIIIIIIIIIIIIIIIIII1111111111111111111111111IIIIIIIIIIIIIIIIIIIIIlllllllllllllllllllIIIIIIIIIIIIIIII1111111111111IIIIIIIIIIlllllllllIIIIIIII",
    "llllllllllllllllllllllllIIIIIIIIIIIIIIIIIIIIIIIIllllllllllllllllllllIIIIIIIIIIIIIIIIIIlllllllllllllllIIIIIIIIIIIIIIIlllllllllllllIIIIIIIIIIIII",
    "OOOOOOOOOOOOOOOOOOOO00000000000000000000OOOOOOOOOOOOOOOOOOooooooooooooooooOOOOOOOOOOOOOOO00000000000OOOOOOOOOOOooooooooOOOOOOOOO",
    "0000000000000000OOOOOOOOOOOOOOOO0000000000000OOOOOOOOOOOO0000000000OOOOOOOOOOOOoooooooo0000000OOOOOOOO0000000OOOOOOoooooo00000",
    "Il1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1lIl1l",
    "IlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIl",
    "1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l1l",
    "O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0O0",
    "oOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoO",
    "lIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlI",
    "I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1I1",
    
    -- MIXED CONFUSION PATTERNS
    "IlIlIlIl1l1l1lOoOoOoOo0O0O0O",
    "llIIllIIllII00OO00OO00",
    "O0o0O0o0O0o0Il1Il1Il1",
    "1lI1lI1lI0O0O0oOoOoO",
    "IIIlll111OOOooo000",
    "lIlIlI0O0O0OoOoOoO1I1I1I",
    "OoOoIlIl1l1l0O0OIlIl",
    "0Oo0Oo0OIl1Il1IlOo0Oo",
    
    -- === 40% TOXIC MEME NAMES === --
    
    -- ORIGINAL TOXIC NAMES
    "PSUdead",
    "IronBrewRust",
    "OldMoonSec",
    "SkillIssue",
    "SkidDetected",
    "NiceTrieKid",
    "TouchGrass",
    "MomsCalling",
    "GoOutside",
    "StillHere",
    "justGiveUp",
    "realy",
    "then",
    "dontobfuscateforstrings",
    "NahBrogetout",
    "CopeMald",
    "RatioPlusL",
    
    -- EMOJI TOXIC NAMES
    "SkillIssue",
    "NahBro",
    "TouchGrass",
    "GetRekt",
    "Skull",
    "Bruh",
    "ForkEdPrometheus",
    "Iusedsomehercules_obfuscation",
    "Bozo",
    
    -- SHORT CHAOS
    "L",
    "W",
    "ratio",
    "cope",
    "skill",
    "issue",
    "bruh",
    "lmao",
    "rekt",
    "noob",
    "skid",
    "based",
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

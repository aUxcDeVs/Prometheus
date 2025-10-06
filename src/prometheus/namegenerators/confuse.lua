-- This Script is Part of the Prometheus Obfuscator by Levno_710
-- Modified with Toxic Names by Aux
--
-- namegenerators/confuse.lua (Pure Toxic Edition)
--
-- This Script provides a function for generation of confusing variable names

local util = require("prometheus.util");
local chararray = util.chararray;

local varNames = {
    -- TOXIC NAMES ONLY (Roasting OLD/DEAD obfuscators)
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
    "WastingTime",
    "FailedCrack",
    "Deobfailed",
    "NahBrogetout",
    "CopeMald",
    "RatioPlusL",
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

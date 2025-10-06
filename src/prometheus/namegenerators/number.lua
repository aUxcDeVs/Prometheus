-- This Script is Part of the Prometheus Obfuscator by Levno_710
--
-- namegenerators/number.lua
--
-- This Script provides a function for generation of simple up counting names but with hex numbers

local PREFIX = "\95";

return function(id, scope)
	return PREFIX .. tostring(id);
end

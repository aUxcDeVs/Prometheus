-- This Script is Part of the AuxFuscator by Aux Credit's ( Lenovo )
--
-- test.lua
-- This script contains the Code for the Prometheus CLI
-- i just use this so i don't modify others Codes :D

-- Configure package.path for requiring Prometheus
local function script_path()
	local str = debug.getinfo(2, "S").source:sub(2)
	return str:match("(.*[/%\\])") or "";
end
package.path = script_path() .. "?.lua;" .. package.path;
require("src.cli");

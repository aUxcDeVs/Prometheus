-- This Script is Part of the Prometheus and AuxFuscator by Levno_710 and Aux
--
-- pipeline.lua
--
-- This Script Provides some configuration presets

return {
    ["Weak"] = {
        -- The default LuaVersion is Lua51
        LuaVersion = "Lua51";
        -- For minifying no VarNamePrefix is applied
        VarNamePrefix = "SK1D";
        -- Name Generator for Variables that look like this: IlI1lI1l
        NameGenerator = "Confuse";
        -- No pretty printing
        PrettyPrint = false;
        -- Seed is generated based on current time
        Seed = 0;
        -- Obfuscation steps
        Steps = {
            {
                Name = "AntiTamper";
                Settings = {
                    UseDebug = false;
                };
            },
            {
                Name = "Vmify";
                Settings = {
                    
                };
            },
            {
                Name = "ConstantArray";
                Settings = {
                    Treshold    = 1;
                    Encoding    = "none";      -- No Base64 encoding
                    Rotate      = true;        -- Enable rotation
                    StringsOnly = false;       -- Extract ALL constants (strings AND numbers)!
                    Shuffle     = true;        -- Shuffle the array too
                }
            },
            {
                Name = "WrapInFunction";
                Settings = {

                }
            },
        }
    };
}

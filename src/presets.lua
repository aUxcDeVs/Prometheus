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
        VarNamePrefix = "T";
        -- Name Generator for Variables that look like this: IlI1lI1l
        NameGenerator = "ConfuseII";
        -- No pretty printing
        PrettyPrint = false;
        -- Seed is generated based on current time
        Seed = 0;
        -- Obfuscation steps
        Steps = {
            {
                Name = "EncryptStrings";
                Settings = {

                };
            },
            {
                Name = "AntiTamper";
                Settings = {
                    UseDebug = true;
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
                    Treshold                = 1;          -- 100% of nodes affected
                    Encoding                = "base64";   -- Base64 encoding for strings
                    StringsOnly             = true;      -- Extract BOTH strings AND numbers
                    Shuffle                 = true;       -- Shuffle the array
                    Rotate                  = true;       -- Rotate the array
                    LocalWrapperTreshold    = 1;          -- 100% of functions get local wrappers
                    LocalWrapperCount       = 5;          -- 5 wrapper functions per scope
                    LocalWrapperArgCount    = 10;         -- 10 arguments per wrapper
                    MaxWrapperOffset        = 65535;      -- Max offset for wrappers
                }
            },
            {
                Name = "NumbersToExpressions";
                Settings = {

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

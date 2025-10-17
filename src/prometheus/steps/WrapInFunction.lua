-- This Script is Part of the Prometheus Obfuscator by Levno_710
--
-- WrapInMoonSec.lua
--
-- This Script provides a MoonSec-Style Wrapper that wraps code with gsub pattern

local Step = require("prometheus.step");
local Ast = require("prometheus.ast");
local Scope = require("prometheus.scope");

local WrapInMoonSec = Step:extend();
WrapInMoonSec.Description = "This Step Wraps the Entire Script in MoonSec Style with gsub wrapper";
WrapInMoonSec.Name = "Wrap in MoonSec";

WrapInMoonSec.SettingsDescriptor = {
	Iterations = {
		name = "Iterations",
		description = "The Number Of Wrapper Iterations",
		type = "number",
		default = 1,
		min = 1,
		max = nil,
	},
	HeaderText = {
		name = "Header Text",
		description = "The protection header text",
		type = "string",
		default = "This file was protected with MoonSec V3",
	}
}

function WrapInMoonSec:init(settings)
	self.HeaderText = settings.HeaderText or "This file was protected with Shizo V3";
end

function WrapInMoonSec:apply(ast)
	for i = 1, self.Iterations, 1 do
		local body = ast.body;
		local scope = Scope:new(ast.globalScope);
		body.scope:setParent(scope);

		-- Create the MoonSec wrapper pattern:
		-- ([[Header]]):gsub('.+', (function(a) _Var = a; end)); 
		-- return(function(...)
		--     [original code]
		-- end)(...)
		
		local gsubWrapper = Ast.FunctionCallExpression(
			Ast.IndexExpression(
				Ast.StringExpression(self.HeaderText),
				Ast.StringExpression("gsub")
			),
			{
				Ast.StringExpression(".+"),
				Ast.FunctionLiteralExpression(
					{Ast.VariableExpression("a")},
					Ast.Block({
						Ast.AssignmentStatement(
							{Ast.VariableExpression("_MoonSecVar")},
							{Ast.VariableExpression("a")}
						)
					}, Scope:new())
				)
			}
		);

		ast.body = Ast.Block({
			Ast.DoStatement(Ast.Block({gsubWrapper}, Scope:new())),
			Ast.ReturnStatement({
				Ast.FunctionCallExpression(
					Ast.FunctionLiteralExpression(
						{Ast.VarargExpression()}, 
						body
					), 
					{Ast.VarargExpression()}
				)
			})
		}, scope);
	end
end

return WrapInMoonSec;

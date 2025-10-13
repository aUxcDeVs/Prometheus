return {
	WrapInFunction = require("prometheus.steps.WrapInFunction");
	Vmify = require("prometheus.steps.Vmify");
	ConstantArray = require("prometheus.steps.ConstantArray");
	AntiTamper = require("prometheus.steps.AntiTamper");
	EncryptStrings = require("prometheus.steps.EncryptStrings");
	NumbersToExpressions = require("prometheus.steps.NumbersToExpressions");
	ProxifyLocals = require("prometheus.steps.ProxifyLocals");
	AddVararg = require("prometheus.steps.AddVararg");
}

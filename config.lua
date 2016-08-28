boxing = {};

--subgroups to allow boxing for
boxing.itemSubgroups = {
	["terrain"] = true,
	["raw-resource"] = true,
	["raw-material"] = true,
	["intermediate-product"] = true,
	["bob-ores"] = true,
	["bob-resource"] = true,
	["bob-resource-chemical"] = true,
	["bob-alien-resource"] = true,
	["bob-material"] = true,
	["bob-material-smelting"] = true,
	["bob-material-chemical"] = true,
	["bob-material-electrolysis"] = true,
	["bob-alloy"] = true,
	["bob-electronic-components"] = true,
	["bob-boards"] = true,
	["bob-electronic-boards"] = true,
	["bob-greenhouse-items"] = true,
	["bob-intermediates"] = true,
	["bob-gears"] = true,
	["bob-bearings"] = true,
	["bob-gems-ore"] = true,
	["bob-gems-raw"] = true,
	["bob-gems-cut"] = true,
	["bob-gems-polished"] = true,
	["bob-robot-parts"] = true,
};

--specific items to allow boxing for
boxing.itemNames = {
	["rail"] = true,
};

--boxing subgroups to create (for sorting items)
boxing.subgroups = {
	["transport"] = true,
};
for subgroup, i in pairs(boxing.itemSubgroups) do
	boxing.subgroups[subgroup] = true;
end

boxing.woodenUnlocks = {
	{
		type = "unlock-recipe",
		recipe = "wooden-box",
	},
};
boxing.steelUnlocks = {
	{
		type = "unlock-recipe",
		recipe = "steel-box",
	},
};
boxing.tungstenUnlocks = {
	{
		type = "unlock-recipe",
		recipe = "tungsten-box",
	},
};
boxing.items = {};

boxing.generateIconConfig = false;

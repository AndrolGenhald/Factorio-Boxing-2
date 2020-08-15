boxing = {};

boxing.tungsten = true and data.raw.item["tungsten-plate"];

--TODO make option
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

--TODO make stack sizes option
boxing.types = {
	{
		name = "wooden",
		stack_size = 5,
		box_ingredients = {{"wood", 4}},
	},
	{
		name = "steel",
		stack_size = 10,
		box_ingredients = {{"steel-plate", 2}},
	},
}

if (boxing.tungsten) then
	table.insert(boxing.types, {
		name = "tungsten",
		stack_size = 20,
		box_ingredients = {{"tungsten-plate", 2}},
	});
end

boxing.unlocks = {}
for i,type in pairs(boxing.types) do
	boxing.unlocks[type.name] = {};
end

boxing.items = {};
boxing.subgroups = {};

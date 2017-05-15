require("config");

for i,item in pairs(data.raw.item) do
	if boxing.itemSubgroups[item.subgroup] or boxing.itemNames[item.name] then
		table.insert(boxing.items, item);
	end
end
for i,item in pairs(data.raw["rail-planner"]) do
	if boxing.itemSubgroups[item.subgroup] or boxing.itemNames[item.name] then
		table.insert(boxing.items, item);
	end
end

require("prototypes.item.groups");
require("prototypes.recipe.categories");

require("prototypes.item.boxes");
require("prototypes.recipe.boxes");

require("prototypes.item.boxing");
require("prototypes.recipe.boxing");
require("prototypes.technology.boxing");

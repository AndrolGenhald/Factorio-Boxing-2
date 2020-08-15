require("config");

for i,item in pairs(data.raw.item) do
	if boxing.itemSubgroups[item.subgroup] or boxing.itemNames[item.name] then
		table.insert(boxing.items, item);
		boxing.subgroups[item.subgroup] = true;
	end
end

-- Hard-coded exception since rails aren't like other items, they're under "rail-planner" instead of "item".
for i,item in pairs(data.raw["rail-planner"]) do
	if boxing.itemSubgroups[item.subgroup] or boxing.itemNames[item.name] then
		table.insert(boxing.items, item);
		boxing.subgroups[item.subgroup] = true;
	end
end

require("prototypes.item.groups");
require("prototypes.recipe.categories");

require("prototypes.item.boxes");
require("prototypes.recipe.boxes");

require("prototypes.item.boxing");
require("prototypes.recipe.boxing");
require("prototypes.technology.boxing");

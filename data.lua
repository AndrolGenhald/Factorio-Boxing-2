require("config");

boxing.tungsten = data.raw.tool["science-pack-gold"]
	and data.raw.tool["alien-science-pack-blue"]
	and data.raw.tool["alien-science-pack-orange"]
	and data.raw.tool["alien-science-pack-purple"]
	and data.raw.tool["alien-science-pack-yellow"]
	and data.raw.tool["alien-science-pack-green"]
	and data.raw.tool["alien-science-pack-red"]
	and data.raw.item["tungsten-plate"]
;

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


if boxing.generateIconConfig then
	data:extend({
		{
			type = "item-group",
			name = "boxing-icons",
			icon = "__boxing-2__/graphics/icons/box-64.png",
		},
		{
			type = "item-subgroup",
			name = "boxing-icons",
			group = "boxing-icons",
		},
	});
	for i,item in pairs(boxing.items) do
		data:extend({
			{
				type = "item",
				name = "box-icon-" .. item.name,
				icon = "__boxing-2__/graphics/icons/box-64.png",
				subgroup = "boxing-icons",
				--store the item's icon as the order string so that control.lua can grab it and write it to a config file
				order = item.icon,
				stack_size = 1,
				flags = {},
			},
		});
	end
else
	require("icon-lists");
	for i, list in pairs(boxing["icon-lists"]) do
		require(list:sub(0, -5));
	end

	require("prototypes.item.groups");
	require("prototypes.recipe.categories");

	require("prototypes.item.boxes");
	require("prototypes.recipe.boxes");

	require("prototypes.item.boxing");
	require("prototypes.recipe.boxing");
	require("prototypes.technology.boxing");
end

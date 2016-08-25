data:extend({
	{
		type = "recipe-category",
		name = "boxing-wooden",
	},
	{
		type = "recipe-category",
		name = "boxing-steel",
	},
});

if boxing.tungsten then
	data:extend({
		{
			type = "recipe-category",
			name = "boxing-tungsten",
		},
	});
end

table.insert(data.raw.player.player.crafting_categories, "boxing-wooden");

for i,machine in pairs(data.raw["assembling-machine"]) do
	if machine.name:sub(1, 18) == "assembling-machine" then
		table.insert(machine.crafting_categories, "boxing-wooden");
		table.insert(machine.crafting_categories, "boxing-steel");
		if boxing.tungsten then
			table.insert(machine.crafting_categories, "boxing-tungsten");
		end
	end
end

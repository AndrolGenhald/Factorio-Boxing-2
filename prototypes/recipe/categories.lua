for i,type in pairs(boxing.types) do
	data:extend({
		{
			type = "recipe-category",
			name = "boxing-" .. type.name,
		},
	});

	for j,machine in pairs(data.raw["assembling-machine"]) do
		if machine.name:sub(1, 18) == "assembling-machine" then
			table.insert(machine.crafting_categories, "boxing-" .. type.name);
		end
	end
end

-- TODO make player crafting a mod option
table.insert(data.raw.player.player.crafting_categories, "boxing-wooden");

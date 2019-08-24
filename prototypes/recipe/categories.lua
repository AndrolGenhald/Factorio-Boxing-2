for i,type in pairs(boxing.types) do
	data:extend({
		{
			type = "recipe-category",
			name = "boxing-" .. type.name,
		},
	})

	for j,machine in pairs(data.raw["assembling-machine"]) do
		if machine.name:sub(1, 18) == "assembling-machine" then
			table.insert(machine.crafting_categories, "boxing-" .. type.name)
		end
	end
end

if settings.startup["player-craftable-wooden-boxing"].value then
	table.insert(data.raw.character.character.crafting_categories, "boxing-wooden")
end

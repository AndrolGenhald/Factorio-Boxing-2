for i,type in pairs(boxing.types) do
	data:extend({
		{
			type = "recipe",
			name = type.name .. "-box",
			ingredients = type.box_ingredients,
			result = type.name .. "-box",
			enabled = "false",
		},
	});
	table.insert(boxing.unlocks[type.name], {
		type = "unlock-recipe",
		recipe = type.name .. "-box",
	});
end

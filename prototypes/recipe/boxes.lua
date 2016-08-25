data:extend({
	{
		type = "recipe",
		name = "wooden-box",
		ingredients = {
			{"wood", 4},
		},
		result = "wooden-box",
		enabled = "false",
	},
	{
		type = "recipe",
		name = "steel-box",
		ingredients = {
			{"steel-plate", 2},
		},
		result = "steel-box",
		enabled = "false",
	},
});

if boxing.tungsten then
	data:extend({
		{
			type = "recipe",
			name = "tungsten-box",
			ingredients = {
				{"tungsten-plate", 2},
			},
			result = "tungsten-box",
			enabled = "false",
		},
	});
end

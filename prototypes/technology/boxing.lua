data:extend({
	{
		type = "technology",
		name = "wooden-boxing",
		icon = "__boxing-2__/graphics/icons/wooden-128.png",
		icon_size = 128,
		order = "z[boxing]-a[wooden]",
		unit = {
			count = 100,
			ingredients = {
				{"automation-science-pack", 2},
				{"logistic-science-pack", 2},
			},
			time = 60,
		},
		effects = boxing.unlocks["wooden"],
	},
	{
		type = "technology",
		name = "steel-boxing",
		icon = "__boxing-2__/graphics/icons/steel-128.png",
		icon_size = 128,
		order = "z[boxing]-b[steel]",
		prerequisites = {"wooden-boxing"},
		unit = {
			count = 200,
			ingredients = {
				{"automation-science-pack", 2},
				{"logistic-science-pack", 2},
				{"chemical-science-pack", 2},
			},
			time = 90,
		},
		effects = boxing.unlocks["steel"],
	},
});

if boxing.tungsten then
	data:extend({
		{
			type = "technology",
			name = "tungsten-boxing",
			icon = "__boxing-2__/graphics/icons/tungsten-128.png",
			icon_size = 128,
			order = "z[boxing]-c[tungsten]",
			prerequisites = {"steel-boxing"},
			unit = {
				count = 300,
				ingredients = {
					{"automation-science-pack", 2},
					{"logistic-science-pack", 2},
					{"chemical-science-pack", 2},
					{"high-tech-science-pack", 2},
				},
				time = 120,
			},
			effects = boxing.unlocks["tungsten"],
		},
	});
end

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
				{"science-pack-1", 2},
				{"science-pack-2", 2},
				{"science-pack-3", 2},
			},
			time = 60,
		},
		effects = boxing.woodenUnlocks,
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
				{"science-pack-1", 2},
				{"science-pack-2", 2},
				{"science-pack-3", 2},
				{"alien-science-pack", 2},
			},
			time = 90,
		},
		effects = boxing.steelUnlocks,
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
					{"science-pack-gold", 2},
					{"alien-science-pack", 2},
					{"alien-science-pack-blue", 2},
					{"alien-science-pack-orange", 2},
					{"alien-science-pack-purple", 2},
					{"alien-science-pack-yellow", 2},
					{"alien-science-pack-green", 2},
					{"alien-science-pack-red", 2},
				},
				time = 120,
			},
			effects = boxing.tungstenUnlocks,
		},
	});
end

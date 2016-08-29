for i, force in pairs(game.forces) do
	if force.technologies["wooden-boxing"].researched then
		force.recipes["wooden-box-rail"].enabled = true;
		force.recipes["wooden-unbox-rail"].enabled = true;
		for j, recipe in pairs(force.recipes) do
			if recipe.subgroup.name == "boxing-wooden-terrain"
				or recipe.subgroup.name == "unboxing-wooden-terrain"
			then
				recipe.enabled = true;
			end
		end
	end
	if force.technologies["steel-boxing"].researched then
		force.recipes["steel-box-rail"].enabled = true;
		force.recipes["steel-unbox-rail"].enabled = true;
		for j, recipe in pairs(force.recipes) do
			if recipe.subgroup.name == "boxing-steel-terrain"
				or recipe.subgroup.name == "unboxing-steel-terrain"
			then
				recipe.enabled = true;
			end
		end
	end
	if force.technologies["tungsten-boxing"].researched then
		force.recipes["tungsten-box-rail"].enabled = true;
		force.recipes["tungsten-unbox-rail"].enabled = true;
		for j, recipe in pairs(force.recipes) do
			if recipe.subgroup.name == "boxing-tungsten-terrain"
				or recipe.subgroup.name == "unboxing-tungsten-terrain"
			then
				recipe.enabled = true;
			end
		end
	end
end

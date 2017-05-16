local function flatten_icons(icons, scale, shift)
	local icons_new = {}
	for i,spec in pairs(icons) do
		spec = table.deepcopy(spec)

		if not spec.scale then
			spec.scale = 1
		end
		spec.scale = scale * spec.scale

		if not spec.shift then
			spec.shift = {0, 0}
		end
		spec.shift = {shift[1] + spec.shift[1] * scale, shift[2] + spec.shift[2] * scale}

		if type(spec.icon) == "table" then
			for j,flattened in pairs(flatten_icons(spec.icon, spec.scale, spec.shift)) do
				table.insert(icons_new, flattened)
			end
		else
			table.insert(icons_new, spec)
		end
	end
	return icons_new
end

function flatten_icons_spec(icons)
	return flatten_icons(icons, 1, {0, 0})
end

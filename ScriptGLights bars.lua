local selection = game.Selection:Get()
if #selection == 0 then return end

for _, model in ipairs(selection) do
	if model and model.Name then
		local head = model:FindFirstChild("Head")
		if head then
			local lensFolder = head:FindFirstChild("Lens")
			if lensFolder then
				local fixNumber = tonumber(model.Name:match("%d+$"))
				if fixNumber and fixNumber > 1 then
					local lenses = lensFolder:GetChildren()
					local lensCount = #lenses
					local amountToAdd = lensCount * (fixNumber - 1)
					for _, lens in ipairs(lenses) do
						local n = tonumber(lens.Name)
						if n then
							lens.Name = tostring(n + amountToAdd)
						end
					end
				end
			end
		end
	end
end

local mod = {}

-----------------------------------
--Helper Functions (thanks piber)--
-----------------------------------

function mod.GetPlayers(functionCheck, ...)

	local args = {...}
	local players = {}
	
	local game = Game()
	
	for i=1, game:GetNumPlayers() do
	
		local player = Isaac.GetPlayer(i-1)
		
		local argsPassed = true
		
		if type(functionCheck) == "function" then
		
			for j=1, #args do
			
				if args[j] == "player" then
					args[j] = player
				elseif args[j] == "currentPlayer" then
					args[j] = i
				end
				
			end
			
			if not functionCheck(table.unpack(args)) then
			
				argsPassed = false
				
			end
			
		end
		
		if argsPassed then
			players[#players+1] = player
		end
		
	end
	
	return players
	
end

function mod.GetPlayerFromTear(tear)
	for i=1, 3 do
		local check = nil
		if i == 1 then
			check = tear.Parent
		elseif i == 2 then
			check = mod.GetSpawner(tear)
		elseif i == 3 then
			check = tear.SpawnerEntity
		end
		if check then
			if check.Type == EntityType.ENTITY_PLAYER then
				return mod.GetPtrHashEntity(check):ToPlayer()
			elseif check.Type == EntityType.ENTITY_FAMILIAR and check.Variant == FamiliarVariant.INCUBUS then
				local data = mod.GetData(tear)
				data.IsIncubusTear = true
				return check:ToFamiliar().Player:ToPlayer()
			end
		end
	end
	return nil
end

function mod.GetSpawner(entity)
	if entity and entity.GetData then
		local spawnData = mod.GetSpawnData(entity)
		if spawnData and spawnData.SpawnerEntity then
			local spawner = mod.GetPtrHashEntity(spawnData.SpawnerEntity)
			return spawner
		end
	end
	return nil
end

function mod.GetSpawnData(entity)
	if entity and entity.GetData then
		local data = mod.GetData(entity)
		return data.SpawnData
	end
	return nil
end

function mod.GetPtrHashEntity(entity)
	if entity then
		if entity.Entity then
			entity = entity.Entity
		end
		for _, matchEntity in pairs(Isaac.FindByType(entity.Type, entity.Variant, entity.SubType, false, false)) do
			if GetPtrHash(entity) == GetPtrHash(matchEntity) then
				return matchEntity
			end
		end
	end
	return nil
end

function mod.GetData(entity)
	if entity and entity.GetData then
		local data = entity:GetData()
		if not data.KeepersRope then
			data.KeepersRope = {}
		end
		return data.KeepersRope
	end
	return nil
end

function mod.Contains(list, x)
	for _, v in pairs(list) do
		if v == x then return true end
	end
	return false
end

return mod
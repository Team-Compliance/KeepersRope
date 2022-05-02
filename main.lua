local mod = RegisterMod("Keeper's Rope", 1);
local piberFuncs = require("piberFuncs")
local game = Game();
CollectibleType.COLLECTIBLE_KEEPERS_ROPE = Isaac.GetItemIdByName("Keeper's Rope")
local KeepersRope = {Id = Isaac.GetEntityTypeByName("Hanging rope"), Variant = Isaac.GetEntityVariantByName("Hanging rope")}
local coinIndicator = Sprite()
coinIndicator:Load("gfx/005.021_penny.anm2",true)
coinIndicator:SetFrame("Idle",10)
coinIndicator.Color = Color(1,1,1,0.55)
coinIndicator.Scale = Vector(0.8, 0.8)

--EID Compatibility 

if EID then
	local KeepersRopeDescEng = "Grants flight#{{Coin}} When monsters spawn they have a 25% chance to contain 1-3 pennies which can extracted by damaging them#{{Player14}} When playing as Keeper monsters have 16.7% chance to contain 1-2 pennies#{{Player33}} When playing as Tainted Keeper monsters have 12.5% chance to contain 1 penny#!!! The pennies disappear after 3 seconds"
	local KeepersRopeDescRu = "Даёт полёт#{{Coin}} Когда монстры появляются у них есть 25% шанс иметь 1-3 монет, которые выпадают при нанесении им урона#{{Player14}} При игре за Хранителя у монстров есть 16.7% шанс иметь 1-2 монеты#{{Player33}} При игре за Порченого Хранителя у монстров есть 12.5% шанс иметь 1 монету#!!! Монеты исчезают через 3 секунды"
	local KeepersRopeDescSpa = "Puedes volar#{{Coin}} Cuando se generen los enemigos, tendrán un 25% de tener 1-3 monedas#Las puedes obtener al hacerles daño#{{Player14}} Con Keeper los enemigos tendrán 16.7% de tener 1-2 monedas#{{Player33}} Con Keeper Contaminado los enemigos tendrán un 12.5% de tener 1 moneda#!!! Las monedas desaparecen después de 3 segundos"
    EID:addCollectible(CollectibleType.COLLECTIBLE_KEEPERS_ROPE, KeepersRopeDescEng, "Keeper's Rope")
    EID:addCollectible(CollectibleType.COLLECTIBLE_KEEPERS_ROPE, KeepersRopeDescRu, "Веревка Хранителя", "ru")
	EID:addCollectible(CollectibleType.COLLECTIBLE_KEEPERS_ROPE, KeepersRopeDescSpa, "La soga de Keeper", "spa")
end

--Encyclopeida Compatibility
local Wiki = {
  KeepersRope = {
    { -- Effect
      {str = "Effect", fsize = 2, clr = 3, halign = 0},
      {str = "Grants flight."},
      {str = "When monsters spawn they have a 25% chance to contain 1-3 pennies."},
      {str = "When playing as Keeper monsters have 16.7% chance to contain 1-2 pennies."},
      {str = "When playing as Tainted Keeper monsters have 12.5% chance to contain 1 penny."},
      {str = "The pennies can be extracted by inflicting damage on the monsters."},
      {str = "The pennies disappear after 3 seconds."},
    },
    { -- Notes
      {str = "Notes", fsize = 2, clr = 3, halign = 0},
      {str = "Monsters containing pennies are indicated by a transluscent penny hovering over their heads."},
      {str = "This item has a chance of spawning after blowing up a shopkeeper, similarly to Head of the Keeper, Steam Sale, and Coupon."},
    },
    { -- Synergies
      {str = "Synergies", fsize = 2, clr = 3, halign = 0},
      {str = "Dad's Key: Dropped coins have a 33% chance to be replaced with keys."},
      {str = "Mr. Boom: Dropped coins have a 33% chance to be replaced with bombs."},
      {str = "Crooked Penny: Dropped coins have a 50% chance to be doubled."},
      {str = "Humbling Bundle: Dropped coins, bombs, and keys have a 50% chance to be doubled."},
      {str = "BOGO Bombs: Dropped bombs from the Mr. Boom synergy have a 100% chance to be doubled."},
    },
    { -- Trivia
      {str = "Trivia", fsize = 2, clr = 3, halign = 0},
      {str = "Keeper's Rope was one of the few cancelled items that was originally planned to be in Repentance."},
      {str = "According to its unlock paper sprite, Keeper's Rope was supposed to look similar to the item Transendence, so similar in fact that Team Compliance decided to edit it in order to avoid potential confusion."},
      {str = "The original Keeper's Rope mod was made by Akad!"},
      {str = "This mod was primarily coded by BrakeDude!"},
    },
  }
}

if Encyclopedia then
	Encyclopedia.AddItem({
	  ID = CollectibleType.COLLECTIBLE_KEEPERS_ROPE,
	  WikiDesc = Wiki.KeepersRope,
	  Pools = {
		Encyclopedia.ItemPools.POOL_SECRET,
		Encyclopedia.ItemPools.POOL_GREED_SECRET,
		Encyclopedia.ItemPools.POOL_GREED_SHOP,
	  },
	})
end

--Minimap Items Compatibility
if MiniMapiItemsAPI then
    local frame = 1
    local keepersropeSprite = Sprite()
    keepersropeSprite:Load("gfx/ui/minimapitems/keepersrope_icon.anm2", true)
    MiniMapiItemsAPI:AddCollectible(CollectibleType.COLLECTIBLE_KEEPERS_ROPE, keepersropeSprite, "CustomIconKeepersRope", frame)
end

local NoCoinList = {
	{EntityType.ENTITY_STONEHEAD},
	{EntityType.ENTITY_POKY},
	{EntityType.ENTITY_MASK},
	{EntityType.ENTITY_ETERNALFLY},
	{EntityType.ENTITY_STONE_EYE},
	{EntityType.ENTITY_CONSTANT_STONE_SHOOTER},
	{EntityType.ENTITY_BRIMSTONE_HEAD},
	{EntityType.ENTITY_DEATHS_HEAD,0},
	{EntityType.ENTITY_DEATHS_HEAD,2},
	{EntityType.ENTITY_DEATHS_HEAD,3},
	{EntityType.ENTITY_WALL_HUGGER},
	{EntityType.ENTITY_GAPING_MAW},
	{EntityType.ENTITY_BROKEN_GAPING_MAW},
	{EntityType.ENTITY_PITFALL},
	{EntityType.ENTITY_CORN_MINE},
	{EntityType.ENTITY_STONEY},
	{EntityType.ENTITY_PORTAL},
	{EntityType.ENTITY_BLOOD_PUPPY},
	{EntityType.ENTITY_QUAKE_GRIMACE},
	{EntityType.ENTITY_BOMB_GRIMACE},
	{EntityType.ENTITY_FISSURE},
	{EntityType.ENTITY_SPIKEBALL},
	{EntityType.ENTITY_SMALL_MAGGOT},
	{EntityType.ENTITY_MOCKULUS},
	{EntityType.ENTITY_GRUDGE},
	{EntityType.ENTITY_DUSTY_DEATHS_HEAD},
	{EntityType.ENTITY_SINGE,1},
	{EntityType.ENTITY_GIDEON},
	{EntityType.ENTITY_ROTGUT,1},
	{EntityType.ENTITY_ROTGUT,2}
}

--Functionality Code
local function GetRope(player,bool)
	bool = bool or false
	for _,rope in ipairs(Isaac.FindByType(KeepersRope.Id, KeepersRope.Variant)) do
		rope = rope:ToEffect()
		if GetPtrHash(rope.SpawnerEntity) == GetPtrHash(player) then
			return bool and true or rope
		end
	end
	return bool and false or nil
end

function mod:Rope(player)
	local BeastFight = game:GetLevel():GetAbsoluteStage() == LevelStage.STAGE8 and game:GetRoom():GetType() == RoomType.ROOM_DUNGEON
	if not BeastFight and not player:IsDead() then
		if player:HasCollectible(CollectibleType.COLLECTIBLE_KEEPERS_ROPE) then
			if not GetRope(player, true) then
				Isaac.Spawn(KeepersRope.Id, KeepersRope.Variant, 0, player.Position, Vector.Zero, player)
			else
				local rope = GetRope(player)
				rope.Position = player.Position
				rope.DepthOffset = -10
			end
		end
	end
end
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, mod.Rope)

function mod:RopeInit(rope)
	local sprite = rope:GetSprite()
	sprite:SetFrame("Rope",0)
end
mod:AddCallback(ModCallbacks.MC_POST_EFFECT_INIT, mod.RopeInit, KeepersRope.Variant)

function mod:RopeUpdate(rope)
	local BeastFight = game:GetLevel():GetAbsoluteStage() == LevelStage.STAGE8 and game:GetRoom():GetType() == RoomType.ROOM_DUNGEON
	if not rope.SpawnerEntity:Exists() or rope.SpawnerType ~= EntityType.ENTITY_PLAYER or BeastFight then
		rope:Remove()
	end
	local player = rope.SpawnerEntity:ToPlayer()
	--rope.Position = player.Position
	if player:HasCollectible(CollectibleType.COLLECTIBLE_KEEPERS_ROPE) == false or player:IsDead() then
		rope:Remove()
	elseif player:GetPlayerType() ~= PlayerType.PLAYER_THELOST and player:GetPlayerType() ~= PlayerType.PLAYER_THELOST_B
	and player:GetPlayerType() ~= PlayerType.PLAYER_THESOUL and player:GetPlayerType() ~= PlayerType.PLAYER_THESOUL_B then
		local sprite = player:GetSprite()
		if sprite:IsPlaying("WalkLeft") or sprite:IsPlaying("WalkRight")
		or sprite:IsPlaying("WalkUp") or sprite:IsPlaying("WalkDown") 
		or sprite:IsPlaying("PickupWalkLeft") or sprite:IsPlaying("PickupWalkRight")
		or sprite:IsPlaying("PickupWalkUp") or sprite:IsPlaying("PickupWalkDown")then
			sprite:Stop()
		end
	end
end
mod:AddCallback(ModCallbacks.MC_POST_EFFECT_UPDATE, mod.RopeUpdate, KeepersRope.Variant)

local function DontGiveCoins(npc)
	if npc.SpawnerEntity ~= nil or game:GetLevel():GetAbsoluteStage() == LevelStage.STAGE8 then
		return true
	end
	if not npc:IsVulnerableEnemy() then
		return true
	end
	if not npc:IsActiveEnemy(false) then
		return true
	end
	if npc:HasEntityFlags(EntityFlag.FLAG_NO_STATUS_EFFECTS) or npc:HasEntityFlags(EntityFlag.FLAG_FRIENDLY) or npc:HasEntityFlags(EntityFlag.FLAG_PERSISTENT) then
		return true
	end
	for _,entity in pairs(NoCoinList) do
		if entity[1] == npc.Type then
			if entity[2] then
				if entity[2] == npc.Variant then
					return true
				end	
			else
				return true
			end
		end
	end
	return false
end

function mod:HereComesTheMoney(npc)
	if DontGiveCoins(npc) then return end
	local room = game:GetRoom()
	local rng = RNG()
	rng:SetSeed(npc.InitSeed, 35)
	for _, e in ipairs(Isaac.FindByType(EntityType.ENTITY_PLAYER)) do
		local player = e:ToPlayer()
		if player:HasCollectible(CollectibleType.COLLECTIBLE_KEEPERS_ROPE) then
			local isKeeper = player:GetPlayerType() == PlayerType.PLAYER_KEEPER
			local isTaintedKeeper = player:GetPlayerType() == PlayerType.PLAYER_KEEPER_B
			local chance = isTaintedKeeper and 8 or (isKeeper and 6 or 4)
			local coins = isTaintedKeeper and 1 or (isKeeper and 2 or 3)
			if rng:RandomInt(chance) == 1 then
				local entityData = piberFuncs.GetData(npc)
				local mul = npc:IsBoss() and 2 or 1
				entityData.CoinsToBeat = (rng:RandomInt(coins + 1)) * mul
				if entityData.CoinsToBeat == 0 then entityData.CoinsToBeat = nil end
			end
		end
	end
end
mod:AddCallback(ModCallbacks.MC_POST_NPC_INIT, mod.HereComesTheMoney)

function mod:MoneyMoneyMoneyMoney(entity, _, damageflags, source)
	if source.Type > 0 and damageflags & DamageFlag.DAMAGE_NOKILL ~= DamageFlag.DAMAGE_NOKILL then
		local data = piberFuncs.GetData(entity)
		if entity:IsVulnerableEnemy() and data.CoinsToBeat then			
			if data.CoinsToBeat > 0 then
				for i = 0, game:GetNumPlayers() - 1 do
					local player = game:GetPlayer(i)
					local pickup = {Variant = PickupVariant.PICKUP_COIN, SubType = CoinSubType.COIN_PENNY}
					local ropeRNG = player:GetCollectibleRNG(CollectibleType.COLLECTIBLE_KEEPERS_ROPE)
					local vector = Vector(math.random(1,3) * (math.random(1,2) == 1 and 1 or -1), math.random(1,3) * (math.random(1,2) == 1 and 1 or -1))
					if player:HasCollectible(CollectibleType.COLLECTIBLE_DADS_KEY) and ropeRNG:RandomInt(3) == 0 then
						pickup = {Variant = PickupVariant.PICKUP_KEY, SubType = KeySubType.KEY_NORMAL}
					end
					if player:HasCollectible(CollectibleType.COLLECTIBLE_MR_BOOM) and ropeRNG:RandomInt(3) == 0 then
						pickup = {Variant = PickupVariant.PICKUP_BOMB, SubType = BombSubType.BOMB_NORMAL}
					end
					Isaac.Spawn(EntityType.ENTITY_PICKUP, pickup.Variant, pickup.SubType, entity.Position, vector, nil):ToPickup().Timeout = 90
					data.CoinsToBeat = data.CoinsToBeat - 1
				end
			end
		end
	end
end
mod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, mod.MoneyMoneyMoneyMoney)

function mod:MoneyMoneyMoneyMoneyMoney(npc)
	local data = piberFuncs.GetData(npc)
	if Game():GetRoom():GetRenderMode() == RenderMode.RENDER_WATER_REFLECT then return end
	if data.CoinsToBeat and data.CoinsToBeat > 0 and npc.Visible then
		local color = Color(1,1,1,1)
		color:SetColorize(1,0.5,0,0.6)
		npc:GetSprite().Color = color
		coinIndicator:Render((Isaac.WorldToScreen(npc.Position) + Vector(0,-2.3)*(npc.Size <20 and npc.Size or 20) ),Vector.Zero,Vector.Zero)
		coinIndicator.Color = Color(1,1,1,0.5)
	end
end
mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, mod.MoneyMoneyMoneyMoneyMoney)

function mod:DollarDollar(npc)
	local data = piberFuncs.GetData(npc)
	if data.CoinsToBeat and data.CoinsToBeat > 0 then
		for i = 1, data.CoinsToBeat do
			for i = 0, game:GetNumPlayers() - 1 do
				local player = game:GetPlayer(i)
				local ropeRNG = player:GetCollectibleRNG(CollectibleType.COLLECTIBLE_KEEPERS_ROPE):RandomInt(3)
				local pickup
				local vector = Vector(math.random(1,3) * (math.random(1,2) == 1 and 1 or -1), math.random(1,3) * (math.random(1,2) == 1 and 1 or -1))
				if player:HasCollectible(CollectibleType.COLLECTIBLE_DADS_KEY) then
					if ropeRNG == 0 then
						pickup = Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_KEY, KeySubType.KEY_NORMAL, npc.Position, vector, nil):ToPickup()
					else
						pickup = Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_PENNY, npc.Position, vector, nil):ToPickup()
					end
				elseif player:HasCollectible(CollectibleType.COLLECTIBLE_MR_BOOM) then
					if ropeRNG == 0 then
						pickup = Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_BOMB, BombSubType.BOMB_NORMAL, npc.Position, vector, nil):ToPickup()
					else
						pickup = Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_PENNY, npc.Position, vector, nil):ToPickup()
					end
				else
					pickup = Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_PENNY, npc.Position, vector, nil):ToPickup()
				end
				data.CoinsToBeat = data.CoinsToBeat - 1
				pickup.Timeout = 90
			end
		end
	end
end
mod:AddCallback(ModCallbacks.MC_POST_ENTITY_KILL, mod.DollarDollar)

function mod:NoSoap(player,cacheFlag)
	if player:HasCollectible(CollectibleType.COLLECTIBLE_KEEPERS_ROPE) then
		player.CanFly = true
	end
end
mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.NoSoap, CacheFlag.CACHE_FLYING)

function mod:RopeReplacement(pickup)
    if pickup.FrameCount < 2 and pickup.FrameCount < Game():GetRoom():GetFrameCount() and
	(pickup.SubType == CollectibleType.COLLECTIBLE_STEAM_SALE or pickup.SubType == CollectibleType.COLLECTIBLE_HEAD_OF_THE_KEEPER) then
        local pickData = piberFuncs.GetData(pickup)

        if not pickData.RNG then
            pickData.RNG = RNG()
            pickData.RNG:SetSeed(pickup.InitSeed, 35)
        end

		if pickData.RNG:RandomInt(3) == 0 and pickup.SubType ~= CollectibleType.COLLECTIBLE_KEEPERS_ROPE then
			pickup:Morph(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_KEEPERS_ROPE, true, true, false)
		end
                
    end
end
mod:AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, mod.RopeReplacement, PickupVariant.PICKUP_COLLECTIBLE)

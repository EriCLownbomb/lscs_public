local force = {}
force.PrintName = "Force Choke"
force.Author = "Eric"
force.Description = "Harder."
force.id = "chokeanakin" -- lowercase only
--force.Spawnable = false  -- uncomment to unlist in q-menu

--[[
-- adds a hook to Think with 0.1 second interval. Only uncomment if needed
force.OnClk =  function( ply, TIME )
	print(TIME)
end
]]

force.Equip = function( ply )
	print("i got equipped")
end

force.UnEquip = function( ply )
	print("i got unequipped :(")
end

force.StartUse = function( ply )
	if ply:lscsGetForce() < 5 then return end -- do we have enough force points ?

	if hook.Run( "LSCS:PlayerCanManipulate", ply, target_entity, false ) then return end  -- if you are making a forcepower that can manipulate other ents, run this hook to check if the other player has force block.

	ply:lscsTakeForce( 5 ) -- take amount of force we need

	ply:EmitSound("wos/icefuse/choke_start.wav")

	LSCS:PlayVCDSequence( ply, "wos_cast_choke", 0 ) -- play animation
end

force.StopUse = function( ply )
	-- called when the force power key is released
end

LSCS:RegisterForce( force )

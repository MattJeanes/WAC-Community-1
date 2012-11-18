if SERVER then AddCSLuaFile() end

local f=file.Find('wac/*.lua', "LUA")
local found=false
for k,v in pairs(f) do
	if v=="aircraft.lua" then
		include('wac/aircraft.lua')
		found=true
	end
end

timer.Simple(2,function()
	if not found and CLIENT then
		LocalPlayer():ChatPrint("WAC Aircraft is not installed, opening steam browser..")
		timer.Simple(3,function()
			gui.OpenURL('http://steamcommunity.com/sharedfiles/filedetails/?id=104990330')
		end)
	elseif not found and SERVER then
		print("WAC is not installed!")
	end
end)

if not found then return end

wac.aircraft.spawnCategoryU = "WAC Unbreakable"

sound.Add(
{
	name = "Heli_Bell.External",
	channel = CHAN_STATIC,
	soundlevel = 105,
	sound = "WAC/Heli/bellexternal.wav"
})

sound.Add(
{
	name = "Heli_Bell.ExternalLoud",
	channel = CHAN_STATIC,
	soundlevel = 120,
	sound = "WAC/Heli/belldistant.wav"
})

sound.Add(
{
	name = "Heli_Bell.Internal",
	channel = CHAN_STATIC,
	soundlevel = 60,
	sound = "WAC/Heli/bellinternal.wav"
})

sound.Add(
{
	name = "R22.External",
	channel = CHAN_STATIC,
	soundlevel = 105,
	sound = "WAC/Heli/r22_exterior.wav"
})

sound.Add(
{
	name = "R22.Internal",
	channel = CHAN_STATIC,
	soundlevel = 90,
	sound = "WAC/Heli/r22_interior.wav"
})

sound.Add(
{
	name = "H500.External",
	channel = CHAN_STATIC,
	soundlevel = 105,
	sound = "WAC/Heli/heli_loop_ext.wav"
})

sound.Add(
{
	name = "H500.Internal",
	channel = CHAN_STATIC,
	soundlevel = 60,
	sound = "WAC/Heli/heli_loop_int.wav"
})

sound.Add(
{
	name = "CH46.External",
	channel = CHAN_STATIC,
	soundlevel = 115,
	sound = "WAC/Heli/xhe4_2.wav"
})

sound.Add(
{
	name = "CH46.Internal",
	channel = CHAN_STATIC,
	soundlevel = 70,
	sound = "WAC/Heli/he4_2.wav"
})

sound.Add(
{
	name = "MH53.External",
	channel = CHAN_STATIC,
	soundlevel = 125,
	sound = "WAC/Heli/Pavelow_ext.wav"
})

sound.Add(
{
	name = "MH53.Internal",
	channel = CHAN_STATIC,
	soundlevel = 75,
	sound = "WAC/Heli/Pavelow_int.wav"
})

sound.Add(
{
	name = "Venom.External",
	channel = CHAN_STATIC,
	soundlevel = 110,
	sound = "npc/attack_helicopter/aheli_rotor_loop1.wav"
})

sound.Add(
{
	name = "Venom.Internal",
	channel = CHAN_STATIC,
	soundlevel = 95,
	sound = "WAC/Heli/jet_whine.wav"
})

sound.Add(
{
	name = "CH47.External",
	channel = CHAN_BODY,
	soundlevel = 125,
	sound = "WAC/Heli/Chinook_External.wav"
})

sound.Add(
{
	name = "CH47.Internal",
	channel = CHAN_STATIC,
	soundlevel = 75,
	sound = "WAC/Heli/Chinook_Internal.wav"
})

sound.Add(
{
	name = "Apache.External",
	channel = CHAN_STATIC,
	soundlevel = 120,
	sound = "ah64d/ah64d_blades.wav"
})

sound.Add(
{
	name = "MI35.External",
	channel = CHAN_STATIC,
	soundlevel = 120,
	sound = "mi35/mi35_external.wav"
})

sound.Add(
{
	name = "Tiger.External",
	channel = CHAN_STATIC,
	soundlevel = 120,
	sound = "tiger/tiger_blades.wav"
})
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
	sound = "WAC/bell206b/external.wav"
})

sound.Add(
{
	name = "Heli_Bell.Internal",
	channel = CHAN_STATIC,
	soundlevel = 60,
	sound = "WAC/bell206b/internal.wav"
})

sound.Add(
{
	name = "CH46.External",
	channel = CHAN_STATIC,
	soundlevel = 115,
	sound = "WAC/ch46/external.wav"
})

sound.Add(
{
	name = "CH46.Internal",
	channel = CHAN_STATIC,
	soundlevel = 70,
	sound = "WAC/ch46/internal.wav"
})

sound.Add(
{
	name = "CH47.External",
	channel = CHAN_BODY,
	soundlevel = 125,
	sound = "WAC/ch47/external.wav"
})

sound.Add(
{
	name = "CH47.Internal",
	channel = CHAN_STATIC,
	soundlevel = 75,
	sound = "WAC/ch47/internal.wav"
})

sound.Add(
{
	name = "AH64D.External",
	channel = CHAN_STATIC,
	soundlevel = 120,
	sound = "WAC/ah64d/external.wav"
})

sound.Add(
{
	name = "AH64D.Internal",
	channel = CHAN_STATIC,
	soundlevel = 70,
	sound = "WAC/ah64d/internal.wav"
})

sound.Add(
{
	name = "Jenny.Internal",
	channel = CHAN_STATIC,
	soundlevel = 100,
	sound = "WAC/jenny/internal.wav"
})

sound.Add(
{
	name = "Ultralight.Internal",
	channel = CHAN_STATIC,
	soundlevel = 100,
	sound = "WAC/ultralight/internal.wav"
})
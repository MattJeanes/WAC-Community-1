if SERVER then AddCSLuaFile() end

local found=false
local f=file.Find('wac/*.lua', "LUA")
for k,v in pairs(f) do
	if v=="aircraft.lua" then
		include('wac/aircraft.lua')
		found=true
	end
end

timer.Simple(5,function()
	if not found and not WACFrame then
		if CLIENT then
			WACFrame=vgui.Create('DFrame')
			WACFrame:SetTitle("WAC is not installed")
			WACFrame:SetSize(ScrW()*0.95, ScrH()*0.95)
			WACFrame:SetPos((ScrW() - WACFrame:GetWide()) / 2, (ScrH() - WACFrame:GetTall()) / 2)
			WACFrame:MakePopup()
			
			local h=vgui.Create('DHTML')
			h:SetParent(WACFrame)
			h:SetPos(WACFrame:GetWide()*0.005, WACFrame:GetTall()*0.03)
			local x,y = WACFrame:GetSize()
			h:SetSize(x*0.99,y*0.96)
			h:SetAllowLua(true)
			h:OpenURL('http://mattjeanes.com/abyss/wac-warning.html')
		elseif SERVER then
			timer.Create("WAC-NotInstalled", 10, 0, function() print("WAC Aircraft is not installed!") end)
		end
	end
end)

if not found then return end

if wac and wac.aircraft then wac.aircraft.spawnCategoryU = "WAC Unbreakable" end

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
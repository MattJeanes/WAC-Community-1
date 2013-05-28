if not wac then return end
AddCSLuaFile()

ENT.Base 				= "wac_hc_base"
ENT.Type 				= "anim"

ENT.PrintName			= "CH-47 Chinook"
ENT.Author				= "}{ornet/Vest,SentrySappinMySpy,Reality Mod"
ENT.Category			= wac.aircraft.spawnCategory
ENT.TwinBladed			= true
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= true
ENT.AdminSpawnable		= true
ENT.AutomaticFrameAdvance = true // needed for gear anims

ENT.Model			= "models/wac/ch47b.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/wac/chinookbladerr.mdl"
ENT.BackRotorModel	= "models/wac/chinookbladef.mdl"
ENT.TopRotorDir        = 1
ENT.BackRotorDir	= -1
ENT.TopRotorPos	= Vector(288,0,181)
ENT.BackRotorPos	= Vector(-246,0,247)
ENT.EngineForce	= 40
ENT.Weight		= 50000
ENT.AngBrakeMul	= 0.013
ENT.SmokePos		= Vector(-178,0,189)
ENT.FirePos		= Vector(-178,0,189)

if CLIENT then
	ENT.thirdPerson = {
		distance = 700
	}
end

ENT.Wheels={
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(-204,-74,32),
		friction=100,
		mass=400,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(-204,73,32),
		friction=100,
		mass=400,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(104,-71.8,16),
		friction=100,
		mass=400,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(104,72,16),
		friction=100,
		mass=400,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(104,-56,16),
		friction=100,
		mass=400,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(104,56.3,16),
		friction=100,
		mass=400,
	},
}

ENT.Seats = {
	{
		pos=Vector(284, -29, 77),
		exit=Vector(195,0,50),
	},
	{
		pos=Vector(284, 30, 77),
		exit=Vector(195,0,50),
	},
	{
		pos=Vector(110, -45, 65),
		exit=Vector(110,0,50),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(40, -45, 65),
		exit=Vector(40,0,50),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(-50, -45, 65),
		exit=Vector(-50,0,50),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(-50, 45, 65),
		exit=Vector(-50,0,50),
		ang=Angle(0,-90,0),
	},
	{
		pos=Vector(40, 45, 65),
		exit=Vector(40,0,50),
		ang=Angle(0,-90,0),
	},
	{
		pos=Vector(115, 45, 65),
		exit=Vector(115,0,50),
		ang=Angle(0,-90,0),
	},
	{
		pos=Vector(-115, 45, 65),
		exit=Vector(-115,0,50),
		ang=Angle(0,-90,0),
	},
}

ENT.Sounds={
	Start="WAC/ch46/start.wav",
	Blades="WAC/ch47/external.wav",
	Engine="WAC/ch47/internal.wav",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="HelicopterVehicle/MinorAlarm.mp3",
	LowHealth="HelicopterVehicle/LowHealth.mp3",
	CrashAlarm="HelicopterVehicle/CrashAlarm.mp3",
}

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*2)
	ent.Owner=ply
	ent:Spawn()
	ent:Activate()
	return ent
end

function ENT:DrawWeaponSelection() end
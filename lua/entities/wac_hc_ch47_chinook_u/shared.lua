AddCSLuaFile()

ENT.Base 				= "wac_hc_base_u"
ENT.Type 				= "anim"

ENT.PrintName			= "CH-47 Chinook"
ENT.Author				= "}{ornet/Vest,SentrySappinMySpy,Reality Mod"
ENT.Category			= wac.aircraft.categoryU
ENT.TwinBladed			= true
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= true
ENT.AdminSpawnable		= true

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
ENT.ThirdPDist = 700
ENT.WheelInfo={
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

function ENT:AddSeatTable()
    return{
        [1]={
            Pos=Vector(284, -29, 77),
            ExitPos=Vector(195,0,50),
            NoHud=true,
            wep={WAC.Helicopter.GetWeapon("No Weapon")},
        },
        [2]={
            Pos=Vector(284, 30, 77),
            ExitPos=Vector(195,0,50),
            NoHud=true,
            wep={WAC.Helicopter.GetWeapon("No Weapon")},
        },
        [3]={
            Pos=Vector(110, -45, 65),
            ExitPos=Vector(110,0,50),
            Ang=Angle(0,90,0),
            NoHud=true,
            wep={WAC.Helicopter.GetWeapon("No Weapon")},
        },
        [4]={
            Pos=Vector(40, -45, 65),
            ExitPos=Vector(40,0,50),
            Ang=Angle(0,90,0),
            NoHud=true,
            wep={WAC.Helicopter.GetWeapon("No Weapon")},
        },
        [5]={
            Pos=Vector(-50, -45, 65),
            ExitPos=Vector(-50,0,50),
            Ang=Angle(0,90,0),
            NoHud=true,
            wep={WAC.Helicopter.GetWeapon("No Weapon")},
        },
        [6]={
            Pos=Vector(-50, 45, 65),
            ExitPos=Vector(-50,0,50),
            Ang=Angle(0,-90,0),
            NoHud=true,
            wep={WAC.Helicopter.GetWeapon("No Weapon")},
        },
        [7]={
            Pos=Vector(40, 45, 65),
            ExitPos=Vector(40,0,50),
            Ang=Angle(0,-90,0),
            NoHud=true,
            wep={WAC.Helicopter.GetWeapon("No Weapon")},
        },
        [8]={
            Pos=Vector(115, 45, 65),
            ExitPos=Vector(115,0,50),
            Ang=Angle(0,-90,0),
            NoHud=true,
            wep={WAC.Helicopter.GetWeapon("No Weapon")},
        },
	[9]={
            Pos=Vector(-115, 45, 65),
            ExitPos=Vector(-115,0,50),
            Ang=Angle(0,-90,0),
            NoHud=true,
            wep={WAC.Helicopter.GetWeapon("No Weapon")},
        },
    }
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/Heli/merlin_start_idle_stop.wav"),
		Blades=CreateSound(self.Entity,"CH47.External"),
		Engine=CreateSound(self.Entity,"CH47.Internal"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*2)
	ent.Owner=ply
	ent:Spawn()
	ent:Activate()
	self.Sounds=table.Copy(sndt)
	return ent
end

ENT.Base 				= "wac_hc_base_u"
ENT.Type 				= "anim"

ENT.PrintName			= "EH-101 Merlin"
ENT.Author				= "WeltEnSTurm,Sentry,PR"
ENT.Category			= wac.aircraft.categoryU
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= false
ENT.AdminSpawnable	= false

ENT.Model			= "models/bf2/helicopters/merlin.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/bf2/helicopters/merlin_r.mdl"
ENT.BackRotorModel= "models/BF2/helicopters/MH-53J Pave Low IIIE/mh53_tr.mdl"

ENT.BackRotorDir	= 1
ENT.TopRotorPos	= Vector(0,0,0)
ENT.BackRotorPos	= Vector(-510,27,212,5)
ENT.MaxEnterDistance= 200
ENT.EngineForce	= 30
ENT.Weight		= 36000

ENT.SmokePos	= Vector(0,0,200)
ENT.FirePos		= Vector(0,0,200)
ENT.ThirdPDist		= 1000

function ENT:AddSeatTable()
	return{
		[1]={
			Pos=Vector(220, 27, 85),
			ExitPos=Vector(220,200,85),
			NoHud=true,
			wep={WAC.Helicopter.GetWeapon("No Weapon")},
		},
		[2]={
			Pos=Vector(220, -27, 85),
			ExitPos=Vector(220,-200,85),
			NoHud=true,
			wep={WAC.Helicopter.GetWeapon("No Weapon")},
		},
		[3]={
			Pos=Vector(-80, 35, 75),
			ExitPos=Vector(130,120,0),
			Ang=Angle(0,-90,0),
			NoHud=true,
			wep={WAC.Helicopter.GetWeapon("No Weapon")},
		},
		[4]={
			Pos=Vector(-80, -40, 75),
			ExitPos=Vector(0,-140,0),
			Ang=Angle(0,90,0),
			NoHud=true,
			wep={WAC.Helicopter.GetWeapon("No Weapon")},
		},
	}
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/Heli/merlin_start_idle_stop.wav"),
		Blades=CreateSound(self.Entity,"WAC/Heli/Pavelow_ext.wav"),
		Engine=CreateSound(self.Entity,"WAC/Heli/Pavelow_int.wav"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end

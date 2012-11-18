if not wac then return end

ENT.Base 				= "wac_hc_base_u"
ENT.Type 				= "anim"

ENT.PrintName			= "Bell UH-1 Iroquois"
ENT.Author				= "WeltEnSTurm,Sentry,FSX"
ENT.Category			= wac.aircraft.spawnCategoryU
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= false
ENT.AdminSpawnable	= false

ENT.Model			= "models/FSX/Helicopters/UH-1 Iroquois.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/FSX/Helicopters/UH-1 Iroquois_rotor.mdl"
ENT.BackRotorModel= "models/FSX/Helicopters/UH-1 Iroquois_tailrotor.mdl"

ENT.BackRotorDir	= 1
ENT.TopRotorPos	= Vector(-2,0,90)
ENT.BackRotorPos	= Vector(-302.5,0,118.8)
ENT.EngineForce	= 30
ENT.Weight		= 4010

ENT.SmokePos	= Vector(-90,-2,80)
ENT.FirePos		= Vector(-90,-2,80)

function ENT:AddSeatTable()
	return{
		[1]={
			Pos=Vector(85, 23, 37),
			ExitPos=Vector(85,100,10),
			NoHud=true,
			wep={wac.aircraft.getWeapon("No Weapon")},
		},
		[2]={
			Pos=Vector(85, -23, 37),
			ExitPos=Vector(85,-100,10),
			NoHud=true,
			wep={wac.aircraft.getWeapon("No Weapon")},
		},
		[3]={
			Pos=Vector(20, -23, 38),
			ExitPos=Vector(20,-100,10),
			NoHud=true,
			wep={wac.aircraft.getWeapon("No Weapon")},
		},
		[4]={
			Pos=Vector(20, 23, 38),
			ExitPos=Vector(20,100,10),
			NoHud=true,
			wep={wac.aircraft.getWeapon("No Weapon")},
		},
	}
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/Heli/h6_start.wav"),
		Blades=CreateSound(self.Entity,"WAC/Heli/heli_loop_ext.wav"),
		Engine=CreateSound(self.Entity,"WAC/Heli/heli_loop_int.wav"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end

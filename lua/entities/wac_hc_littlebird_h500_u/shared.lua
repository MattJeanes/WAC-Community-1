if not wac then return end

ENT.Base 				= "wac_hc_base_u"
ENT.Type 				= "anim"

ENT.PrintName			= "Hughes 500D"
ENT.Author				= "}{ornet/Vest"
ENT.Category			= wac.aircraft.spawnCategoryU
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= true
ENT.AdminSpawnable	= true

ENT.Model			= "models/military2/air/air_h500.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/military2/air/air_h500_r.mdl"
ENT.BackRotorModel= "models/military2/air/air_h500_sr.mdl"
ENT.BackRotorDir	= 1
ENT.TopRotorPos	= Vector(0,0,48)
ENT.BackRotorPos	= Vector(-185,3.4,13.2)
ENT.RotorWidth		= 180
ENT.EngineForce	= 44
ENT.Weight			= 1361
ENT.SeatSwitcherPos	= Vector(0,0,0)
ENT.SmokePos		= Vector(-70,0,-12)
ENT.FirePos		= Vector(0,0,46)

function ENT:AddSeatTable()
	return{
		[1]={
			Pos=Vector(28, 14.5, -14),
			ExitPos=Vector(28,70,-56),
			NoHud=true,
			wep={wac.aircraft.getWeapon("No Weapon")},
		},
		[2]={
			Pos=Vector(28, -14.5, -14),
			ExitPos=Vector(28,-70,-56),
			NoHud=true,
			wep={wac.aircraft.getWeapon("No Weapon")},
		},
		[3]={
			Pos=Vector(-8, -11, -17),
			ExitPos=Vector(-10,-70,-56),
			NoHud=true,
			wep={wac.aircraft.getWeapon("No Weapon")},
		},
		[4]={
			Pos=Vector(-8, 11, -17),
			ExitPos=Vector(-10,70,-56),
			NoHud=true,
			wep={wac.aircraft.getWeapon("No Weapon")},
		},
	}
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/Heli/h6_start.wav"),
		Blades=CreateSound(self.Entity,"H500.External"),
		Engine=CreateSound(self.Entity,"H500.Internal"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end

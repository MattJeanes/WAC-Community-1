ENT.Base 				= "wac_hc_base_u"
ENT.Type 				= "anim"

ENT.PrintName			= "UH-1D Huey"
ENT.Author				= "SentryGunMan"
ENT.Category			= wac.aircraft.spawnCategoryU
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= true
ENT.AdminSpawnable	= true

ENT.Model			= "models/sentry/uh-1d.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/sentry/uh-1d_tr.mdl"
ENT.BackRotorModel	= "models/sentry/uh-1d_rr.mdl"

ENT.BackRotorDir	= -1
ENT.TopRotorPos	= Vector(2,0,142)
ENT.BackRotorPos	= Vector(-335,6,156)
ENT.EngineForce	= 30
ENT.Weight		= 9200

ENT.SmokePos	= Vector(-85,0,102)
ENT.FirePos		= Vector(-85,0,102)

function ENT:AddSeatTable()
	return{
		[1]={
			Pos=Vector(95,-24.5,47),
			ExitPos=Vector(100,-120,10),
			Ang=Angle(0,0,0),
			NoHud=true,
			wep={WAC.Helicopter.GetWeapon("No Weapon")},
		},
		[2]={
			Pos=Vector(95, 24.5, 47),
			ExitPos=Vector(100,120,10),
			Ang=Angle(0,0,0),
			NoHud=true,
			wep={WAC.Helicopter.GetWeapon("No Weapon")},
		},
		[3]={
			Pos=Vector(18,-24.5,47),
			ExitPos=Vector(20,-120,10),
			NoHud=true,
			wep={WAC.Helicopter.GetWeapon("No Weapon")},
		},
		[4]={
			Pos=Vector(18,0,47),
			ExitPos=Vector(40,-120,10),
			NoHud=true,
			wep={WAC.Helicopter.GetWeapon("No Weapon")},
		},
		[5]={
			Pos=Vector(18, 24.5, 47),
			ExitPos=Vector(20,120,10),
			NoHud=true,
			wep={WAC.Helicopter.GetWeapon("No Weapon")},
		},

	}
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity, "uh1d/uh1d_start_idle_stop.wav"),
		Blades=CreateSound(self.Entity, "UH1D.External"),
		Engine=CreateSound(self.Entity, "UH1D.Internal"),
		MissileAlert=CreateSound(self.Entity, "HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity, "ah64d/rocket_fire.wav"),
		MinorAlarm=CreateSound(self.Entity, "uh1d/fire_alarm_tank.wav"),
		LowHealth=CreateSound(self.Entity, "uh1d/fire_alarm.wav"),
		CrashAlarm=CreateSound(self.Entity, "uh1d/FireSmoke.wav"),
	}
end

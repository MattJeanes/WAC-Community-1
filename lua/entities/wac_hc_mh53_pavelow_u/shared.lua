if not wac then return end

ENT.Base 				= "wac_hc_base_u"
ENT.Type 				= "anim"

ENT.PrintName			= "MH-53 Sea Stallion"
ENT.Author				= "WeltEnSTurm"
ENT.Category			= wac.aircraft.spawnCategoryU
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""

ENT.Model			= "models/bf2/helicopters/MH-53J Pave Low IIIE/mh53_b.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/bf2/helicopters/MH-53J Pave Low IIIE/mh53_r.mdl"
ENT.BackRotorModel= "models/bf2/helicopters/mh-53j pave low iiie/mh53_tr.mdl"

ENT.Spawnable			= true
ENT.AdminSpawnable	= true

ENT.SmokePos		= Vector(10,0,175)
ENT.FirePos		= Vector(10,0,180)

function ENT:AddSeatTable()
	return {
		[1]={
			Pos=Vector(256,-30,70),
			ExitPos=Vector(250,-100,20),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},
		[2]={
			Pos=Vector(256,32,70),
			ExitPos=Vector(250,100,20),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},
		[3]={
			Pos=Vector(81.58,-38,30),
			Ang=Angle(0,90,0),
			ExitPos=Vector(81.58,0,30),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},
		[4]={
			Pos=Vector(81.58,38,30),
			Ang=Angle(0,-90,0),
			ExitPos=Vector(81.58,0,30),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},
		[5]={
			Pos=Vector(43.72,38,30),
			Ang=Angle(0,-90,0),
			ExitPos=Vector(43.72,0,30),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},
		[6]={
			Pos=Vector(-60.01,-38,30),
			Ang=Angle(0,90,0),
			ExitPos=Vector(-60.01,0,30),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},
		[7]={
			Pos=Vector(-160.01,-38,30),
			Ang=Angle(0,90,0),
			ExitPos=Vector(-60.01,0,30),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},
		[8]={
			Pos=Vector(-160.01,38,30),
			Ang=Angle(0,-90,0),
			ExitPos=Vector(-160.01,0,30),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},
		[9]={
			Pos=Vector(-350,0,20),
			Ang=Angle(0,180,0),
			ExitPos=Vector(-340,0,20),
			NoHud=true,
			wep={
				wac.aircraft.getWeapon("No Weapon"),
			},
		},
	}
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/Heli/merlin_start_idle_stop.wav"),
		Blades=CreateSound(self.Entity,"MH53.External"),
		Engine=CreateSound(self.Entity,"MH53.Internal"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end

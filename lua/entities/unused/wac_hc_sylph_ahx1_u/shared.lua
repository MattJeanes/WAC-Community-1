
ENT.Base 				= "wac_hc_base_u"
ENT.Type 				= "anim"
ENT.PrintName			= "Sylph AHX-1"
ENT.Author				= "WeltEnSTurm"
ENT.Category			= wac.aircraft.categoryU
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= true
ENT.AdminSpawnable	= true

ENT.Model			= "models/WeltEnSTurm/WAC/Helicopter/ahx1.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/WeltEnSTurm/WAC/Helicopter/ahx1_r.mdl"
ENT.BackRotorModel= "models/WeltEnSTurm/WAC/Helicopter/ahx1_br.mdl"
ENT.RotorBlurModel	= "models/WeltEnSTurm/WAC/Helicopter/ahx1_blurr.mdl"

ENT.EngineForce	= 30
ENT.Weight			= 7000
ENT.TopRotorDir	= -1
ENT.TopRotorPos	= Vector(0,0,105)
ENT.BackRotorDir	= -1
ENT.BackRotorPos	= Vector(-298,10.27,88)
ENT.SmokePos		= Vector(-80,0,50)
ENT.FirePos		= Vector(-50,0,100)
ENT.ThirdPDist		= 500

function ENT:AddSeatTable()
	return{
		[1]={
			Pos=Vector(68, 0, 45),
			ExitPos=Vector(70,60,10),
			wep={
				[1]=WAC.Helicopter.GetWeapon("Hydra 70"),
			},
		},
		[2]={
			Pos=Vector(105, 0, 35),
			ExitPos=Vector(70,-60,10),
			wep={
				[1]=WAC.Helicopter.GetWeapon("No Weapon"),
				[2]=WAC.Helicopter.GetWeapon("25MM HE"),
				[3]=WAC.Helicopter.GetWeapon("Hellfire"),
			},
		},
	}
end

function ENT:AddSounds()
	self.Sound={
		Blades=CreateSound(self.Entity,"WAC/Heli/AH1_start_idle.wav"),--"npc/attack_helicopter/aheli_rotor_loop1.wav"),
		Engine=CreateSound(self.Entity,"WAC/Heli/jet_whine.wav"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end

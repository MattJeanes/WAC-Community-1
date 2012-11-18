if not wac then return end

ENT.Base 				= "wac_hc_base"
ENT.Type 				= "anim"
ENT.PrintName			= "Boeing AH-64D Longbow"
ENT.Author				= "WeltEnSTurm,Sentry,Apache Air Assault"
ENT.Category			= wac.aircraft.spawnCategory
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= false
ENT.AdminSpawnable	= false

ENT.Model			= "models/Apache/Apache.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/Apache/rotormain.mdl"
ENT.BackRotorModel= "models/BF2/helicopters/AH-1 Cobra/ah1z_tr.mdl"
ENT.EngineForce	= 30
ENT.Weight			= 7000
ENT.TopRotorDir	= -1
ENT.TopRotorPos	= Vector(24,0,60)
ENT.BackRotorDir	= -1
ENT.BackRotorPos	= Vector(-345,10,87)
ENT.SmokePos		= Vector(0,0,0)
ENT.FirePos		= Vector(-80,-30,40)

function ENT:AddSeatTable()
	return{
		[1]={
			Pos=Vector(85, 0, 15),
			ExitPos=Vector(85,-120,10),
			wep={
				[1]=wac.aircraft.getWeapon("Hydra 70",{
					ShootPos={
						[1]=Vector(40.25,95.33,0),
						[2]=Vector(40.25,-95.33,0),
					}
				}),
			},
		},
		[2]={
			Pos=Vector(140, 0, 0),
			ExitPos=Vector(140,-120,10),
			wep={
				[1]=wac.aircraft.getWeapon("No Weapon"),
				[2]=wac.aircraft.getWeapon("25MM HE"),
				[3]=wac.aircraft.getWeapon("Hellfire"),
			},
		},
	}
end

function ENT:AddSounds()
	self.Sound={
		Blades=CreateSound(self.Entity,"WAC/Heli/AH1_start_idle.wav"),--"WAC/Heli/ah64d_longbow_idle.wav"),
		Engine=CreateSound(self.Entity,"apache/ah64d_longbow_idle.wav"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end

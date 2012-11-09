
ENT.Base 			= "wac_hc_base_u"
ENT.Type 			= "anim"

ENT.PrintName		= "Boeing AH-64D Longbow"
ENT.Author			= "WeltEnSTurm"
ENT.Category		= wac.aircraft.spawnCategoryU
ENT.Contact    		= ""
ENT.Purpose 		= ""
ENT.Instructions 	= ""
ENT.Model			= "Models/sentry/apache.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "Models/sentry/apachemain.mdl"
ENT.BackRotorModel	= "Models/sentry/apacherear.mdl"

ENT.Spawnable		= true
ENT.AdminSpawnable	= true

ENT.TopRotorPos		= Vector(37,0,80)
ENT.TopRotorDir		= -1
ENT.BackRotorPos	= Vector(-332.5,-17,93.5)
ENT.BackRotorDir	= -1
ENT.SmokePos		= Vector(37,0,75)
ENT.FirePos			= Vector(37,0,75)

function ENT:AddSeatTable()
	return{
		[1]={
			Pos=Vector(93, 0, 10),
			ExitPos=Vector(93,120,10),
			wep={
				[1]=wac.aircraft.getWeapon("Hydra 70",{
					Ammo=40,
					MaxAmmo=40,
					ShootDelay=0.2,
					ShootPos={
						[1]=Vector(90.25,65.33,-15),
						[2]=Vector(90.25,-65.33,-15),
					}
				}),
			},
		},
		[2]={
			Pos=Vector(142.5, 0, 0),
			ExitPos=Vector(142.5,120,10),
			wep={
				[1]=wac.aircraft.getWeapon("No Weapon"),
				[2]=wac.aircraft.getWeapon("2A42",{
		Name="M230",
		Ammo=1200,
		MaxAmmo=1200,
		NextShoot=1,
		LastShot=0,
		ShootDelay=0.14,
		MouseControl=true,
		ShootPos=Vector(180,0,20),	
				}),
			},
		},
	}
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"ah64d/ah64d_start_idle_stop.wav"),
		Blades=CreateSound(self.Entity,"Apache.External"),
		Engine=CreateSound(self.Entity,"ah64d/ah64d_cockpit.wav"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"ah64d/rocket_fire.wav"),
		MinorAlarm=CreateSound(self.Entity,"ah64d/fire_alarm_tank.wav"),
		LowHealth=CreateSound(self.Entity,"ah64d/fire_alarm.wav"),
		CrashAlarm=CreateSound(self.Entity,"ah64d/FireSmoke.wav"),
	}
end

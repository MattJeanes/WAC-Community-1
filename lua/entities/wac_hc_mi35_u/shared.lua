if not wac then return end

ENT.Base 			= "wac_hc_base_u"
ENT.Type 			= "anim"

ENT.PrintName		= "Mil Mi-35"
ENT.Author			= "SentryGunMan,Nirrti"
ENT.Category		= wac.aircraft.spawnCategoryU
ENT.Contact    		= ""
ENT.Purpose 		= ""
ENT.Instructions 	= ""
ENT.Model			= "models/sentry/mi-35.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/sentry/mi-35_tr.mdl"
ENT.BackRotorModel	= "models/sentry/mi-35_rr.mdl"

ENT.Spawnable		= true
ENT.AdminSpawnable	= true

ENT.TopRotorPos		= Vector(-7.5,0,160)
ENT.TopRotorDir		= -1
ENT.BackRotorPos	= Vector(-415.5,25,174.5)
ENT.BackRotorDir	= -1
ENT.SmokePos		= Vector(-7.5,0,155)
ENT.FirePos			= Vector(-7.5,0,155)

function ENT:AddSeatTable()
		return{
		[1]={
			Pos=Vector(125,0,68),
			ExitPos=Vector(125,70,0),
			wep={
				wac.aircraft.getWeapon("Hydra 70",{
					Name="S-5",
					Ammo=64,
					MaxAmmo=64,
					Damage=70,
					ShootDelay=0.2,
					ShootPos={
						Vector(3.22,95,60),
						Vector(3.22,-95,60),
					}
				})
			},
		},
		[2]={
			Pos=Vector(180, 0, 40),
			ExitPos=Vector(180,70,0),
			wep={
				
				[1]=wac.aircraft.getWeapon("No Weapon"),
				[2]=wac.aircraft.getWeapon("M197",{Name="Yak-B",Ammo=1470,MaxAmmo=1470}),
				[3]=wac.aircraft.getWeapon("Hellfire",{
				Name="9M17 Phalanga",
				Ammo=4,
				MaxAmmo=4,
				ShootPos={
						Vector(-15,152.5,55),
						Vector(-15,-152.5,55)},
							}),

			},
		},
	}

end
			

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"mi35/havoc_start_idle_stop.wav"),
		Blades=CreateSound(self.Entity,"MI35.External"),
		Engine=CreateSound(self.Entity,"mi35/havoc_cockpit.wav"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"mi35/fire_alarm_tank.wav"),
		LowHealth=CreateSound(self.Entity,"mi35/fire_alarm.wav"),
		CrashAlarm=CreateSound(self.Entity,"mi35/FireSmoke.wav"),
	}
end


ENT.Base 			= "wac_hc_base_u"
ENT.Type 			= "anim"

ENT.PrintName		= "UH-1Y Venom"
ENT.Author			= "}{ornet/Vest"
ENT.Category			= wac.aircraft.spawnCategoryU
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""

ENT.Model			= "models/Flyboi/uh1yvenom/uh1yvenom_fb.mdl"
ENT.RotorPhModel		= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/Flyboi/uh1yvenom/venomrotorm_fb.mdl"
ENT.BackRotorModel	= "models/Flyboi/uh1yvenom/venomrotort_fb.mdl"

ENT.Spawnable		= true
ENT.AdminSpawnable	= true
ENT.SmokePos		= Vector(-65,0,80)
ENT.FirePos			= Vector(-25,0,130)

function ENT:AddSeatTable()
    return{
        [1]={
            Pos=Vector(95, -20, 48),
            ExitPos=Vector(90,-80,10),
            wep={
                [1]=WAC.Helicopter.GetWeapon("Hydra 70",{
                    ShootPos={
                        [1]=Vector(40.25,60,32.93),
                        [2]=Vector(40.25,-60,32.93),
                    }
                }),
            },
        },
        [2]={
            Pos=Vector(95, 20, 48),
            ExitPos=Vector(90,80,10),
            NoHud=true,
            wep={WAC.Helicopter.GetWeapon("No Weapon")},
        },
        [3]={
            Pos=Vector(-5, -45, 40),
            Ang=Angle(0,-90,0),
            ExitPos=Vector(-5,-80,10),
            NoHud=true,
            wep={WAC.Helicopter.GetWeapon("No Weapon")},
        },
        [4]={
            Pos=Vector(-5, 45, 40),
            Ang=Angle(0,90,0),
            ExitPos=Vector(-5,80,10),
            NoHud=true,
            wep={WAC.Helicopter.GetWeapon("No Weapon")},
        },
        [5]={
            Pos=Vector(58, 24.5, 46),
            Ang=Angle(0,180,0),
            ExitPos=Vector(0,80,10),
            NoHud=true,
            wep={WAC.Helicopter.GetWeapon("No Weapon")},
        },
        [6]={
            Pos=Vector(58, -24.5, 46),
            Ang=Angle(0,180,0),
            ExitPos=Vector(0,-80,10),
            NoHud=true,
            wep={WAC.Helicopter.GetWeapon("No Weapon")},
        },
    }
end

function ENT:AddSounds()
	self.Sound={
			Start=CreateSound(self.Entity,"WAC/Heli/ah1_start.wav"),
	Blades=CreateSound(self.Entity,"Venom.External"),
	Engine=CreateSound(self.Entity,"Venom.Internal"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end

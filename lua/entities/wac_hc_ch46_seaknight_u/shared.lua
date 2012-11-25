if not wac then return end
AddCSLuaFile()

ENT.Base 				= "wac_hc_base_u"
ENT.Type 				= "anim"

ENT.PrintName			= "CH-46 Sea Knight"
ENT.Author				= "}{ornet/Vest"
ENT.Category			= wac.aircraft.spawnCategoryU
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= true
ENT.AdminSpawnable	= true

ENT.Model			= "models/flyboi/ch46/ch46_fb.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/flyboi/ch46/ch46rotorm_fb.mdl"
ENT.BackRotorModel	= "models/flyboi/ch46/ch46rotorm_fb.mdl"
ENT.TopRotorDir        = 1
ENT.BackRotorDir	= -1
ENT.TopRotorPos	= Vector(149.6,0,170)
ENT.BackRotorPos	= Vector(-263,0,203)
ENT.EngineForce	= 36
ENT.Weight		= 11000
ENT.SmokePos		= Vector(-230,0,115)
ENT.FirePos		= Vector(-263,0,203)
if CLIENT then
	ENT.thirdPerson = {
		distance = 680
	}
end
ENT.TwinBladed = true

function ENT:AddSeatTable()
    return{
        [1]={
            Pos=Vector(165, -22, 68),
            ExitPos=Vector(160,-70,40),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [2]={
            Pos=Vector(165, 22, 68),
            ExitPos=Vector(160,70,40),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [3]={
            Pos=Vector(25, 28, 49),
            ExitPos=Vector(-320,0,10),
            Ang=Angle(0,-90,0),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [4]={
            Pos=Vector(-20, -28, 49),
            ExitPos=Vector(-320,0,10),
            Ang=Angle(0,90,0),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [5]={
            Pos=Vector(-60, -28, 49.5),
            ExitPos=Vector(-320,0,10),
            Ang=Angle(0,90,0),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [6]={
            Pos=Vector(-70, 28, 49.5),
            ExitPos=Vector(-320,0,10),
            Ang=Angle(0,-90,0),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [7]={
            Pos=Vector(-100, -28, 50),
            ExitPos=Vector(-320,0,10),
            Ang=Angle(0,90,0),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [8]={
            Pos=Vector(-100, 28, 50),
            ExitPos=Vector(-320,0,10),
            Ang=Angle(0,-90,0),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
    }
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/ch46/start.wav"),
		Blades=CreateSound(self.Entity,"CH46.External"),
		Engine=CreateSound(self.Entity,"CH46.Internal"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*2)
	ent.Owner=ply
	ent:Spawn()
	ent:Activate()
	self.Sounds=table.Copy(sndt)
	return ent
end

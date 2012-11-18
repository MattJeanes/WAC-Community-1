if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 				= "wac_hc_base_u"
ENT.Type 				= "anim"

ENT.PrintName			= "Bell 206B"
ENT.Author				= "Dr. Matt"
ENT.Category			= wac.aircraft.spawnCategoryU
ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model            = "models/206b/bell.mdl"
ENT.RotorPhModel        = "models/props_junk/sawblade001a.mdl"
ENT.RotorModel        = "models/206b/206mp2.mdl"
ENT.BackRotorModel    = "models/206b/206sp2.mdl"
ENT.BackRotorDir        = -1
ENT.TopRotorPos        = Vector(-37,2,121)
ENT.BackRotorPos        = Vector(-290.5,8,81.5)
ENT.RotorWidth		= 190
ENT.EngineForce        = 34
ENT.Weight            = 1451
ENT.SeatSwitcherPos	= Vector(0,0,0)
ENT.AngBrakeMul	= 0.012
ENT.SmokePos        = Vector(-84,0,110)
ENT.FirePos            = Vector(-86,0,110)

if CLIENT then
	ENT.thirdPerson = {
		distance = 400
	}
end

function ENT:AddSeatTable()
    return{
        [1]={
            Pos=Vector(12, -12, 42),
            ExitPos=Vector(30,-80,10),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [2]={
            Pos=Vector(12, 16, 42),
            ExitPos=Vector(30,80,10),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [3]={
            Pos=Vector(-30, 15, 38),
            ExitPos=Vector(-25,80,10),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [4]={
            Pos=Vector(-30, 2, 38),
            ExitPos=Vector(-25,80,10),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
	[5]={
            Pos=Vector(-30, -10, 38),
            ExitPos=Vector(-25,-80,10),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },

    }
end
function ENT:AddSounds()
    self.Sound={
        Start=CreateSound(self.Entity,"WAC/Heli/h6_start.wav"),
        Blades=CreateSound(self.Entity,"Heli_Bell.External"),
        Engine=CreateSound(self.Entity,"Heli_Bell.Internal"),
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
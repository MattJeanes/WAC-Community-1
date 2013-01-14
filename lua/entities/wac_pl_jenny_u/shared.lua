if not wac then return end

ENT.Base 				= "wac_pl_base_u"
ENT.Type 				= "anim"

ENT.PrintName			= "Curtiss JN-4 Jenny"
ENT.Author				= "}{ornet/Vest"
ENT.Category			= wac.aircraft.spawnCategoryU
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= true
ENT.AdminSpawnable	= true

ENT.Model			= "models/curtiss/jenny_jn4.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/curtiss/jenny_prop.mdl"
ENT.TopRotorDir        = 1
ENT.TopRotorPos	= Vector(62, 0, 0)
ENT.BackRotorPos	= Vector(8, 0, -48)
ENT.EngineForce	= 80
ENT.Weight		= 761
ENT.SmokePos		= Vector(47, 0, 0)
ENT.FirePos		= Vector(47, 0, 0)
ENT.EngineWeight = {
	Weight = 117,
	Position = ENT.TopRotorPos
}

ENT.WheelInfo={
    {
        mdl="models/curtiss/jenny_wheels.mdl",
        pos=Vector(8,0,-48),
        friction=1,
        mass=150,
    },
    {	mdl="models/props_junk/PopCan01a.mdl",
        pos=Vector(-100,0,0),
        friction=1,
        mass=1,
    },
    {	mdl="models/props_junk/PopCan01a.mdl",
        pos=Vector(-100,0,0),
        friction=1,
        mass=1,
    },
}


function ENT:AddSeatTable()
    return{
        [1]={
	    Pos=Vector(-60, 0, -10),
            ExitPos=Vector(-78,42,-48),
	    NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [2]={
            Pos=Vector(-15, 0, -10),
            ExitPos=Vector(-78,-42,-48),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
    }
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/jenny/start.wav"),
		Blades=CreateSound(self.Entity,""),
		Engine=CreateSound(self.Entity,"Jenny.Internal"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end

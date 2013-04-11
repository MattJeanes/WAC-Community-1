if not wac then return end

ENT.Base 				= "wac_pl_base"
ENT.Type 				= "anim"

ENT.PrintName			= "Aircreation 582SL"
ENT.Author				= "}{ornet/Vest,Nikke"
ENT.Category			= wac.aircraft.spawnCategory
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= true
ENT.AdminSpawnable	= true

ENT.Model			= "models/ultralight/ultralight.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/ultralight/ultralight_propeller2.mdl"
ENT.TopRotorDir		= 1
ENT.TopRotorPos		= Vector(-51,-0.25,50)
//ENT.BackRotorPos	= Vector(18, 0, 24)
ENT.EngineForce	= 400
ENT.Weight		= 445
ENT.SmokePos	= Vector(-47,-0.25,50)
ENT.FirePos		= Vector(-47,-0.25,50)


ENT.WheelInfo={
    {
        mdl="models/BF2/helicopters/Mil Mi-28/mi28_w2.mdl",
        pos=Vector(-27.5,37.5,8),
        friction=0,
        mass=130,
    },
    {
        mdl="models/BF2/helicopters/Mil Mi-28/mi28_w2.mdl",
        pos=Vector(-27.5,-37.5,8),
        friction=0,
        mass=130,
    },
    {
        mdl="models/BF2/helicopters/Mil Mi-28/mi28_w2.mdl",
        pos=Vector(49,0,10),
        friction=0,
        mass=170,
    },
}

function ENT:AddSeatTable()
    return{
        [1]={
	    Pos=Vector(18, 0, 24),
            ExitPos=Vector(18,70,5),
	    NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [2]={
            Pos=Vector(-3, 0, 33),
            ExitPos=Vector(-3,-70,5),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
    }
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/ultralight/start.wav"),
		Blades=CreateSound(self.Entity,""),
		Engine=CreateSound(self.Entity,"Ultralight.Internal"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end

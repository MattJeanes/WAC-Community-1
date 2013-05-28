if not wac then return end
AddCSLuaFile()

ENT.Base 				= "wac_hc_base"
ENT.Type 				= "anim"

ENT.PrintName			= "CH-46 Sea Knight"
ENT.Author				= "}{ornet/Vest"
ENT.Category			= wac.aircraft.spawnCategory
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= true
ENT.AdminSpawnable	= true
ENT.AutomaticFrameAdvance = true // needed for ramp anims

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

ENT.Seats = {
	{
		pos=Vector(165, -22, 68),
		exit=Vector(160,-70,40),
	},
	{
		pos=Vector(165, 22, 68),
		exit=Vector(160,70,40),
	},
	{
		pos=Vector(25, 28, 49),
		exit=Vector(-320,0,10),
		ang=Angle(0,-90,0),
	},
	{
		pos=Vector(-20, -28, 49),
		exit=Vector(-320,0,10),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(-60, -28, 49.5),
		exit=Vector(-320,0,10),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(-70, 28, 49.5),
		exit=Vector(-320,0,10),
		ang=Angle(0,-90,0),
	},
	{
		pos=Vector(-100, -28, 50),
		exit=Vector(-320,0,10),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(-100, 28, 50),
		exit=Vector(-320,0,10),
		ang=Angle(0,-90,0),
	},
}

ENT.Sounds={
	Start="WAC/ch46/start.wav",
	Blades="WAC/ch46/external.wav",
	Engine="WAC/ch46/internal.wav",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="HelicopterVehicle/MinorAlarm.mp3",
	LowHealth="HelicopterVehicle/LowHealth.mp3",
	CrashAlarm="HelicopterVehicle/CrashAlarm.mp3",
}

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*2)
	ent.Owner=ply
	ent:Spawn()
	ent:Activate()
	return ent
end

if SERVER then
	function ENT:PhysicsUpdate(ph)
		self:base("wac_hc_base").PhysicsUpdate(self,ph)
		
		local idleo=self:LookupSequence("idle_o")
		local idlec=self:LookupSequence("idle")
		local phys=self:GetPhysicsObject()
		
		if IsValid(phys) and not self.disabled then
			if self.rotorRpm>0.8 and phys:GetVelocity():Length() > 750 and self:GetSequence() != idlec then
				self:ResetSequence(idlec)
				self:SetPlaybackRate(1.0)
			elseif phys:GetVelocity():Length() < 750 and self:GetSequence() != idleo then
				self:ResetSequence(idleo)
				self:SetPlaybackRate(1.0)
			end
		end
	end
end

function ENT:DrawWeaponSelection() end
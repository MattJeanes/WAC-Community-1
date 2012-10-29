
include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

ENT.IgnoreDamage = true
ENT.UsePhysRotor	= true
ENT.Submersible	= false
ENT.CrRotorWash	= true
ENT.RotorWidth	= 200
ENT.BackRotorDir	= -1
ENT.TopRotorPos	= Vector(-6.2,-1.5,138)
ENT.BackRotorPos	= Vector(-357.5,5.5,134)
ENT.EngineForce	= 38
ENT.BrakeMul		= 1
ENT.AngBrakeMul	= 0.01
ENT.Weight		= 8000


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

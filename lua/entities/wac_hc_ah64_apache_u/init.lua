
include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

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

function ENT:AddStuff()
	local e1=ents.Create("prop_physics")
	e1:SetModel("models/WeltEnSTurm/WAC/Helicopter/ahx1_gunm.mdl")
	e1:SetPos(self:LocalToWorld(Vector(120,-5,-40)))
	e1:Spawn()
	e1:Activate()
	local ph=e1:GetPhysicsObject()
	if ph:IsValid() then
		ph:EnableDrag(false)
		ph:EnableGravity(false)
	end
	constraint.Axis(e1,self,0,0,Vector(0,0,0),self:WorldToLocal(e1:LocalToWorld(Vector(0,0,1))),0,0,0,1)
	constraint.NoCollide(e1,self,0,0)
	self:AddOnRemove(e1)
	self.GunMount=e1
	self:SetNWEntity("wac_air_radar",e1)
	local e2=ents.Create("prop_physics")
	e2:SetModel("models/WeltEnSTurm/WAC/Helicopter/ahx1_gun.mdl")
	e2:SetPos(self:LocalToWorld(Vector(120,0,-40)))
	e2:Spawn()
	e2:Activate()
	local ph=e2:GetPhysicsObject()
	if ph:IsValid() then
		ph:EnableDrag(false)
		ph:EnableGravity(false)
	end
	constraint.Axis(e2,e1,0,0,Vector(0,0,0),e2:WorldToLocal(e1:LocalToWorld(Vector(1,0,0))),0,0,0,1)
	constraint.NoCollide(e2,self,0,0)
	self:AddOnRemove(e2)
	self.Gun=e2
	self:SetNWEntity("gun",e2)
end

function ENT:CustomPhysicsUpdate(ph)
	if IsValid(self.GunMount) and IsValid(self.Gun) then
		local ph1=self.GunMount:GetPhysicsObject()
		local ph2=self.Gun:GetPhysicsObject()
		ph1:AddAngleVelocity(ph:GetAngleVelocity()-ph1:GetAngleVelocity())
		ph2:AddAngleVelocity(ph:GetAngleVelocity()-ph2:GetAngleVelocity())
		local v=self.MouseVector or Vector(0,0,0)
		ph1:AddAngleVelocity(Vector(0,0,v.y*300))
		ph2:AddAngleVelocity(Vector(0,v.z*-200,0))
	end
end

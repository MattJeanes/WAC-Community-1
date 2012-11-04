
include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
ENT.WheelStabilize	=-150

ENT.WheelInfo={
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mil mi-28_wheel.mdl",
		pos=Vector(-46,65,10),
		friction=100,
		mass=350,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mil mi-28_wheel.mdl",
		pos=Vector(-46,-65,10),
		friction=100,
		mass=350
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(124,10,5),
		friction=100,
		mass=150
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(124,-10,5),
		friction=100,
		mass=150
	},
}

ENT.EngineForce			= 40
ENT.Weight				= 12000
ENT.MaxEnterDistance	= 100
ENT.RotorWidth	= 400


function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*10)
	ent.Owner=ply
	ent:Spawn()
	ent:Activate()
	ent:SetSkin(math.random(0,1))
	self.Sounds=table.Copy(sndt)
	return ent
end

function ENT:AddStuff()
	local ang=self:GetAngles()
	local e1=ents.Create("prop_physics")

	e1:SetModel("models/sentry/mi-35_gun1.mdl")
	e1:SetPos(self:LocalToWorld(Vector(219,0,34)))
	e1:SetAngles(ang)
	e1:SetSkin(Skin)
	e1:Spawn()
	e1:Activate()
	local ph=e1:GetPhysicsObject()
	if ph:IsValid() then
		ph:EnableDrag(false)
		ph:EnableGravity(false)
		ph:SetMass(300)
	end
	constraint.AdvBallsocket(e1,self,0,0,Vector(0,0,0),self:WorldToLocal(e1:LocalToWorld(Vector(0,0,1))),0,0,0,0,ang.y-70,0,0,ang.y+70,0,0,0,0,1)
	e1:SetNotSolid(true)
	self:AddOnRemove(e1)
	self.GunMount1=e1
	e1.wac_ignore=true
	
	local e2=ents.Create("prop_physics")
	e2:SetModel("models/sentry/mi-35_gun2.mdl")
	e2:SetPos(self:LocalToWorld(Vector(219,0,34)))
	e2:SetAngles(ang)
	e2:SetSkin(Skin)
	e2:Spawn()
	e2:Activate()
	local ph=e2:GetPhysicsObject()
	if ph:IsValid() then
		ph:EnableDrag(false)
		ph:EnableGravity(false)
		ph:SetMass(150)
	end
	constraint.AdvBallsocket(e2,e1,0,0,Vector(2,0,0),e1:WorldToLocal(e2:LocalToWorld(Vector(2,0,1))),0,0,0,ang.p-70,0,0,ang.p-5,0,0,0,0,0,1)
	e2:SetNotSolid(true)
	self:AddOnRemove(e2)
	self.GunMount2=e2
	e2.wac_ignore=true
	
	local e3=ents.Create("prop_physics")
	e3:SetModel("models/sentry/mi-35_barrel.mdl")
	e3:SetPos(e2:LocalToWorld(Vector(20,0,0)))
	e3:SetAngles(ang)
	e3:SetSkin(Skin)
	e3:Spawn()
	e3:Activate()
	local ph=e3:GetPhysicsObject()
	if ph:IsValid() then
		ph:EnableDrag(false)
		ph:EnableGravity(false)
		ph:SetMass(15)
	end
	constraint.Axis(e3,e2,0,0,Vector(0,0,0),e2:WorldToLocal(e2:GetForward()+e2:GetPos()),0,0,0,1)
	e3:SetNotSolid(true)
	self.Gun=e3
	self:AddOnRemove(e3)
	self:SetNWEntity("gun",e3)
	e3.wac_ignore=true
	
	local e4=ents.Create("prop_physics")
	e4:SetModel("models/sentry/apachecam.mdl")
	e4:SetPos(self:LocalToWorld(Vector(190,18,10)))
	e4:SetAngles(ang)
	e4:SetColor(Color(0,0,0,0))
	e4:SetRenderMode(RENDERMODE_NONE)
	e4:SetSkin(Skin)
	e4:Spawn()
	e4:Activate()
	local ph=e4:GetPhysicsObject()
	if ph:IsValid() then
		ph:EnableDrag(false)
		ph:EnableGravity(false)
		ph:SetMass(100)
	end
	constraint.AdvBallsocket(e4,self,0,0,Vector(0,0,0),self:WorldToLocal(e4:LocalToWorld(Vector(0,0,1))),0,0,0,0,ang.y-70,0,0,ang.y+70,0,0,0,0,1)
	e4:SetNotSolid(true)
	self.Radar1=e4
	self:AddOnRemove(e4)
	e4.wac_ignore=true
	
	local e5=ents.Create("prop_physics")
	e5:SetModel("models/BF2/helicopters/AH-1 Cobra/ah1z_radar1.mdl")
	e5:SetPos(self:LocalToWorld(Vector(190,18,10)))
	e5:SetAngles(ang)
	e5:SetSkin(Skin)
	e5:Spawn()
	e5:SetColor(Color(0,0,0,0))
	e5:SetRenderMode(RENDERMODE_NONE)
	e5:Activate()
	local ph=e5:GetPhysicsObject()
	if ph:IsValid() then
		ph:EnableDrag(false)
		ph:EnableGravity(false)
		ph:SetMass(10)
	end
	constraint.AdvBallsocket(e5,e4,0,0,Vector(0,0,0),e4:WorldToLocal(e5:LocalToWorld(Vector(0,0,1))),0,0,0,ang.p-50,0,0,ang.p+5,0,0,0,0,0,1)
	e5:SetNotSolid(true)
	self:AddOnRemove(e5)
	self.Radar2=e5
	self:SetNWEntity("wac_air_radar",e5)
	e5.wac_ignore=true
end

function ENT:CustomPhysicsUpdate(ph)
	if IsValid(self.GunMount1) and IsValid(self.GunMount2) and IsValid(self.Radar1) and IsValid(self.Radar2) and IsValid(self.Gun) then
		local avel=ph:GetAngleVelocity()
		local v=self.MouseVector or Vector(0,0,0)
		local ph1=self.Radar1:GetPhysicsObject()
		ph1:AddAngleVelocity(ph:GetAngleVelocity()-ph1:GetAngleVelocity()+Vector(0,0,v.y*200))
		local ph2=self.Radar2:GetPhysicsObject()
		ph2:AddAngleVelocity(ph:GetAngleVelocity()-ph2:GetAngleVelocity()+Vector(0,v.z*-200,0))
		
		local tr=util.QuickTrace(self.Radar2:GetPos(),self.Radar2:GetForward()*5000,{self,self.Radar1,self.Radar2})
		
		local ph3=self.GunMount1:GetPhysicsObject()
		local dir1=self.GunMount1:WorldToLocal(tr.HitPos):GetNormal()*20
		ph3:AddAngleVelocity(avel-ph3:GetAngleVelocity()+Vector(0,0,dir1.y*50)+Vector(0,0,v.y*150))
		
		local ph4=self.GunMount2:GetPhysicsObject()
		local dir2=self.GunMount2:WorldToLocal(tr.HitPos):GetNormal()*20
		ph4:AddAngleVelocity(avel-ph4:GetAngleVelocity()-Vector(0,dir2.z*50,0)+Vector(0,v.z*-200,0))
		
		local ph5=self.Gun:GetPhysicsObject()
		ph5:AddAngleVelocity(ph5:GetAngleVelocity()*-0.03)

	end

end

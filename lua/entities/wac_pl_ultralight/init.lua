include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:SpawnFunction(ply, tr)
	if (not tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*2)
	ent.Owner=ply
	ent:Spawn()
	ent:Activate()
	return ent
end

ENT.Aerodynamics = {
	Rotation = {
		Front = Vector(0, 0, 0),
		Right = Vector(10, 10, 30), -- Rotate towards flying direction
		Top = Vector(0, -50, 0)
	},
	Lift = {
		Front = Vector(-30, 0, 290), -- Go up when flying forward
		Right = Vector(0, 0, 0),
		Top = Vector(0, 0, -1.5)
	},
	Rail = Vector(1, 15, 100),
	AngleDrag = Vector(0.01, 0.01, 0.01),
}

ENT.Agility = {
	Thrust = 2.5
}

function ENT:AddRotor()
	self:BaseClass("wac_pl_base").AddRotor(self)
	self.TopRotorModel.TouchFunc=nil
end
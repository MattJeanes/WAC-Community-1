
include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:SpawnFunction(ply, tr)
	if (not tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*60)
	ent:SetAngles(Angle(-10,0,0))
	ent:Spawn()
	ent:Activate()
	ent:SetSkin(math.random(0,3))
	ent.Owner=ply
	return ent
end

ENT.Aerodynamics = {
	Rotation = {
		Front = Vector(0, 2, 0), -- Trim (XYZ)
		Right = Vector(0, 0, 50), -- Rotate towards flying direction
		Top = Vector(0, -50, 0) -- Control Sensitivity
	},
	Lift = {
		Front = Vector(0, 0, 230), -- Go up when flying forward
		Right = Vector(0, 0, 0),
		Top = Vector(0, 0, -0.5)
	},
	Rail = Vector(4, 10, 150),
	AngleDrag = Vector(0.01, 0.01, 0.01)
}

function ENT:AddRotor()
	self:base("wac_pl_base").AddRotor(self)
	self.TopRotorModel.TouchFunc=nil
end

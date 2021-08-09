
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
		Front = Vector(0, -0.5, 0), -- Trim (XYZ)
		Right = Vector(0, 0, 30), -- Rotate towards flying direction
		Top = Vector(30, -20, 0) -- Control Sensitivity
	},
	Lift = {
		Front = Vector(-28, 0, 230), -- Go up when flying forward
		Right = Vector(0, 0, 0),
		Top = Vector(0, 0, -0.5)
	},
	Rail = Vector(1, 70, 100),
	Drag = {
		Directional = Vector(0.01, 0.01, 0.01),
		Angular = Vector(30, -20, 10)
	}
}

function ENT:AddRotor()
	self:base("wac_pl_base").AddRotor(self)
	self.TopRotorModel.TouchFunc=nil
end

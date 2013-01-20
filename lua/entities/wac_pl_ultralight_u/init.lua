
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

ENT.Aerodynamics = {
	Rotation = {
		Front = Vector(0, 0.3, 0),
		Right = Vector(0, 0, 70), -- Rotate towards flying direction
		Top = Vector(0, -70, 0)
	},
	Lift = {
		Front = Vector(0, 0, 80), -- Go up when flying forward
		Right = Vector(0, 0, 0),
		Top = Vector(0, 0, -0.5)
	},
	Rail = Vector(1, 5, 20)
}

function ENT:DamageBigRotor() end
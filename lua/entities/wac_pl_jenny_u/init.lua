
include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*65)
	ent.Owner=ply
	ent:Spawn()
	ent:Activate()
	ent:SetSkin(math.random(0,2))
	self.Sounds=table.Copy(sndt)
	return ent
end

ENT.Aerodynamics = {
	Rotation = {
		Front = Vector(0, 9, 0),
		Right = Vector(0, 0, 70), -- Rotate towards flying direction
		Top = Vector(0, -50, 0)
	},
	Lift = {
		Front = Vector(0, 0, 145), -- Go up when flying forward
		Right = Vector(0, 0, 0),
		Top = Vector(0, 0, -0.5)
	},
	Rail = Vector(1, 8, 30)
}
include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+Vector(0,0,5))
	ent:Spawn()
	ent:Activate()
	ent.Owner=ply
	ent:SetSkin(math.random(0,3))
	self.Sounds=table.Copy(sndt)
	return ent
end

function ENT:CustomPhysicsUpdate(ph)	
	if self.rotorRpm > 0.4 and self.rotorRpm < 0.59 and self.TopRotorModel:IsValid() then
		self.TopRotorModel:SetBodygroup(1,1)
	end
	if self.rotorRpm > 0.6 and self.rotorRpm < 0.79 and self.TopRotorModel:IsValid() then
		self.TopRotorModel:SetBodygroup(1,2)
	end
	if self.rotorRpm > 0.8 and self.rotorRpm < 0.89 and self.TopRotorModel:IsValid() then
		self.TopRotorModel:SetBodygroup(1,3)
	end
	if self.rotorRpm > 0.9 and self.TopRotorModel:IsValid() then
		self.TopRotorModel:SetBodygroup(1,4)
	end
	if self.rotorRpm < 0.4 and self.TopRotorModel:IsValid() then
		self.TopRotorModel:SetBodygroup(1,0)
	end
end
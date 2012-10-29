
include("shared.lua")

local rt=GetRenderTarget("WAC_HELI_RT",512,512)
local mat=Material("WeltEnSTurm/WAC/Helicopter/rt")

local HudMat=Material("WeltEnSTurm/helihud/arrow")
local Black=Color(0,0,0,200)
local sm1=1
local sm2=1

local function trim(a,b,c,d)
	local d=math.abs(math.abs(c)-math.abs(b))
	if a<b then
		a=a+d
		if a<b then
			return trim(a,b,c)
		end
	elseif a>c then
		a=a-d
		if a>c then
			return trim(a,b,c)
		end
	end
	return a
end

function ENT:DrawPilotHud()
	if self:GetNWEntity("passenger_1")==LocalPlayer() then
		local old=render.GetRenderTarget()
		mat:SetMaterialTexture("$basetexture", rt)
		render.ClearRenderTarget(rt,Black)
		render.SetRenderTarget(rt)
		cam.Start2D()
		
		surface.SetDrawColor(70,199,50,150)
		
		surface.DrawLine(670,10,670,410)
		surface.DrawLine(700,10,700,410)
		surface.DrawLine(670,10,700,10)
		surface.DrawLine(670,410,700,410)
		surface.DrawRect(670,410-(self.SmoothUp/2+0.5)*400,30,(self.SmoothUp/2+0.5)*400)
		
		surface.DrawLine(710,10,710,410)
		surface.DrawLine(740,10,740,410)
		surface.DrawLine(710,10,740,10)
		surface.DrawLine(710,410,740,410)
		surface.DrawRect(710,410-self.SmoothVal*400,30,self.SmoothVal*400)
		
		surface.SetMaterial(HudMat)
		surface.DrawTexturedRect(690,210-self.SmoothUp*200,20,20)
		
		surface.DrawLine(750,10,750,410)
		surface.DrawLine(1150,10,1150,410)
		surface.DrawLine(750,10,1150,10)
		surface.DrawLine(750,410,1150,410)
		
		surface.DrawLine(750,210,770,210)
		surface.DrawLine(1130,210,1150,210)
		
		surface.SetDrawColor(70,199,50,sm1*10)
		
		local ang=self:GetAngles()
		local p=trim(ang.p*-10,-40,0)
		local y=trim(ang.y*10,-40,0)
		for i=1,10 do
			surface.DrawLine(750,10+i*40+p,1150,10+i*40+p)
		end
		for i=1,10 do
			surface.DrawLine(750+i*40+y,10,750+i*40+y,410)
		end
		surface.SetDrawColor(70,199,50,sm1*50)
		surface.DrawLine(750,210+ang.r*2-ang.p*2,1150,210-ang.r*2-ang.p*2)
		surface.DrawLine(750,210+ang.r*2-ang.p*2+1,1150,210-ang.r*2-ang.p*2+1)
		
		cam.End2D()
		render.SetRenderTarget(old)
	end
end

function ENT:DrawWeaponSelection() end

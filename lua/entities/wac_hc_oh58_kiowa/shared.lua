ENT.Base 				= "wac_hc_base"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategory

ENT.PrintName			= "Bell OH-58D Kiowa"
ENT.Author				= "}{ornet/Vest"

ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model			= "models/BF2/Kiowa/body.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/BF2/Kiowa/rotor.mdl"
ENT.BackRotorModel	= "models/BF2/Kiowa/tailrotor.mdl"
ENT.TopRotorDir		= -1
ENT.BackRotorDir	= -1
ENT.TopRotorPos	= Vector(-35.5,2,96)
ENT.BackRotorPos	= Vector(-292.5,4,73.6)
ENT.RotorWidth		= 190
ENT.EngineForce	= 34
ENT.Weight			= 2300
ENT.SeatSwitcherPos	= Vector(0,0,0)
ENT.SmokePos		= Vector(-90,0,95)
ENT.FirePos		= Vector(-90,0,95)

function ENT:AddSeatTable()
	return{
		[1]={
			Pos=Vector(12, -9, 32),
			ExitPos=Vector(38,-60,10),
			NoHud=false,
			wep={[1]=wac.aircraft.getWeapon("M134",{
		Name="M296",
		Ammo=500,
		MaxAmmo=500,
		NextShoot=1,
		LastShot=0,
		Gun=1,
		ShootDelay=0.04,
		ShootPos1=Vector(20,43,23),
		ShootPos2=Vector(20,43,23),
		func=function(self, t, p)
			if t.NextShoot <= CurTime() then
				if t.Ammo>0 then
					if !t.Shooting then
						t.Shooting=true
						t.SStop:Stop()
						t.SShoot:Play()
					end
					local bullet={}
					bullet.Num 		= 1
					bullet.Src 		= self:LocalToWorld(t.Gun==1 and t.ShootPos1 or t.ShootPos2)
					bullet.Dir 		= self:GetForward()
					bullet.Spread 	= Vector(0.023,0.023,0)
					bullet.Tracer		= 0
					bullet.Force		= 10
					bullet.Damage	= 80
					bullet.Attacker 	= p
					local effectdata=EffectData()
					effectdata:SetOrigin(bullet.Src)
					effectdata:SetAngles(self:GetAngles())
					effectdata:SetScale(1.5)
					util.Effect("MuzzleEffect", effectdata)
					self.Entity:FireBullets(bullet)
					t.Gun=(t.Gun==1 and 2 or 1)
					t.Ammo=t.Ammo-1
					t.LastShot=CurTime()
					t.NextShoot=t.LastShot+t.ShootDelay
					local ph=self:GetPhysicsObject()
					if ph:IsValid() then
						ph:AddAngleVelocity(Vector(0,0,t.Gun==1 and 3 or -3))
					end
				end
				if t.Ammo<=0 then
					t.StopSounds(self,t,p)
					t.Ammo=t.MaxAmmo
					t.NextShoot=CurTime()+60
				end
			end
		end,
		StopSounds=function(self,t,p)
			if t.Shooting then
				t.SShoot:Stop()
				t.SStop:Play()
				t.Shooting=false
			end
		end,
		Init=function(self,t)
			t.SShoot=CreateSound(self,"WAC/cannon/gau21_fire_2.wav")
			t.SStop=CreateSound(self,"WAC/cannon/gau21_fire_3.wav")
		end,
		Think=function(self,t,p)
			if t.NextShoot<=CurTime() then
				t.StopSounds(self,t,p)
			end
		end,
		DeSelect=function(self,t,p)
			t.StopSounds(self,t,p)
		end
			}),
				[2]=wac.aircraft.getWeapon("Hydra 70",{
					Ammo=7,
					MaxAmmo=7,
					ShootPos={
						[1]=Vector(14,-43,28),
						[2]=Vector(14,-43,28),
					}
				}),
			},
		},
		[2]={
			Pos=Vector(12, 14, 32),
			ExitPos=Vector(28,50,10),
			NoHud=true,
			wep={
				
				[1]=wac.aircraft.getWeapon("No Weapon"),
				[2]=wac.aircraft.getWeapon("Hellfire",{
			Name="CCD Camera",
			Ammo=0,
			MaxAmmo=0,
			NextShoot=1,
			LastShot=0,
			ShootDelay=2,
			Gun=1,
			MouseControl=true,
		ShootPos={
			[1]=Vector(50,60,40),
			[2]=Vector(50,-60,40),
		},
		CamPos=Vector(80,0,30),
				}),
			},
		},
	}
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/Heli/h6_start.wav"),
		Blades=CreateSound(self.Entity,"OH58D.External"),
		Engine=CreateSound(self.Entity,"OH58D.Internal"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end

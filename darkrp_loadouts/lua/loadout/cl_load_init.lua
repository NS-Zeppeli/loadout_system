AddCSLuaFile( "loadout/shared.lua" )


local frame = vgui.Create("DFrame")
frame:SetSize(500, 100)
frame:Center()
frame:SetVisible(true)
frame:MakePopup()
frame.Paint = function (s , w ,h )
	draw.RoundedBox(5, 0, 0, w, h, Color(255, 120, 120)) -- change frame color
	draw.RoundedBox(5,2,2,w-4, height-4,Color(50,50,50)) 
end


function buttonPressed()
	print("Teste de Click no botao " .. variabletest)
end

local button = vgui.Create("DButton", frame)
button:SetPos(250, 50)
button:SetSize(25, 100)
button:SetText("AK-12") -- weapon name on button
button.DoClick = PlayerLoadout
button.Paint = function ( s , w , h )
	draw.RoundedBox(0,0,0,w,h,Color(255,255,255)) 
end

function PlayerLoadout( ply )
	ply:Give( "weapon_pistol" )
	frame:CloseDermaMenus()
	return true
end

local label = vgui.Create("Dlabel", frame)
label:SetPos(10, 10)
label:SetText("CHOOSE YOUR WEAPON")

--[[	Obs.
	Se a saida no console pelos valores
	for amarela = Client side
	se for azul = server side
]]
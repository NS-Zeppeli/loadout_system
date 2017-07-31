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

function PlayerLoadout
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


net.Receive( "TestNetworkingEntitiesToClient", function( len )
	// Do something
	local _frame = vgui.Create( "DFrame" );
	_frame:SetSize( 500, 500 );
	_frame:Center( );
	_frame:SetVisible( true );
	_frame:MakePopup( );
end )
]]

function WeaponSelectorDerma()
local WeaponFrame = vgui.Create("DFrame") --create a frame
WeaponFrame:SetSize(250, 80) --set its size
WeaponFrame:Center() --position it at the center of the screen
WeaponFrame:SetTitle("Take the weapon that you want") --set the title of the menu 
WeaponFrame:SetDraggable(true) --can you move it around
WeaponFrame:SetSizable(false) --can you resize it?
WeaponFrame:ShowCloseButton(true) --can you close it
WeaponFrame:MakePopup() --make it appear
 
local PistolButton = vgui.Create("DButton", WeaponFrame)
PistolButton:SetSize(100, 30)
PistolButton:SetPos(10, 35)
PistolButton:SetText("Pistol")
PistolButton.DoClick = function() RunConsoleCommand("weapon_take", "pistol") WeaponFrame:Close() end --make it run our "weapon_take" console command with "pistol" as the 1st argument and then close the menu
 
local SMGButton = vgui.Create("DButton", WeaponFrame)
SMGButton:SetSize(100, 30)
SMGButton:SetPos(140, 35)
SMGButton:SetText("SMG") --Set the name of the button
SMGButton.DoClick = function() RunConsoleCommand("weapon_take", "smg") WeaponFrame:Close() end
end
 
concommand.Add("selectweapon", WeaponSelectorDerma) --make the console command to make this menu popup
 
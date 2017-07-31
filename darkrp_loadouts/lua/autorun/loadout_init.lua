if SERVER then
	include("loadout/sv_load_init.lua")
else
	include("loadout/cl_load_init.lua")
	AddCSLuaFile( "cl_init.lua" )
end
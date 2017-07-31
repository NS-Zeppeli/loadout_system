util.AddNetworkString( "TestNetworkingEntitiesToClient" );

function PlayerLoadout( ply )
	ply:Give( "weapon_pistol" )
end

function ENT:AcceptInput( Name, Activator, Caller )	
	if Name == "Use" and Caller:IsPlayer( ) then
		net.Start( "TestNetworkingEntitiesToClient" );
		// You can write data if you want, but it's not necessary unless you have different npcs / different functions where you want to use just one base entity with multiple shots/etc
		net.Send( Caller );
	end
end


function GivePlayerAWeapon( ply, cmd, args ) --Starting our function, ply is the player who ran the console command, cmd is the command name (in this case "weapon_give"), args is the arguments of the console command
	if args[1] == "pistol" then --if the 1st argument is "pistol" then do:
	        ply:Give("weapon_pistol") --give the player a pistol
		ply:ChatPrint("You got a pistol!") --print "You got a pistol!" in the chat
	end --close our if loop
	if args[1] == "smg" then --if the 1st argument is "smg" then do:
		ply:Give("weapon_smg") --give the player an SMG
		ply:ChatPrint("You got an SMG!") --print "You got an SMG!" in the chat
        end--close our if loop
end --close our function
 
concommand.Add("weapon_take", GivePlayerAWeapon) --make the console command "weapon_take" run the GivePlayerAWeapon function
 
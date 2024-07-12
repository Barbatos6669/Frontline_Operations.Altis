// Description: This script handles the gathering of scrap metal from a node by a player.

systemChat "Scrap metal action clicked"; // Debug message to confirm the script has been initialized

params ["_vehicle", "_player"];

// Check if the player can carry the item and the vehicle has scrap metal
if (_player canAdd "Chemlight_red" && _vehicle getVariable ["scrapMetal", 0] > 0) then {
    // Play an animation of the player gathering scrap metal
    _player playMove "AinvPercMstpSnonWnonDnon_PutDown_AmovPercMstpSnonWnonDnon"; // Play the gathering animation
    sleep 3; // Wait for 3 seconds to simulate the player gathering scrap metal

    // Update scrap metal in the vehicle and add to player
    _vehicle setVariable ["scrapMetal", (_vehicle getVariable ["scrapMetal", 0]) - 1, true]; // Remove 1 scrap metal from the vehicle
    _player addMagazine "Chemlight_red"; // Add 1 chemlight to the player

    // Debug message to confirm scrap metal was gathered
    systemChat format ["Scrap metal gathered. Remaining: %1", _vehicle getVariable ["scrapMetal", 0]];

    // Check if the vehicle is now empty and delete it if true
    if (_vehicle getVariable ["scrapMetal", 0] <= 0) then {
        private _pos = getPos _vehicle; // Get the position before deleting
        deleteVehicle _vehicle;

        // Start the respawn script for this node
        [_pos] spawn compile preprocessFileLineNumbers "scripts\functions\fn_respawnScrapMetalNode.sqf";
    };
} else {
    // Check why the player cannot gather scrap metal
    if (!(_player canAdd "Chemlight_red")) then {
        systemChat "Cannot carry any more chemlights"; // Debug message to confirm the player cannot carry any more chemlights
    };

    if (_vehicle getVariable ["scrapMetal", 0] <= 0) then {
        systemChat "No scrap metal left in the node"; // Debug message to confirm there is no scrap metal left in the node
    };

    if (!(_player canAdd "Chemlight_red") && _vehicle getVariable ["scrapMetal", 0] > 0) then {
        systemChat "Cannot gather scrap metal"; // Debug message to confirm the player cannot gather scrap metal
    };
};

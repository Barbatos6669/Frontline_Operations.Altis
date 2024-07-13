// scripts\bases\bunkerBase.sqf

// Description: The Bunker Base (colloquially known as BoB or BB) is a Bunker modification that acts as a Forward Base and provides Infrastructure for nearby connected Bunker and Trench segments. It can be upgraded for additional health and resistance.
systemChat "Initializing Bunker Base..."; // Debug message to confirm the script is running

// Designate the Bunker Base
private _bunkerBase = createVehicle ["Land_BagBunker_01_Large_green_F", getMarkerPos "bunkerBase", [], 0, "CAN_COLLIDE"];
// Designate the Bunker Base Inventory
private _bunkerBaseInventory = createVehicle ["B_CargoNet_01_ammo_F", getMarkerPos "bunkerBase", [], 0, "CAN_COLLIDE"]; // Create a container for the Bunker Base Inventory
_bunkerBase setVariable ["bunkerBaseInventory", _bunkerBaseInventory]; // Set the Bunker Base Inventory

// Clear the inventory of the container
[_bunkerBaseInventory] call fn_clearInventory;

// Create a respawn position for the bunker base
private _respawnPosition = createVehicle ["Land_helipadEmpty_F", getMarkerPos "bunkerBase", [], 0, "CAN_COLLIDE"];
_respawnPosition setVariable ["respawn", true]; // Set the respawn variable to true

// Make the respawn variable invisible
_respawnPosition hideObjectGlobal true;

// Add respawn marker
private _respawnMarker = createMarker ["respawn_West", getMarkerPos "bunkerBase"]; // Create the respawn marker
_respawnMarker setMarkerShape "ICON"; // Set the respawn marker shape
_respawnMarker setMarkerType "hd_dot"; // Set the respawn marker type
_respawnMarker setMarkerAlpha 0; // Set the respawn marker alpha

// Start the manage respawn function
[_respawnPosition, _bunkerBaseInventory] execVM "scripts\functions\fn_manageRespawn.sqf";

// Debug message to confirm the script is running
systemChat "Bunker Base Initialized!";

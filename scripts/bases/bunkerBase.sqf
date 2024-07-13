// scripts/bases/bunkerBase.sqf

// Descriptiom: The Bunker Base (colloquially known as BoB or BB) is a Bunker modification that acts as a Forward Base and provides Infrastructure for nearby connected Bunker and Trench segments. It can be upgraded for additional health and resistance.
systemChat "Initializing Bunker Base..."; // Debug message to confirm the script is running

// designate the Bunker Base
private _bunkerBase = createVehicle ["Land_BagBunker_01_Large_green_F", getMarkerPos "bunkerBase", [], 0, "CAN_COLLIDE"];
// designate the Bunker Base Inventory
private _bunkerBasseInventory = createVehicle [ "B_CargoNet_01_ammo_F", getMarkerPos "bunkerBase", [], 0, "CAN_COLLIDE"];
_bunkerBase setVariable ["bunkerBaseInventory", _bunkerBasseInventory]; // Set the Bunker Base Inventory

// clear the inventory of the container
[_bunkerBasseInventory] call fn_clearInventory;

// Create a respawn position for the bunker Base.
private _respawnPosition = createVehicle ["Land_helipadEmpty_F", getMarkerPos "bunkerBase", [], 0, "CAN_COLLIDE"];
_respawnPosition setvariable ["respawn", true]; // Set the respawn variable to true

// Make the respawn Variable invisable
_respawnPosition hideObjectGlobal true;
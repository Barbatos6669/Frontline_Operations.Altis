// scripts\bases\bunkerBase.sqf

/*
    Description: The Bunker Base is a Bunker modification that acts
    as a Forward Base and provides Infrastructure for nearby connected Bunker and Trench segments. 
    The Bunker Base is a large, green, camouflaged structure that can be placed in strategic locations
    to provide a central hub for players to gather resources, store items, and plan their next moves.
*/
systemChat "Initializing Bunker Base..."; // Debug message to confirm the script is running

// Designate the Bunker Base
private _bunkerBase = createVehicle ["Land_BagBunker_01_Large_green_F", getMarkerPos "bunkerBase", [], 0, "CAN_COLLIDE"];

// Designate the Bunker Base Inventory
private _bunkerBaseInventory = createVehicle ["B_CargoNet_01_ammo_F", getMarkerPos "bunkerBase", [], 0, "CAN_COLLIDE"]; // Create a container for the Bunker Base Inventory
_bunkerBase setVariable ["bunkerBaseInventory", _bunkerBaseInventory]; // Set the Bunker Base Inventory

// Clear the inventory of the container
[_bunkerBaseInventory] call fn_clearInventory;

// Add an item to the container for testing
[_bunkerBaseInventory, "ItemMap", 10] call fn_addItemToInventory;

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


// respawn logic.
// Check if the player has respawned at the bunker base
// If the player respawns at the bunker base, remove a map from the inventory.

while {true} do 
{
    systemChat "Checking for respawn...";
    sleep 5; // Wait for 5 seconds before checking for respawn    

    // return list of items im the bunker base inventory
    private _items = [_bunkerBaseInventory] call fn_getInventoryItems;  

    // Perform checks on the item in the Inventory.
    private _itemNames = _items select 0; // Get the item names
    private _itemCounts = _items select 1; // Get the item quantities

    // Check if the bunker base inventory contains a maps.
    private _mapIndex = _itemNames find "ItemMap"; // Find the index of the map item
    if (_mapIndex != -1) then // If the map item is found
    {
        BIS_fnc_respawnTickets = 1; // Set the respawn tickets to 1
        private _mapCount = _itemCounts select _mapIndex; // Get the count of the map item
        if (_mapCount > 0) then // If the map count is greater than 0
        {
            // dubug message to confirm map is found, with count.
            systemChat format ["Map found in bunker base inventory with count: %1", _mapCount];         
        }
        else 
        {
            systemChat "You do not have any maps in the bunker base inventory!";
        };
    }
    else // If the map item is not found
    {
        systemChat "You do not have a map in the bunker base inventory!";
    };  
};



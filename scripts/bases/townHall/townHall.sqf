// scripts\bases\townHall\townHall.sqf

/*
    Description: the town hall is a garrisoned building vital for the down defence:
    - it provides a respawn point for the players
    - it provides a storage for the players
    - it provides a place to plan the next moves

    It is not a buildable location but a fixed location on the map.

    A destroyed can be rebuilt by the players.
    owner ship of the towen hall determines the ownership of the region.
*/

systemChat "Initializing Town Hall..."; // Debug message to confirm the script is running

// Designate the Town Hall
private _townHall = createVehicle ["Land_i_House_Big_02_V2_F", getMarkerPos "townHall", [], 0, "CAN_COLLIDE"];

//rotate the town hall to 40 degrees
_townHall setDir 40;

// Designate the Town Hall Inventory
private _townHallInventory = createVehicle ["B_CargoNet_01_ammo_F", getMarkerPos "townHall", [], 0, "CAN_COLLIDE"]; // Create a container for the Town Hall Inventory

// rotate the town hall inventory to 40 degrees
_townHallInventory setDir 40;

// Set the Town Hall Inventory
_townHall setVariable ["townHallInventory", _townHallInventory];

// Clear the inventory of the container
[_townHallInventory] call fn_clearInventory;

// set side owner of the town hall
_townHall setVariable ["side", "WEST"];

// if side is west then set the color to blue else set the color to red
if (_townHall getVariable ["side", "WEST"] == "WEST") then
{
    _townHall setVehicleVarName "colorBlue";
}
else
{
    _townHall setVehicleVarName "colorRed";
};

// make this point capturable by the players
_townHall setVariable ["capturable", true];

// if the town hall is destroyed, it can be rebuilt
_townHall setVariable ["destroyed", false];


// loop to check if the town hall is destroyed
while {true} do
{
    systemChat "Checking for town hall destruction...";
    sleep 5; // Wait for 5 seconds before checking for destruction

    // check if the town hall is destroyed
    private _isDestroyed = _townHall getVariable ["destroyed", false];
    if (_isDestroyed) then // If the town hall is destroyed
    {
        systemChat "Town Hall is destroyed!"; // Debug message to confirm the town hall is destroyed
        // Rebuild the town hall
        _townHall setVariable ["destroyed", false]; // Set the town hall to not destroyed
        _townHall setDamage 0; // Set the town hall damage to 0
    };
};





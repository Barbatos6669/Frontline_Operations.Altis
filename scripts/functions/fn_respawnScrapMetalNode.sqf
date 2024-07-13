// Description: This function handles the respawn of a scrap metal node after a set amount of time.

params ["_pos"];

// Function to respawn the vehicle
private _respawnVehicle = 
{
    params ["_pos"];

    // Debug message to confirm the function has been called
    systemChat format ["Respawning scrap metal node at position: %1", _pos];

    // Adjustable respawn time
    sleep 100; // Wait for 100 seconds

    // Create a new vehicle at the same position
    private _vehicle = createVehicle ["Land_Wreck_Hunter_F", _pos, [], 0, "CAN_COLLIDE"];

    // Initialize the amount of scrap metal in the node
    _vehicle setVariable ["scrapMetal", 10, true];

    // Add the gather scrap metal action to the vehicle
    _vehicle addAction ["Gather Scrap Metal", "scripts\resourceGathering\gatherScrapMetalAction.sqf", [], 0, false, true, "", "_this distance _target < 5"];

    // Wait until the vehicle is deleted again
    waitUntil {isNull _vehicle};

    // Call this function again to respawn after deletion
    [_pos] call _respawnVehicle;
};

// Start the respawn loop
[_pos] call _respawnVehicle;

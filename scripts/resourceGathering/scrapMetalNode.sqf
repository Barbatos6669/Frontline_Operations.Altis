// Description: This script handles the initialization of scrap metal nodes.

systemChat "Scrap Metal Nodes Script initialized"; // Debug message to confirm the script has been initialized

// Retrieve the marker array from the mission namespace
_markerArray = missionNamespace getVariable ["markerArray", []];

// Check if the marker array is defined
if (isNil "_markerArray" || {_markerArray isEqualTo []}) then {
    systemChat "Error: Marker array not found"; // Debug message to confirm the marker array is missing
} else {
    // Loop through each marker and create a scrap metal node
    {
        private _markerPos = getMarkerPos _x; // Get the position of the current marker
        systemChat format ["Marker position: %1", _markerPos];

        // Create a scrap metal node at this marker position
        if (typeName _markerPos == "ARRAY") then {
            private _vehicle = createVehicle ["Land_Wreck_Hunter_F", _markerPos, [], 0, "CAN_COLLIDE"]; // Spawn a damaged vehicle model as the scrap metal node

            // Initialize the amount of scrap metal in the node
            _vehicle setVariable ["scrapMetal", 10, true];

            // Add an action to the vehicle to allow players to gather scrap metal
            _vehicle addAction ["Gather Scrap Metal", "scripts\resourceGathering\gatherScrapMetalAction.sqf", [], 0, false, true, "", "_this distance _target < 5"];

            // Start the respawn script for this node
            [_markerPos] spawn compile preprocessFileLineNumbers "scripts\functions\fn_respawnScrapMetalNode.sqf";
        } else {
            systemChat format ["Error: Marker position is not an array: %1", _markerPos];
        };
    } forEach _markerArray;
};

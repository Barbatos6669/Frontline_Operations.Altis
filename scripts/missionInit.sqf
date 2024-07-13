// Description: This script initializes various components of the mission.

// Load the marker array
[] execVM "scripts\resourceGathering\scrapMetalMarkers.sqf"; // Ensure this is executed before scrapMetalNode.sqf

// Execute the scrapMetalNodes script
[] execVM "scripts\resourceGathering\scrapMetalNode.sqf";

// Execute the playerDataStats script to initialize player variables
[] execVM "scripts\playerDataStats.sqf";
[] execVM "scripts\functions\fn_clearInventory.sqf";
// Initialize the Bunker Base
[] execVM "scripts\bases\bunkerBase.sqf";

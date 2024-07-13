// Description: This script initializes various components of the mission.

// Load the marker array
[] execVM "scripts\functions\fn_clearInventory.sqf"; 
[] execVM "scripts\functions\fn_manageRespawn.sqf";
[] execVM "scripts\resourceGathering\scrapMetalMarkers.sqf"; // Ensure this is executed before scrapMetalNode.sqf
[] execVM "scripts\resourceGathering\scrapMetalNode.sqf"; // Execute the scrapMetalNodes script
[] execVM "scripts\playerDataStats.sqf"; // Execute the playerDataStats script to initialize player variables
[] execVM "scripts\bases\bunkerBase.sqf"; // Initialize the Bunker Base

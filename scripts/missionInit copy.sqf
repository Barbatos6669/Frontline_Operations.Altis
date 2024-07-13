// missionInit.sqf

// Description: This script initializes various components of the mission.

// Load the marker array
[] execVM "scripts\resourceGathering\scrapMetalMarkers.sqf";

// Execute the scrapMetalNodes script
[] execVM "scripts\resourceGathering\scrapMetalNode.sqf";

// Execute the playerDataStats script to initialize player variables
[] execVM "scripts\playerDataStats.sqf";


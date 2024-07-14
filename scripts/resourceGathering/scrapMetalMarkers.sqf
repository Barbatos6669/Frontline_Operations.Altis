// scripts\resourceGathering\gatherScrapMetalAction.sqf

// Description: This script contains the array of marker names for the scrap metal nodes.

_markerArray = 
[
    "scrapMetalNode1",
    "scrapMetalNode2",
    "scrapMetalNode3"
    // Add more marker names as needed
];

// debug message to confirm the array has been created
systemChat "Scrap metal marker array created.";

// Store the array in the mission namespace
missionNamespace setVariable ["markerArray", _markerArray];

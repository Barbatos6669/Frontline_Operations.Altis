// scripts/playerDataStats.sqf

// Description: This script initializes player gatherable and refined resource variables.

// Gatherable resource variables
player setVariable ["ScrapMetal", 0, true]; // Set the player's scrap metal count to 0
player setVariable ["Wood", 0, true]; // Set the player's wood count to 0
player setVariable ["Coal", 0, true]; // Set the player's coal count to 0
player setVariable ["Components", 0, true]; // Set the player's components count to 0
player setVariable ["Sulfur", 0, true]; // Set the player's sulfur count to 0

// Refined resource variables
player setVariable ["BuildingSupplies", 0, true]; // Set the player's building supplies count to 0

systemChat "Player data stats initialized"; // Debug message to confirm the script has been initialized

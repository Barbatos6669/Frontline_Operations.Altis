// scripts\functions\fn_getInventoryItems.sqf

// Description: Returns a list of items in the inventory of a container

// Parameters:
// _container: OBJECT - The container to check

// Returns: ARRAY - A list of items in the container

// Example:
// [_bunkerBaseInventory] call fn_getInventoryItems;

fn_getInventoryItems = 
{
    params ["_container"]; // Define the parameters

    systemChat "Getting inventory items..."; // Debug message to confirm the function has been called

    private _items = getItemCargo _container; // Get the items in the container
    systemChat format ["Items in Container: %1", _items]; // Debug message to display the items in the container
    
    _items // Return the items
};
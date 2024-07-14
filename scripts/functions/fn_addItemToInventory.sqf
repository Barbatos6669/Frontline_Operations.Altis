// scripts\functions\fn_addItemToInventory.sqf

// Description: This function adds an item to a container's inventory.

fn_addItemToInventory = 
{
    params ["_container", "_item", "_count"];
    
    // Debug message to confirm the function has been called
    systemChat format ["Adding %1 x %2 to inventory...", _count, _item];
    
    // Add the item to the container
    _container addItemCargoGlobal [_item, _count];
};
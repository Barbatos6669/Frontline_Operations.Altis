// scripts\functions\fn_removeItemFromInventory.sqf

// Description: This function removes an item from a container's inventory.

fn_removeItemFromInventory = 
{
    params ["_container", "_item", "_count"];
    
    // Debug message to confirm the function has been called
    systemChat format ["Removing %1 x %2 from inventory...", _count, _item];
    
    // Remove the item from the container
    _container removeItemCargoGlobal [_item, _count];
};
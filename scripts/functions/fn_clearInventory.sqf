// scripts\functions\fn_clearInventory.sqf

fn_clearInventory = 
{
	systemChat "Clearing inventory..."; // Debug message to confirm the function has been called
	
	params ["_container"];
	clearWeaponCargoGlobal _container;
	clearMagazineCargoGlobal _container;
	clearItemCargoGlobal _container;
	clearBackpackCargoGlobal _container;
};
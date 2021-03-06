//::///////////////////////////////////////////////
//:: FileName isomies
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 22.12.2002 20:08:12
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Reject player races
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_DWARF)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_ELF)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_GNOME)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_HALFELF)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_HALFLING)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_HUMAN)
		return FALSE;

	// Reject other races
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_ABERRATION)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_ANIMAL)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_BEAST)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_CONSTRUCT)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_DRAGON)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_ELEMENTAL)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_FEY)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_GIANT)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_HUMANOID_GOBLINOID)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_MAGICAL_BEAST)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_HUMANOID_MONSTROUS)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_HUMANOID_ORC)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_OUTSIDER)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_HUMANOID_REPTILIAN)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_SHAPECHANGER)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_UNDEAD)
		return FALSE;
	if(GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_VERMIN)
		return FALSE;

	return TRUE;
}

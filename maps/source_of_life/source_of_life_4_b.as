#include "cb_return"
#include "lives"

const string szEntFile = "source_of_life/source_of_life.ent";

void MapActivate()
{
	LivesActivate();

	CBaseEntity@ pEntity = null;
	while ( ( @pEntity = g_EntityFuncs.FindEntityByClassname( pEntity, "trigger_auto" ) ) !is null )
	{
		if ( string( pEntity.pev.target ).CompareN( "sence4_auto_", 12 ) != 0 )
			continue;
		
		g_EntityFuncs.Remove( pEntity );
	}

	while ( ( @pEntity = g_EntityFuncs.FindEntityByClassname( pEntity, "trigger_changevalue" ) ) !is null )
	{
		if ( pEntity.GetTargetname().CompareN( "sence4_auto_", 12 ) != 0 )
			continue;

		if ( pEntity.pev.target != "wootguy_data" )
			continue;
		
		g_EntityFuncs.Remove( pEntity );
	}


	@pEntity = g_EntityFuncs.Create( "info_target", g_vecZero, g_vecZero, false );
	if ( pEntity !is null )
		pEntity.pev.target = string_t( "sys1_e01_music_th2" );

	if ( !g_EntityLoader.LoadFromFile( szEntFile ) )
		g_EngineFuncs.ServerPrint( "Can't open " + szEntFile + "\n" );
}

void MapInit()
{
	CrowbarReturnInit();

	LivesInit();
}

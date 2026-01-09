x970003_g_ScriptId = 970003

function x970003_OnDie(sceneId, objId, killerId)
    local MstId = LuaFnCreateMonster(sceneId, 30,75,22,3,-1,970004)
       LuaFnSendSpecificImpactToUnit(sceneId,MstId,MstId,MstId,18,0)
       SetCharacterName(sceneId, MstId,"Ngô Lînh Quân")
	   SetCharacterTitle(sceneId, MstId, "Tiêu Dao Tam ÐÕi Ð® TØ")
	local MstId2 = LuaFnCreateMonster(sceneId, 599,77,22,3,-1,970005)
       LuaFnSendSpecificImpactToUnit(sceneId,MstId2,MstId2,MstId2,18,0)
       SetCharacterName(sceneId, MstId2,"Tiªt Mµ Hoa")
	   SetCharacterTitle(sceneId, MstId2, "Th¥n Y")
end
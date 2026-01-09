--Æ®Ãì·å ÎÚÀÏTheo AI

--A	¡¾½ðµÆÍòÕµ¡¿¶¾ÊôÐÔÈº¹¥....
--B ¡¾Âé±Ô¶¾Ò©¡¿ÆÕÍ¨¼¼ÄÜ....È«¸±±¾Ëæ»úÌôÒ» cái   nhân ¶ÔÆäÊÍ·Å¿Õ¼¼ÄÜ....ÔÙ¸øÆä¼Ó cái buff....
--C ¡¾ÂÌ²¨ÏãÂ¶¡¿¶Ô×Ô¼ºÊ¹ÓÃÒ» cái ¿Õ¼¼ÄÜ....Í¬Ê±ÔÚµ±Ç°µÐ  nhân ½ÅÏÂ·Å cái ÏÝÚå....
--D ¡¾¶¾ÐÔ±ä»»¡¿Ã¿¸ô5Ãë¸øÈ«¸±±¾ËùÓÐ  nhân ¼ÓÒ» cái buff....

--È«³Ì¶¼´øÓÐÃâÒßÖÆ¶¨¼¼ÄÜµÄbuff....
--20Ãëºó¿ªÊ¼Ñ­ l¥nÊÍ·ÅABC¼¼ÄÜ....ÀäÈ´20Ãë....
--Ã¿5ÃëÊ¹ÓÃÒ»´ÎD....
--BOSS ðßþc Íö»òÍÑÀëÕ½¶·»á¸øËùÓÐ  nhân Çå³ýDµÄbuff....


--Viet Translate by VTAngel (Suong Anh)
x890066_g_ScriptId	= 890066

--¸±±¾Âß¼­½Å±¾ºÅ....
x890066_g_FuBenScriptId = 890063

--ÃâÒßBuff....
x890066_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ð©¸ºÃæÐ§¹û....
x890066_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒþÉí....

--ABC¼¼ÄÜ....
x890066_SkillA			= 561
x890066_SkillB			= 562
x890066_BuffB				= 18164
x890066_SkillC			= 560
x890066_SpeObjC			= 54
x890066_SkillABC_CD	=	20000

--D¼¼ÄÜ....
x890066_BuffD				= 18134
x890066_SkillD_CD		= 5000


--AI Index....
x890066_IDX_CD_SkillABC		= 1	--ABC¼¼ÄÜµÄCD....
x890066_IDX_CurSkillIndex	= 2	--½ÓÏÂÀ´¸ÃÊ¹ÓÃABCÖÐµÄÄÄ cái ¼¼ÄÜ....
x890066_IDX_CD_SkillD			= 3	--D¼¼ÄÜµÄCD....

x890066_IDX_CombatFlag 		= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....

x890066_g_Npc_4 = { 
	Name			= "Ðinh xuân thu",
	MonsterID	= 42206,
	PosX			= 129,
	PosY			= 127,
	ScriptID	= 890075
}

--**********************************
--³õÊ¼»¯....
--**********************************
function x890066_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x890066_ResetMyAI( sceneId, selfId )
end


--**********************************
--ÐÄÌø....
--**********************************
function x890066_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇ ðßþc ÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890066_IDX_CombatFlag ) then
		return
	end

	--ABC¼¼ÄÜÐÄÌø....
	if 1 == x890066_TickSkillABC( sceneId, selfId, nTick ) then
		return
	end

	--D¼¼ÄÜÐÄÌø....
	if 1 == x890066_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--½ø  nhân Õ½¶·....
--**********************************
function x890066_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890066_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890066_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x890066_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½ø  nhân Õ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890066_IDX_CombatFlag, 1 )

end


--**********************************
--TÕm bi®tÕ½¶·....
--**********************************
function x890066_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x890066_ResetMyAI( sceneId, selfId )

	--É¾³ý×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨¶Ô»°NPC....
	local MstId = CallScriptFunction( x890066_g_FuBenScriptId, "CreateBOSS", sceneId, "MuRongFu_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--É± ðßþc µÐ  nhân ....
--**********************************
function x890066_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
-- ðßþc Íö....
--**********************************
function x890066_OnDie( sceneId, selfId, killerId )

	--ÖØÖÃAI....
	x890066_ResetMyAI( sceneId, selfId )

	--É¾³ý×Ô¼º....
	SetCharacterDieTime( sceneId, selfId, 3000 )

	--¿ªÆôÎÚÀÏTheo  ðßþc ÍöµÄ¼ÆÊ±Æ÷....
	local x,z = GetWorldPos( sceneId, selfId )
	CallScriptFunction( x890066_g_FuBenScriptId, "OpenMuRongFuDieTimer", sceneId, 4, x890066_g_ScriptId, x, z )

	--ÉèÖÃÒÑ¾­ÌôÕ½¹ýÎÚÀÏTheo ....
	CallScriptFunction( x890066_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "MuRongFu", 2 )

	--Èç¹û»¹Ã»ÓÐÌôÕ½¹ýË«×ÓÔò¿ÉÒÔÌôÕ½Ë«×Ó....
	if 2 ~= CallScriptFunction( x890066_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ShuangZi" )	then
		CallScriptFunction( x890066_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ShuangZi", 1 )
	end
	
	-- zchw È«Çò¹«¸æ
	local	playerName	= GetName( sceneId, killerId )
	
	--É± ðßþc ¹ÖÎïµÄÊÇ³èÎïÔò»ñÈ¡ÆäÖ÷  nhân µÄÃû×Ö....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--Èç¹ûÍæ¼Ò×é¶ÓÁËÔò»ñÈ¡¶Ó³¤µÄÃû×Ö....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	
	if playerName ~= nil then
		str = format("Thi¬u Th¤t S½n #YMµ Dung Phøc #W: khai .. khai .. khai, má có th¢ng ðái b§y #cFF0000 m¤t dÕy #cFF0000#{_INFOUSR%s}#W ngß½i cûng ð×ng ð¡c ý, hôm khác ta s¨ mang theo kh¦u trang nha con!", playerName); --ÎÚÀÏTheo 
		AddGlobalCountNews( sceneId, str )
	end
	
end


--**********************************
--ÖØÖÃAI....
--**********************************
function x890066_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊý....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillABC, x890066_SkillABC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CurSkillIndex, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillD, x890066_SkillD_CD )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890066_IDX_CombatFlag, 0 )

	--¸øËùÓÐ  nhân Çå³ýDµÄbuff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x890066_BuffD )
		end
	end

end


--**********************************
--ABC¼¼ÄÜÐÄÌø....
--**********************************
function x890066_TickSkillABC( sceneId, selfId, nTick )

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillABC )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillABC, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillABC, x890066_SkillABC_CD-(nTick-cd) )

		local CurSkill = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890066_IDX_CurSkillIndex )
		if CurSkill == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CurSkillIndex, 2 )
			return x890066_UseSkillA( sceneId, selfId )
		elseif CurSkill == 2 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CurSkillIndex, 3 )
			return x890066_UseSkillB( sceneId, selfId )
		elseif CurSkill == 3 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CurSkillIndex, 1 )
			return x890066_UseSkillC( sceneId, selfId )
		end

	end

end


--**********************************
--D¼¼ÄÜÐÄÌø....
--**********************************
function x890066_TickSkillD( sceneId, selfId, nTick )

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillD )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillD, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillD, x890066_SkillD_CD-(nTick-cd) )
		return x890066_UseSkillD( sceneId, selfId )

	end

end


--**********************************
--Ê¹ÓÃA¼¼ÄÜ....
--**********************************
function x890066_UseSkillA( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890066_SkillA, selfId, x, z, 0, 1 )
	return 1

end


--**********************************
--Ê¹ÓÃB¼¼ÄÜ....
--**********************************
function x890066_UseSkillB( sceneId, selfId )

	--¸±±¾ÖÐÓÐÐ§µÄÍæ¼ÒµÄÁÐ±í....
	local PlayerList = {}

	--½«ÓÐÐ§µÄ  nhân ¼Ó  nhân ÁÐ±í....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[i+1] = nHumanId
		end
	end

	--Ëæ»úÌôÑ¡Ò» cái Íæ¼Ò....
	local numPlayer = getn(PlayerList)
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--¶ÔÆäÊ¹ÓÃ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, PlayerId )
	LuaFnUnitUseSkill( sceneId, selfId, x890066_SkillB, PlayerId, x, z, 0, 1 )

	--¸øÆä¼Óbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, x890066_BuffB, 0 )

	return 1

end


--**********************************
--Ê¹ÓÃC¼¼ÄÜ....
--**********************************
function x890066_UseSkillC( sceneId, selfId )

	--»ñµÃµ±Ç°µÐ  nhân ....
	local enemyId = GetMonsterCurEnemy( sceneId, selfId )
	if enemyId <= 0 then
		return 0
	end
	if GetCharacterType( sceneId, enemyId ) == 3 then
		enemyId = GetPetCreator( sceneId, enemyId )
	end

	--ÔÚ¸ÃµÐ  nhân ½ÅÏÂ·Å cái ÏÝÚå....
	local x,z = GetWorldPos( sceneId, enemyId )
	CreateSpecialObjByDataIndex( sceneId, selfId, x890066_SpeObjC, x, z, 0 )

	--º°»°....
	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_17}" )

	--¶Ô×Ô¼ºÊ¹ÓÃÒ» cái Ö»ÓÐÌØÐ§µÄ¿Õ¼¼ÄÜ....
	x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890066_SkillC, selfId, x, z, 0, 1 )

	return 1

end


--**********************************
--Ê¹ÓÃD¼¼ÄÜ....
--**********************************
function x890066_UseSkillD( sceneId, selfId )

	--¸ø¸±±¾ÀïËùÓÐ  nhân ¼Óbuff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, nHumanId, x890066_BuffD, 0 )
		end
	end

end


--**********************************
--ÎÚÀÏTheo  ðßþc Íö¼ÆÊ±Æ÷OnTimer....
--ÓÃÓÚ¿ØÖÆ ðßþc ÍöºóÑÓ³ÙË¢³öÕ½°ÜÎÚÀÏTheo ....
--**********************************
function x890066_OnJiuMoZhiDieTimer( sceneId, step, posX, posY )

	if 1 == step then
		--´´½¨Õ½°ÜµÄÎÚÀÏTheo NPC....
	local MstId = LuaFnCreateMonster(sceneId, x890066_g_Npc_4.MonsterID, x890066_g_Npc_4.PosX, x890066_g_Npc_4.PosY, 3, 0, x890066_g_Npc_4.ScriptID )
	SetCharacterName( sceneId, MstId, x890066_g_Npc_4.Name )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )
	end

end

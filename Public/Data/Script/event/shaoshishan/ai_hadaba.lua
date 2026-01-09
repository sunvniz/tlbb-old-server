--Æ®Ãì·å ¹þTheo °ÔAI

--A ¡¾ÄÄÀï×ß¡¿¸ø×Ô¼ºÓÃÒ» cái ¿Õ¼¼ÄÜ....ËùÓÐ·ÇÉÙÁÖÍæ¼Ò¼Ó¶¨Éíbuff....
--B ¡¾ÐüÊàÖ®Í´¡¿¸ø×Ô¼º¼Ó²»ÄÜÒÆ¶¯Ë«±¶¹¥»÷buff....
--C ¡¾Æøº£Ö®Í´¡¿¸ø×Ô¼º¼ÓÊÜµ½ÉËº¦¼Ó±¶buff....
--D ¡¾Ë¿Öñ¿ÕÖ®Í´¡¿¸ø×Ô¼º¼Ó±»Íæ¼ÒÌôÐÆµÄbuff....
--E ¡¾·è¿ñ¡¿¸ø×Ô¼º¼ÓÒ»»÷ÖÂÃübuff....

--È«³Ì¶¼´øÓÐÃâÒßÖÆ¶¨¼¼ÄÜµÄbuff....
--20Ãëºó¿ªÊ¼Ê¹ÓÃA¼¼ÄÜ....ÀäÈ´20Ãë....
--25Ãëºó¿ªÊ¼Ñ­ l¥nÊÍ·ÅBCD¼¼ÄÜ....ÀäÈ´·Ö±ðÊÇ20..20..30....
--5 Phútºó½ø  nhân ¿ñ±©Ä£Ê½....Í£Ö¹Ê¹ÓÃABCD....Çå³ýABCDµÄbuff....Ê¹ÓÃE¼¼ÄÜ....

--Viet Translate by VTAngel (Suong Anh)
x890064_g_ScriptId	= 890064

--¸±±¾Âß¼­½Å±¾ºÅ....
x890064_g_FuBenScriptId = 890063

--buff....
x890064_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ð©¸ºÃæÐ§¹û....
x890064_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒþÉí....
x890064_Skill_A			=	596
x890064_Buff_A			= 6205
x890064_Skill_B			=	646
x890064_Buff_B			= 6096
x890064_Skill_C			=	601
x890064_Buff_C			= 18543
x890064_Skill_D			=	631
x890064_Buff_D			= 18314
x890064_Buff_E1			= 18324
x890064_Buff_E2			= 18324

--¼¼ÄÜÊÍ·ÅÊ±¼ä±í....
x890064_UseSkillList =
{
	{ 20,  "A" },
	{ 25,  "B" },
	{ 40,  "A" },
	{ 45,  "C" },
	{ 60,  "A" },
	{ 65,  "D" },
	{ 80,  "A" },
	{ 95,  "B" },
	{ 100, "A" },
	{ 115, "C" },
	{ 120, "A" },
	{ 135, "D" },
	{ 140, "A" },
	{ 160, "A" },
	{ 165, "B" },
	{ 180, "A" },
	{ 185, "C" },
	{ 200, "A" },
	{ 205, "D" },
	{ 220, "A" },
	{ 235, "B" },
	{ 240, "A" },
	{ 255, "C" },
	{ 260, "A" },
	{ 275, "D" },
	{ 280, "A" },
	{ 300, "E" }
}


--AI Index....
x890064_IDX_CombatTime		= 1	--½ø  nhân Õ½¶·µÄ¼ÆÊ±Æ÷....ÓÃÓÚ¼ÇÂ¼ÒÑ¾­½ø  nhân Õ½¶·¶à³¤Ê±¼äÁË....
x890064_IDX_UseSkillIndex	= 2	--½ÓÏÂÀ´¸ÃÊ¹ÓÃ¼¼ÄÜ±íÖÐµÄµÚ¼¸ cái ¼¼ÄÜ....

x890064_IDX_CombatFlag 			= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....
x890064_IDX_IsKuangBaoMode	= 2	--ÊÇ·ñ´¦ÓÚ¿ñ±©Ä£Ê½µÄ±êÖ¾....


--**********************************
--³õÊ¼»¯....
--**********************************
function x890064_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x890064_ResetMyAI( sceneId, selfId )
end


--**********************************
--ÐÄÌø....
--**********************************
function x890064_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇ ðßþc ÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890064_IDX_CombatFlag ) then
		return
	end

	--¿ñ±©×´Ì¬²»C¥n ×ßÂß¼­....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890064_IDX_IsKuangBaoMode ) then
		return
	end

	--==================================
	--¸ù¾Ý½ÚÄ¿µ¥ÊÍ·Å¼¼ÄÜ....
	--==================================

	--»ñµÃÕ½¶·Ê±¼äºÍÒÑ¾­Ö´ÐÐµ½¼¼ÄÜ±íÖÐµÄµÚ¼¸Ïî....
	local CombatTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890064_IDX_CombatTime )
	local NextSkillIndex = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890064_IDX_UseSkillIndex )
	--ÀÛ¼Ó½ø  nhân Õ½¶·µÄÊ±¼ä....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_CombatTime, CombatTime + nTick )

	--Èç¹ûÒÑ¾­Ö´ÐÐÍêÕûÕÅ¼¼ÄÜ±íÔò²»Ê¹ÓÃ¼¼ÄÜ....
	if NextSkillIndex < 1 or NextSkillIndex > getn( x890064_UseSkillList ) then
		return
	end

	--Èç¹ûÒÑ¾­µ½ÁËÓÃÕâ cái ¼¼ÄÜµÄÊ±¼äÔòÊ¹ÓÃ¼¼ÄÜ....
	local SkillData = x890064_UseSkillList[NextSkillIndex]
	if ( CombatTime + nTick ) >= SkillData[1]*1000 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_UseSkillIndex, NextSkillIndex+1 )
		x890064_UseMySkill( sceneId, selfId, SkillData[2] )
	end


end


--**********************************
--½ø  nhân Õ½¶·....
--**********************************
function x890064_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890064_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890064_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x890064_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½ø  nhân Õ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890064_IDX_CombatFlag, 1 )

end


--**********************************
--TÕm bi®tÕ½¶·....
--**********************************
function x890064_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x890064_ResetMyAI( sceneId, selfId )

	--É¾³ý×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨¶Ô»°NPC....
	local MstId = CallScriptFunction( x890064_g_FuBenScriptId, "CreateBOSS", sceneId, "JiuMoZhi_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--É± ðßþc µÐ  nhân ....
--**********************************
function x890064_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
-- ðßþc Íö....
--**********************************
function x890064_OnDie( sceneId, selfId, killerId )

	--ÖØÖÃAI....
	x890064_ResetMyAI( sceneId, selfId )

	--ÉèÖÃÒÑ¾­ÌôÕ½¹ý¹þTheo °Ô....
	CallScriptFunction( x890064_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "JiuMoZhi", 2 )

	--Èç¹û»¹Ã»ÓÐÌôÕ½¹ýÉ£ÍÁ¹«Ôò¿ÉÒÔÌôÕ½É£ÍÁ¹«....
	if 2 ~= CallScriptFunction( x890064_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ZhuangJuXian" ) then
		CallScriptFunction( x890064_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ZhuangJuXian", 1 )
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
		str = format("#{_INFOUSR%s} th¯ng lînh t± ðµi tÕi Thi¬u Th¤t S½n ðÕi chiªn #G Cßu Ma Trí #W toàn th¡ng. Tiªp tøc hß¾ng Thi¬u Th¤t S½n tiªn lên!", playerName); --¹þTheo °Ô
		AddGlobalCountNews( sceneId, str )
	end

end


--**********************************
--ÖØÖÃAI....
--**********************************
function x890064_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊý....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_CombatTime, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_UseSkillIndex, 1 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890064_IDX_IsKuangBaoMode, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890064_IDX_CombatFlag, 0 )

	--Çå³ýbuff....
	LuaFnCancelSpecificImpact( sceneId, selfId, x890064_Buff_B )
	LuaFnCancelSpecificImpact( sceneId, selfId, x890064_Buff_C )
	LuaFnCancelSpecificImpact( sceneId, selfId, x890064_Buff_D )
	LuaFnCancelSpecificImpact( sceneId, selfId, x890064_Buff_E1 )
	LuaFnCancelSpecificImpact( sceneId, selfId, x890064_Buff_E2 )

end


--**********************************
--BOSSÊ¹ÓÃ¼¼ÄÜ....
--**********************************
function x890064_UseMySkill( sceneId, selfId, skill )

	if skill == "A" then

		x890064_SkillA_NaLiZou( sceneId, selfId )

	elseif skill == "B" then

		MonsterTalk(sceneId, -1, "", "#{PMF_20080530_06}" )
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x890064_Skill_B, selfId, x, z, 0, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890064_Buff_B, 2000 )

	elseif skill == "C" then

		MonsterTalk(sceneId, -1, "", "#{PMF_20080530_07}" )
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x890064_Skill_C, selfId, x, z, 0, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890064_Buff_C, 0 )

	elseif skill == "D" then

		local enemyId = GetMonsterCurEnemy( sceneId, selfId )
		if enemyId > 0 then
			if GetCharacterType( sceneId, enemyId ) == 3 then
				enemyId = GetPetCreator( sceneId, enemyId )
			end
			MonsterTalk(sceneId, -1, "", "#{PMF_20080530_08}" )
			local x,z = GetWorldPos( sceneId, selfId )
			LuaFnUnitUseSkill( sceneId, selfId, x890064_Skill_D, selfId, x, z, 0, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, enemyId, selfId, x890064_Buff_D, 0 )
		end

	elseif skill == "E" then

		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890064_IDX_IsKuangBaoMode, 1 )
		x890064_SkillE_KuangBao( sceneId, selfId )

	end

end


--**********************************
--ÄÄÀï×ß¼¼ÄÜ....¶Ô·ÇÉÙÁÖÍæ¼Ò¼Óbuff....
--**********************************
function x890064_SkillA_NaLiZou( sceneId, selfId )

	MonsterTalk(sceneId, -1, "", "#{PMF_20080530_09}" )

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do

		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			if GetMenPai(sceneId,nHumanId) ~= MP_SHAOLIN then
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, nHumanId, x890064_Buff_A, 0 )
				local x,z = GetWorldPos( sceneId, selfId )
				LuaFnUnitUseSkill( sceneId, selfId, x890064_Skill_A, selfId, x, z, 0, 0 )
			end
		end

	end

end


--**********************************
--¿ñ±©¼¼ÄÜ....
--**********************************
function x890064_SkillE_KuangBao( sceneId, selfId )

	--È¡ÏûBCDµÄbuff....
	LuaFnCancelSpecificImpact( sceneId, selfId, x890064_Buff_B )
	LuaFnCancelSpecificImpact( sceneId, selfId, x890064_Buff_C )
	LuaFnCancelSpecificImpact( sceneId, selfId, x890064_Buff_D )

	--¼Ó¿ñ±©buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890064_Buff_E1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890064_Buff_E2, 0 )

end

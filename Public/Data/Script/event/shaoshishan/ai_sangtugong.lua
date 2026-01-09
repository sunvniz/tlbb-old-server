--Æ®Ãì·å É£ÍÁ¹«AI

--A ¡¾ÍÁ¶Ý¡¿BOSSµÄHPÃ¿ËðÊ§20%Ôò»áÏûÊ§20Ãë....Í¬Ê±´´½¨Ð¡¹ÖÒÀ´ÎÎª1122Ö».. ðßþc ÍöorÍÑÀëÕ½¶·ÏûÊ§....
--B ¡¾Å£Ã«¶¾Õë¡¿·ÇÍÁ¶Ý×´Ì¬Ê±Ã¿¸ô20Ò»´ÎTheo ·¶Î§¹¥»÷....ÍÁ¶Ý×´Ì¬ÏÂCDÕý³£×ßÖ»ÊÇ²»Ê¹ÓÃ....ÍÁ¶Ý½áÊøÊ±ÇåCD....
--C ¡¾³öÍÁÎÄÎï¡¿½ø  nhân ÍÁ¶ÝÊ±Ëæ»ú»ñµÃ2 cái buff....Í¬Ê±Çå³ýÉÏ´ÎµÄ2 cái buff....
--D ¡¾·è¿ñ¡¿Õ½¶·5 Phútºó¸ø×Ô¼ººÍËùÓÐ½©Ê¬¼ÓÒ»»÷ÖÂÃübuff....²»ÔÙÊ¹ÓÃAB(C)....

--È«³Ì¶¼´øÓÐÃâÒßÖÆ¶¨¼¼ÄÜµÄbuff....
--ÍÑÀëÕ½¶·»ò ðßþc ÍöÊ±É¾³ý½©Ê¬....


--Viet Translate by VTAngel (Suong Anh)
x890065_g_ScriptId	= 890065

--¸±±¾Âß¼­½Å±¾ºÅ....
x890065_g_FuBenScriptId = 890063


--ÃâÒßÌØ¶¨¼¼ÄÜbuff....
x890065_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ð©¸ºÃæÐ§¹û....
x890065_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒþÉí....

--AÍÁ¶Ý....
x890065_SkillA_TuDun				= 1028
x890065_SkillA_ChildName		= "Bång tàm"
x890065_SkillA_ChildBuff		= 10246
x890065_SkillA_ChildTime		= 5000		--ÍÁ¶Ý¶à³¤Ê±¼äºó¿ªÊ¼Ë¢Ð¡¹Ö....
x890065_SkillA_Time					= 20000		--ÍÁ¶Ý³ÖÐøµÄÊ±¼ä....


--BÅ£Ã«¶¾Õë....
x890065_SkillB_NiuMaoDuZhen = 751
--ÀäÈ´Ê±¼ä....
x890065_SkillB_CD						= 60000


--C³öÍÁÎÄÎï¼¼ÄÜµÄbuffÁÐ±í....
--x890065_SkillC_ChutuBuff1 = { 10237, 10238 }
--x890065_SkillC_ChutuBuff2 = { 10239, 10240, 10241, 10242 }

x890065_SkillC_ChutuBuff1 = { 6446, 6446 }
x890065_SkillC_ChutuBuff2 = { 6446, 6446, 6446, 6446 }

--D·è¿ñ....
x890065_SkillD_Buff1	= 10217
x890065_SkillD_Buff2	= 10217
--¿ªÊ¼½ø  nhân ¿ñ±©×´Ì¬µÄÊ±¼ä....
x890065_EnterKuangBaoTime	= 5*60*1000


--AI Index....
x890065_IDX_HPStep							= 1	--ÑªÁ¿ c¤p±ð....
x890065_IDX_SkillB_CD						= 2	--B¼¼ÄÜµÄCDÊ±¼ä....
x890065_IDX_KuangBaoTimer				= 3	--¿ñ±©µÄ¼ÆÊ±Æ÷....
x890065_IDX_TuDunTimer					= 4	--ÍÁ¶ÝµÄ¼ÆÊ±Æ÷....ÓÃÓÚ¼ÆËãºÎÊ±ÍÁ¶Ý½áÊø....
x890065_IDX_NeedCreateChildNum	= 5	--C¥n ´´½¨µÄÐ¡¹ÖµÄÊýÁ¿....

x890065_IDX_CombatFlag 			= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....
x890065_IDX_IsTudunMode			= 2	--ÊÇ·ñ´¦ÓÚÍÁ¶ÝÄ£Ê½µÄ±êÖ¾....
x890065_IDX_IsKuangBaoMode	= 3	--ÊÇ·ñ´¦ÓÚ¿ñ±©Ä£Ê½µÄ±êÖ¾....


--**********************************
--³õÊ¼»¯....
--**********************************
function x890065_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x890065_ResetMyAI( sceneId, selfId )
end


--**********************************
--ÐÄÌø....
--**********************************
function x890065_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇ ðßþc ÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890065_IDX_CombatFlag ) then
		return
	end

	--¿ñ±©×´Ì¬²»C¥n ×ßÂß¼­....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsKuangBaoMode ) then
		return
	end

	--Ö´ÐÐ¿ñ±©Âß¼­....
	if 1 == x890065_DoSkillD_KuangBao( sceneId, selfId, nTick ) then
		return
	end

	--Ö´ÐÐÍÁ¶ÝÂß¼­....
	if 1 == x890065_SkillLogicA_TunDun( sceneId, selfId, nTick ) then
		return
	end

	--Ö´ÐÐÅ£Ã«¶¾ÕëÂß¼­....
	if 1 == x890065_SkillLogicB_NiuMaoDuZhen( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--½ø  nhân Õ½¶·....
--**********************************
function x890065_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x890065_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½ø  nhân Õ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890065_IDX_CombatFlag, 1 )

end


--**********************************
--TÕm bi®tÕ½¶·....
--**********************************
function x890065_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x890065_ResetMyAI( sceneId, selfId )

	--É¾³ý×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨¶Ô»°NPC....
	local MstId = CallScriptFunction( x890065_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuangJuXian_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--É± ðßþc µÐ  nhân ....
--**********************************
function x890065_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
-- ðßþc Íö....
--**********************************
function x890065_OnDie( sceneId, selfId, killerId )

	--ÖØÖÃAI....
	x890065_ResetMyAI( sceneId, selfId )

	--ÉèÖÃÒÑ¾­ÌôÕ½¹ýÉ£ÍÁ¹«....
	CallScriptFunction( x890065_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ZhuangJuXian", 2 )

	--Èç¹û»¹Ã»ÓÐÌôÕ½¹ýÎÚÀÏTheo Ôò¿ÉÒÔÌôÕ½ÎÚÀÏTheo ....
	if 2 ~= CallScriptFunction( x890065_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "MuRongFu" )	then
		CallScriptFunction( x890065_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "MuRongFu", 1 )
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
		str = format("#Y Trang Tø Hi«n #W dã ð¬ ðáng b¤t trø #cFF0000#{_INFOUSR%s}#W công kích. B¸ ðä ð¡c lÕc hoa lßu thüy, chích ðào nhi khÑ, kim ngân tài bäo tán lÕc nh¤t ð¸a!", playerName); --É£ÍÁ¹«
		AddGlobalCountNews( sceneId, str )
	end
	
end


--**********************************
--ÖØÖÃAI....
--**********************************
function x890065_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊý....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_HPStep, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_SkillB_CD, x890065_SkillB_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_KuangBaoTimer, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_TuDunTimer, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_NeedCreateChildNum, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890065_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsTudunMode, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsKuangBaoMode, 0 )

	--Çå³ýbuff....
	for i, buffId in x890065_SkillC_ChutuBuff1 do
		LuaFnCancelSpecificImpact( sceneId, selfId, buffId )
	end

	for i, buffId in x890065_SkillC_ChutuBuff2 do
		LuaFnCancelSpecificImpact( sceneId, selfId, buffId )
	end

	LuaFnCancelSpecificImpact( sceneId, selfId, x890065_SkillD_Buff1 )
	LuaFnCancelSpecificImpact( sceneId, selfId, x890065_SkillD_Buff2 )

	--Çå³ýÐ¡¹Ö....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, MonsterId) == x890065_SkillA_ChildName then
			LuaFnDeleteMonster(sceneId, MonsterId)
		end
	end

end


--**********************************
--¿ñ±©¼¼ÄÜ....
--**********************************
function x890065_DoSkillD_KuangBao( sceneId, selfId )

	--¼Ó¿ñ±©buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_SkillD_Buff1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_SkillD_Buff2, 0 )

	--¸øËùÓÐÐ¡¹Ö¼Ó¿ñ±©....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, MonsterId) == x890065_SkillA_ChildName then
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890065_SkillD_Buff1, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890065_SkillD_Buff2, 0 )
		end
	end

end


--**********************************
--ÍÁ¶ÝÂß¼­....
--**********************************
function x890065_SkillLogicA_TunDun( sceneId, selfId, nTick )


	--ÍÁ¶ÝÄ£Ê½Ôò¸üÐÂÍÁ¶ÝµÄ¼ÆÊ±Æ÷....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsTudunMode ) then

		local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890065_IDX_TuDunTimer )
		if cd > nTick then

			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_TuDunTimer, cd-nTick )
			--Èç¹ûµ½ÁËË¢Ð¡¹ÖµÄÊ±¼ä²¢ÇÒ±¾´ÎÍÁ¶Ý»¹Ã»Ë¢¹ýÐ¡¹Ö....
			if cd < (x890065_SkillA_Time-x890065_SkillA_ChildTime) then
				local needCreateNum = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890065_IDX_NeedCreateChildNum )
				if needCreateNum > 0 then
					--´´½¨Ð¡¹Ö....
					MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_NeedCreateChildNum, 0 )
					local x,z = GetWorldPos( sceneId, selfId )
					for i=1, needCreateNum do
						local MstId = CallScriptFunction( x890065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x890065_SkillA_ChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x890065_SkillA_ChildName )
					end
				end
			end

		else

			--ÍÁ¶Ý½áÊø....ÉèÖÃTÕm bi®tÍÁ¶Ý×´Ì¬....
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_TuDunTimer, 0 )
			MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsTudunMode, 0 )
			--ÖØÖÃÅ£Ã«¶¾ÕëCD....
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_SkillB_CD, x890065_SkillB_CD )

		end


	--·ÇÍÁ¶ÝÄ£Ê½Ôò¼ì²âÊÇ·ñ¿ÉÒÔ½ø  nhân ÍÁ¶ÝÄ£Ê½....
	else


		--Ã¿¼õÉÙ20%ÑªÊ±½ø  nhân ÍÁ¶ÝÄ£Ê½....
		local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
		local LastStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890065_IDX_HPStep )
		local CurStep = -1
		if CurPercent <= 0.2 then
			CurStep = 4
		elseif CurPercent <= 0.4 then
		 	CurStep = 3
		elseif CurPercent <= 0.6 then
		 	CurStep = 2
		elseif CurPercent <= 0.8 then
			CurStep = 1
		end

		--½øÐÐÍÁ¶Ý....
		if CurStep > LastStep then
			--¸ø×Ô¼ºÉèÖÃÒþÉíand²»ÄÜ¹¥»÷....
			local x,z = GetWorldPos( sceneId, selfId )
			LuaFnUnitUseSkill( sceneId, selfId, x890065_SkillA_TuDun, selfId, x, z, 0, 1 )

			--Ëæ»ú»ñµÃ2 cái buff(³öÍÁÎÄÎï)....
			local idx1 = random( getn(x890065_SkillC_ChutuBuff1) )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_SkillC_ChutuBuff1[idx1], 0 )
			local idx2 = random( getn(x890065_SkillC_ChutuBuff2) )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_SkillC_ChutuBuff2[idx2], 0 )

			local NeedCreateNum = 1
			if CurStep == 3 or CurStep == 4 then
				NeedCreateNum = 2
			end

			MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsTudunMode, 1 )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_NeedCreateChildNum, NeedCreateNum )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_HPStep, CurStep )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_TuDunTimer, x890065_SkillA_Time )
			return 1
		end


	end

	return 0

end


--**********************************
--Å£Ã«¶¾ÕëÂß¼­....
--**********************************
function x890065_SkillLogicB_NiuMaoDuZhen( sceneId, selfId, nTick )

	--¸üÐÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890065_IDX_SkillB_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_SkillB_CD, cd-nTick )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_SkillB_CD, x890065_SkillB_CD-(nTick-cd) )
		--·ÇÍÁ¶Ý×´Ì¬²Å¿ÉÒÔÓÃ....
		if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsTudunMode ) then
			local x,z = GetWorldPos( sceneId, selfId )
			MonsterTalk( sceneId, -1, "", "#{PMF_20080530_16}" )
			LuaFnUnitUseSkill( sceneId, selfId, x890065_SkillB_NiuMaoDuZhen, selfId, x, z, 0, 0 )
			return 1
		end
	end

	return 0

end


--**********************************
--¿ñ±©Âß¼­....
--**********************************
function x890065_DoSkillD_KuangBao( sceneId, selfId, nTick )

	--¼ì²âÊÇ·ñµ½ÁË¿ñ±©µÄÊ±ºò....
	local kbTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890065_IDX_KuangBaoTimer )
	if kbTime < x890065_EnterKuangBaoTime then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_KuangBaoTimer, kbTime+nTick )

	else

		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsKuangBaoMode, 1 )
		--¼Ó¿ñ±©buff....
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_SkillD_Buff1, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_SkillD_Buff2, 0 )
		--¸øËùÓÐÐ¡¹Ö¼Ó¿ñ±©buff....
		local nMonsterNum = GetMonsterCount(sceneId)
		for i=0, nMonsterNum-1 do
			local MonsterId = GetMonsterObjID(sceneId,i)
			if GetName(sceneId, MonsterId) == x890065_SkillA_ChildName then
				LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890065_SkillD_Buff1, 0 )
				LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890065_SkillD_Buff2, 0 )
			end
		end
		return 1

	end


	return 0

end

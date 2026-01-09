--∆Æ√Ï∑Â …£Õ¡π´AI

--A °æÕ¡∂›°øBOSSµƒHP√øÀ ß20%‘Úª·œ˚ ß20√Î....Õ¨ ±¥¥Ω®–°π÷“¿¥ŒŒ™1122÷ª..À¿ÕˆorÕ—¿Î’Ω∂∑œ˚ ß....
--B °æ≈£√´∂æ’Î°ø∑«Õ¡∂›◊¥Ã¨ ±√ø∏Ù20“ª¥Œ¥Û∑∂Œßπ•ª˜....Õ¡∂›◊¥Ã¨œ¬CD’˝≥£◊ﬂ÷ª «≤ª π”√....Õ¡∂›Ω· ¯ ±«ÂCD....
--C °æ≥ˆÕ¡ŒƒŒÔ°øΩ¯»ÎÕ¡∂› ±ÀÊª˙ªÒµ√2∏ˆbuff....Õ¨ ±«Â≥˝…œ¥Œµƒ2∏ˆbuff....
--D °æ∑ËøÒ°ø’Ω∂∑5Ph˙t∫Û∏¯◊‘º∫∫ÕÀ˘”–Ω© ¨º”“ªª˜÷¬√¸buff....≤ª‘Ÿ π”√AB(C)....

--»´≥Ã∂º¥¯”–√‚“ﬂ÷∆∂®ººƒ‹µƒbuff....
--Õ—¿Î’Ω∂∑ªÚÀ¿Õˆ ±…æ≥˝Ω© ¨....


--Viet Translate by VTAngel (Suong Anh)
x890068_g_ScriptId	= 890068

--∏±±æ¬ﬂº≠Ω≈±æ∫≈....
x890068_g_FuBenScriptId = 890063


--√‚“ﬂÃÿ∂®ººƒ‹buff....
x890068_Buff_MianYi1	= 10472	--√‚“ﬂ“ª–©∏∫√Ê–ßπ˚....
x890068_Buff_MianYi2	= 10471	--√‚“ﬂ∆’Õ®“˛…Ì....

--AÕ¡∂›....
x890068_SkillID_H				= 1635
x890068_SkillA_TuDun				= 1028
x890068_MianYi_Buff				= 22431
x890068_SkillA_AChildName		= "±˘ƒ´ª¢"
x890068_SkillA_BChildName		= "ªƒ´ª¢"
x890068_SkillA_CChildName		= "∂æƒ´ª¢"
x890068_SkillA_DChildName		= "–˛ƒ´ª¢"
x890068_SkillA_AChildBuff		= 22422
x890068_SkillA_BChildBuff		= 22423
x890068_SkillA_CChildBuff		= 22424
x890068_SkillA_DChildBuff		= 22425

x890068_SkillA_ChildTime		= 5000		--Õ¡∂›∂‡≥§ ±º‰∫Ûø™ ºÀ¢–°π÷....
x890068_SkillA_Time					= 20000		--Õ¡∂›≥÷–¯µƒ ±º‰....


--B≈£√´∂æ’Î....
x890068_SkillB_NiuMaoDuZhen = 920
--¿‰»¥ ±º‰....
x890068_SkillB_CD						= 5000


--C≥ˆÕ¡ŒƒŒÔººƒ‹µƒbuff¡–±Ì....
x890068_SkillC_ChutuBuff1 = { 19624, 19624 }
x890068_SkillC_ChutuBuff2 = { 19624, 19624, 19624, 19624 }

x890068_BrotherName = "◊Øæ€œÕ"		--–÷µ‹µƒ√˚◊÷....

--D∑ËøÒ....
x890068_SkillD_Buff1	= 10234
x890068_SkillD_Buff2	= 10235
--ø™ ºΩ¯»ÎøÒ±©◊¥Ã¨µƒ ±º‰....
x890068_EnterKuangBaoTime	= 20*60*1000


--AI Index....
x890068_IDX_HPStep							= 1	--—™¡øº∂±....
x890068_IDX_SkillB_CD						= 2	--Bººƒ‹µƒCD ±º‰....
x890068_IDX_KuangBaoTimer				= 3	--øÒ±©µƒº∆ ±∆˜....
x890068_IDX_TuDunTimer					= 4	--Õ¡∂›µƒº∆ ±∆˜....”√”⁄º∆À„∫Œ ±Õ¡∂›Ω· ¯....
x890068_IDX_NeedCreateChildNum	= 5	--C•n cÛ ¥¥Ω®µƒ–°π÷µƒ ˝¡ø....

x890068_IDX_CombatFlag 			= 1	-- «∑Ò¥¶”⁄’Ω∂∑◊¥Ã¨µƒ±Í÷æ....
x890068_IDX_IsTudunMode			= 2	-- «∑Ò¥¶”⁄Õ¡∂›ƒ£ Ωµƒ±Í÷æ....
x890068_IDX_IsKuangBaoMode	= 3	-- «∑Ò¥¶”⁄øÒ±©ƒ£ Ωµƒ±Í÷æ....


--**********************************
--≥ı ºªØ....
--**********************************
function x890068_OnInit(sceneId, selfId)
	--÷ÿ÷√AI....
	x890068_ResetMyAI( sceneId, selfId )
end


--**********************************
--–ƒÃ¯....
--**********************************
function x890068_OnHeartBeat(sceneId, selfId, nTick)

	--ºÏ≤‚ «≤ª «À¿¡À....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--ºÏ≤‚ «∑Ò≤ª‘⁄’Ω∂∑◊¥Ã¨....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890068_IDX_CombatFlag ) then
		return
	end

	--øÒ±©◊¥Ã¨≤ªC•n cÛ ◊ﬂ¬ﬂº≠....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsKuangBaoMode ) then
		return
	end

	--÷¥––øÒ±©¬ﬂº≠....
	if 1 == x890068_DoSkillD_KuangBao( sceneId, selfId, nTick ) then
		return
	end

	--÷¥––Õ¡∂›¬ﬂº≠....
	if 1 == x890068_SkillLogicA_TunDun( sceneId, selfId, nTick ) then
		return
	end

	--÷¥––≈£√´∂æ’Î¬ﬂº≠....
	if 1 == x890068_SkillLogicB_NiuMaoDuZhen( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--Ω¯»Î’Ω∂∑....
--**********************************
function x890068_OnEnterCombat(sceneId, selfId, enmeyId)

	--º”≥ı ºbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_Buff_MianYi2, 0 )

	--÷ÿ÷√AI....
	x890068_ResetMyAI( sceneId, selfId )

	--…Ë÷√Ω¯»Î’Ω∂∑◊¥Ã¨....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_CombatFlag, 1 )

end


--**********************************
--¿Îø™’Ω∂∑....
--**********************************
function x890068_OnLeaveCombat(sceneId, selfId)

	--÷ÿ÷√AI....
	x890068_ResetMyAI( sceneId, selfId )

	--…æ≥˝◊‘º∫....
	LuaFnDeleteMonster( sceneId, selfId )

	--¥¥Ω®∂‘ª∞NPC....
	--local MstId = CallScriptFunction( x890068_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhangJuXian_NPC", -1, -1 )
	--SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--…±À¿µ–»À....
--**********************************
function x890068_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--À¿Õˆ....
--**********************************
function x890068_OnDie( sceneId, selfId, killerId )

	--±È¿˙≥°æ∞¿ÔÀ˘”–µƒπ÷....—∞’“–÷µ‹....∏¯∆‰…Ë÷√C•n cÛ  π”√øÒ±©ººƒ‹....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x890068_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, MonsterId, 19626, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, MonsterId, 19627, 0 )
		end
	end
	
end


--**********************************
--÷ÿ÷√AI....
--**********************************
function x890068_ResetMyAI( sceneId, selfId )

	--÷ÿ÷√≤Œ ˝....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_HPStep, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_SkillB_CD, x890068_SkillB_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_KuangBaoTimer, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_TuDunTimer, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_NeedCreateChildNum, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsTudunMode, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsKuangBaoMode, 0 )

	--«Â≥˝buff....
	for i, buffId in x890068_SkillC_ChutuBuff1 do
		LuaFnCancelSpecificImpact( sceneId, selfId, buffId )
	end

	for i, buffId in x890068_SkillC_ChutuBuff2 do
		LuaFnCancelSpecificImpact( sceneId, selfId, buffId )
	end

	LuaFnCancelSpecificImpact( sceneId, selfId, x890068_SkillD_Buff1 )
	LuaFnCancelSpecificImpact( sceneId, selfId, x890068_SkillD_Buff2 )

	--«Â≥˝–°π÷....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, MonsterId) == x890068_SkillA_AChildName or GetName(sceneId, MonsterId) == x890068_SkillA_BChildName or GetName(sceneId, MonsterId) == x890068_SkillA_CChildName or GetName(sceneId, MonsterId) == x890068_SkillA_DChildName then
			LuaFnDeleteMonster(sceneId, MonsterId)
		end
	end

end


--**********************************
--øÒ±©ººƒ‹....
--**********************************
function x890068_DoSkillD_KuangBao( sceneId, selfId )

	--º”øÒ±©buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_SkillD_Buff1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_SkillD_Buff2, 0 )

	--∏¯À˘”––°π÷º”øÒ±©....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, MonsterId) == x890068_SkillA_ChildName then
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890068_SkillD_Buff1, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890068_SkillD_Buff2, 0 )
		end
	end

end


--**********************************
--Õ¡∂›¬ﬂº≠....
--**********************************
function x890068_SkillLogicA_TunDun( sceneId, selfId, nTick )


	--Õ¡∂›ƒ£ Ω‘Ú∏¸–¬Õ¡∂›µƒº∆ ±∆˜....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsTudunMode ) then

		local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_TuDunTimer )
		if cd > nTick then

			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_TuDunTimer, cd-nTick )
			--»Áπ˚µΩ¡ÀÀ¢–°π÷µƒ ±º‰≤¢«“±æ¥ŒÕ¡∂›ªπ√ªÀ¢π˝–°π÷....
			if cd < (x890068_SkillA_Time-x890068_SkillA_ChildTime) then
				local needCreateNum = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_NeedCreateChildNum )
				if needCreateNum > 0 then
					--¥¥Ω®–°π÷....
					MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_NeedCreateChildNum, 0 )
					local x,z = GetWorldPos( sceneId, selfId )
					if needCreateNum == 1 then
						local MstId = CallScriptFunction( x890068_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x890068_SkillA_AChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x890068_SkillA_AChildName )
					end
				end
			end

		else

			--Õ¡∂›Ω· ¯....…Ë÷√¿Îø™Õ¡∂›◊¥Ã¨....
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_TuDunTimer, 0 )
			MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsTudunMode, 0 )
			--÷ÿ÷√≈£√´∂æ’ÎCD....
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_SkillB_CD, x890068_SkillB_CD )

		end


	--∑«Õ¡∂›ƒ£ Ω‘ÚºÏ≤‚ «∑Òø…“‘Ω¯»ÎÕ¡∂›ƒ£ Ω....
	else

		--√øºı…Ÿ20%—™ ±Ω¯»ÎÕ¡∂›ƒ£ Ω....
		local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
		local LastStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_HPStep )
		local CurStep = -1
		if CurPercent <= 0.6333 then
			CurStep = 1
		end

		--Ω¯––Õ¡∂›....
		if CurStep > LastStep then
			--∏¯◊‘º∫…Ë÷√≤œºÎ....
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19623, 0 )

			--ÀÊª˙ªÒµ√2∏ˆbuff(≥ˆÕ¡ŒƒŒÔ)....
			local idx1 = random( getn(x890068_SkillC_ChutuBuff1) )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_SkillC_ChutuBuff1[idx1], 0 )
			local idx2 = random( getn(x890068_SkillC_ChutuBuff2) )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_SkillC_ChutuBuff2[idx2], 0 )

			--local NeedCreateNum = 0
			--if CurStep == 1 then
				--NeedCreateNum = 1
			--end

			MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsTudunMode, 1 )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_NeedCreateChildNum, NeedCreateNum )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_HPStep, CurStep )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_TuDunTimer, x890068_SkillA_Time )
			return 1
		end


	end

	return 0

end


--**********************************
--≈£√´∂æ’Î¬ﬂº≠....
--**********************************
function x890068_SkillLogicB_NiuMaoDuZhen( sceneId, selfId, nTick )

	--∏¸–¬ººƒ‹CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_SkillB_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_SkillB_CD, cd-nTick )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_SkillB_CD, x890068_SkillB_CD-(nTick-cd) )
		--∑«Õ¡∂›◊¥Ã¨≤≈ø…“‘”√....
		if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsTudunMode ) then
			local x,z = GetWorldPos( sceneId, selfId )
			CallScriptFunction((200060), "Paopao",sceneId, "±˘≤œ", "…Ÿ “…Ω", "≥¢≥¢Œ“µƒ±˘≤œ∂æ’∆£°" )
			MonsterTalk( sceneId, -1, "", "±˘≤œ∂æ’∆”µ”–∂æ±¨◊¥Ã¨–ßπ˚£¨±¨’®∫Û∂‘∂””—‘Ï≥…¥Û¡ø…À∫¶£°£°" )
			LuaFnUnitUseSkill( sceneId, selfId, x890068_SkillB_NiuMaoDuZhen, selfId, x, z, 0, 0 )
			return 1
		end
	end

	return 0

end


--**********************************
--øÒ±©¬ﬂº≠....
--**********************************
function x890068_DoSkillD_KuangBao( sceneId, selfId, nTick )

	--ºÏ≤‚ «∑ÒµΩ¡ÀøÒ±©µƒ ±∫Ú....
	local kbTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_KuangBaoTimer )
	if kbTime < x890068_EnterKuangBaoTime then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_KuangBaoTimer, kbTime+nTick )

	else

		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsKuangBaoMode, 1 )
		--º”øÒ±©buff....
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_SkillD_Buff1, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_SkillD_Buff2, 0 )
		--∏¯À˘”––°π÷º”øÒ±©buff....
		local nMonsterNum = GetMonsterCount(sceneId)
		for i=0, nMonsterNum-1 do
			local MonsterId = GetMonsterObjID(sceneId,i)
			if GetName(sceneId, MonsterId) == x890068_SkillA_AChildName or GetName(sceneId, MonsterId) == x890068_SkillA_BChildName or GetName(sceneId, MonsterId) == x890068_SkillA_CChildName or GetName(sceneId, MonsterId) == x890068_SkillA_DChildName then
				LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890068_SkillD_Buff1, 0 )
				LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890068_SkillD_Buff2, 0 )
			end
		end
		return 1

	end


	return 0

end


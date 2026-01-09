--½Å±¾ºÅ
x895092_g_ScriptId	= 895092

--¸±±¾Âß¼­½Å±¾ºÅ....
x895092_g_FuBenScriptId = 895063

x895092_MyName			= "Da Lu§t Liên Thành - Thiªt C¯t"	--×Ô¼ºµÄÃû×Ö....
x895092_BrotherName			= "Da Lu§t Liên Thành"	--×Ô¼ºµÄÃû×Ö....

--ÃâÒßBuff....
x895092_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ğ©¸ºÃæĞ§¹û....
x895092_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒşÉí....

--D¼¼ÄÜ....
x895092_BuffD				= 19801	--¼òµ¥°æçÎç¿·åÊ¹ÓÃÉËº¦½µµÍÁËµÄ°æ±¾....
x895092_SkillD_CD		= 5000

--AI Index....
x895092_IDX_CD_SkillD			= 1	--D¼¼ÄÜµÄCD....

x895092_IDX_CombatFlag 		= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....


--**********************************
--³õÊ¼»¯....
--**********************************
function x895092_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x895092_ResetMyAI( sceneId, selfId )

end


--**********************************
--ĞÄÌø....
--**********************************
function x895092_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x895092_IDX_CombatFlag ) then
		return
	end

	--D¼¼ÄÜĞÄÌø....
	if 1 == x895092_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x895092_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x895092_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x895092_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x895092_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x895092_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x895092_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x895092_ResetMyAI( sceneId, selfId )

	--É¾³ı×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--É±ËÀµĞÈË....
--**********************************
function x895092_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀÍö....
--**********************************
function x895092_OnDie( sceneId, selfId, killerId )

	--ÖØÖÃAI....
	x895092_ResetMyAI( sceneId, selfId )

	--É¾³ı×Ô¼º....
	SetCharacterDieTime( sceneId, selfId, 3000 )

	--±éÀú³¡¾°ÀïËùÓĞµÄ¹Ö....Ñ°ÕÒĞÖµÜ....¸øÆäÉèÖÃĞèÒªÊ¹ÓÃ¿ñ±©¼¼ÄÜ....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x895092_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, 19454, 0 )
		end
	end

	CallScriptFunction((200060), "Paopao",sceneId, "Da Lu§t Liên Thành", "Binh thánh kÏ tr§n", "Da Lu§t Liên Thành: nguyên th¥n, thiªt c¯t ch¦m hµi b¸ phá, nan ğÕo th¸ thiên døc thü ngô m®nh? !" )
	CallScriptFunction( x895092_g_FuBenScriptId, "TipAllHuman", sceneId, "Tr¥n Dûng Nhân nói:  Do vu c§p thì tß½ng phân thân sÕn tr×, da lu§t liên thành dî nguyên khí ğÕi thß½ng, thØ thì b¤t công canh ğãi hà thì." )

end


--**********************************
--ÖØÖÃAI....
--**********************************
function x895092_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊı....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x895092_IDX_CD_SkillD, x895092_SkillD_CD )

end


--**********************************
--ABC¼¼ÄÜĞÄÌø....
--**********************************
function x895092_TickSkillABC( sceneId, selfId, nTick )

end


--**********************************
--D¼¼ÄÜĞÄÌø....
--**********************************
function x895092_TickSkillD( sceneId, selfId, nTick )

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x895092_IDX_CD_SkillD )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895092_IDX_CD_SkillD, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x895092_IDX_CD_SkillD, x895092_SkillD_CD-(nTick-cd) )
		return x895092_UseSkillD( sceneId, selfId )

	end

end


--**********************************
--Ê¹ÓÃD¼¼ÄÜ....
--**********************************
function x895092_UseSkillD( sceneId, selfId )

	--±éÀú³¡¾°ÀïËùÓĞµÄ¹Ö....Ñ°ÕÒĞÖµÜ....¸øÆäÉèÖÃĞèÒªÊ¹ÓÃ¿ñ±©¼¼ÄÜ....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x895092_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, 19453, 0 )
		end
	end

end

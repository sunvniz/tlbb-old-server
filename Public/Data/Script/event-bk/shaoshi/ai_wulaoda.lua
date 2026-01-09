--Æ®Ãì·å ²»Æ½µÀÈËAI

--F	¡¾°µÀ×¡¿¶Ô×Ô¼ºÓÃÒ»¸ö¿Õ¼¼ÄÜ....ÔÙ¸øÍæ¼Ò¼Ó¸ö½áÊøºó»á»Øµ÷½Å±¾µÄbuff....»Øµ÷Ê±ÈÃBOSS¸øÆäÖÜÎ§ÈË¼ÓÉËº®buff²¢º°»°....
--G ¡¾¾«Ëã¡¿¸ø×Ô¼ºÓÃÒ»¸ö¼ÓbuffµÄ¼¼ÄÜ....
--H ¡¾ÑÌ»¨¡¿¶Ô×Ô¼ºÓÃÒ»¸ö¿Õ¼¼ÄÜ....ÔÙ¸øÍæ¼Ò¼Ó¸ö½áÊøºó»á»Øµ÷½Å±¾µÄbuff....»Øµ÷Ê±º°»°....
--I	¡¾ÅóÓÑ¡¿×¿²»·²ËÀÊ±¸ø×Ô¼ºÓÃÒ»¸ö¼ÓbuffµÄ¼¼ÄÜ....


--È«³Ì¶¼´øÓĞÃâÒßÖÆ¶¨¼¼ÄÜµÄbuff....
--Ã¿¸ô30Ãë¶ÔËæ»úÍæ¼ÒËæ»úÊ¹ÓÃFH....
--Ã¿¸ô45Ãë¶Ô×Ô¼ºÊ¹ÓÃG....
--ËÀÍö»òÍÑÀëÕ½¶·Ê±¸øËùÓĞÍæ¼ÒÇå³ıFHµÄbuff....
--ËÀÍöÊ±Ñ°ÕÒ²»Æ½µÀÈË....ÉèÖÃÆäC¥n có Ê¹ÓÃ¿ñ±©¼¼ÄÜ....
--ËÀÍöÊ±·¢ÏÖ²»Æ½µÀÈËÒÑ¾­ËÀÁË....Ôò´´½¨ÁíÒ»¸öBOSS....


--Viet Translate by VTAngel (Suong Anh)
x890066_g_ScriptId	= 890066

--¸±±¾Âß¼­½Å±¾ºÅ....
x890066_g_FuBenScriptId = 890063

--ÃâÒßBuff....
x890066_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ğ©¸ºÃæĞ§¹û....
x890066_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒşÉí....

--¼¼ÄÜ....
x890066_SkillID_F		= 904
x890066_BuffID_F1		= 19636

x890066_SkillID_G		= 903
x890066_SkillID_G_SpecObj		= 1022

x890066_SkillID_H		= 905
x890066_SkillID_J		= 909
x890066_BuffID_H		= 19629

x890066_SkillID_I		= 1036
x890066_BuffID_I1		= 10253
x890066_BuffID_I2		= 10254

x890066_SkillCD_FH	=	10000
x890066_SkillCD_G		=	6000
x890066_SkillCD_H	=	20000


x890066_MyName			= "Ä½Èİ¸´"	--×Ô¼ºµÄÃû×Ö....

--AI Index....
x890066_IDX_KuangBaoMode	= 1	--¿ñ±©Ä£Ê½....0Î´¿ñ±© 1C¥n có ½øÈë¿ñ±© 2ÒÑ¾­½øÈë¿ñ±©
x890066_IDX_CD_SkillFH		= 2	--FH¼¼ÄÜµÄCD....
x890066_IDX_CD_SkillG			= 3	--G¼¼ÄÜµÄCD....
x890066_IDX_CD_Talk				= 4	--FH¼¼ÄÜº°»°µÄCD....
x890066_IDX_CD_SkillH			= 5	--G¼¼ÄÜµÄCD....

x890066_IDX_CombatFlag 		= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....

x890066_LootItem_1 = {
10512124, 10512125, 10512126, 10512127, 
}

x890066_LootItem_2 = {
30302527, 30302528, 30302529, 30302530, 30302531, 30302532, 
}
--**********************************
--³õÊ¼»¯....
--**********************************
function x890066_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x890066_ResetMyAI( sceneId, selfId )
end


--**********************************
--ĞÄÌø....
--**********************************
function x890066_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890066_IDX_CombatFlag ) then
		return
	end

	--FH¼¼ÄÜĞÄÌø....
	if 1 == x890066_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

	--G¼¼ÄÜĞÄÌø....
	if 1 == x890066_TickSkillG( sceneId, selfId, nTick ) then
		return
	end

	--H¼¼ÄÜĞÄÌø....
	if 1 == x890066_TickSkillH( sceneId, selfId, nTick ) then
		return
	end

	--I¼¼ÄÜĞÄÌø....
	if 1 == x890066_TickSkillI( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x890066_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890066_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890066_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x890066_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890066_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x890066_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x890066_ResetMyAI( sceneId, selfId )

	--É¾³ı×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨¶Ô»°NPC....
	local MstId = CallScriptFunction( x890066_g_FuBenScriptId, "CreateBOSS", sceneId, "MuRongFu_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )
end


--**********************************
--É±ËÀµĞÈË....
--**********************************
function x890066_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀÍö....
--**********************************
function x890066_OnDie( sceneId, selfId, killerId )

	--ÖØÖÃAI....
	x890066_ResetMyAI( sceneId, selfId )

	--É¾³ı×Ô¼º....
	SetCharacterDieTime( sceneId, selfId, 3000 )

	--¿ªÆôÎÚÀÏ´óËÀÍöµÄ¼ÆÊ±Æ÷....
	--local x,z = GetWorldPos( sceneId, selfId )
	--CallScriptFunction( x890066_g_FuBenScriptId, "OpenMuRongFuDieTimer", sceneId, 4, x890066_g_ScriptId, x, z )

	--ÉèÖÃÒÑ¾­ÌôÕ½¹ıÎÚÀÏ´ó....
	CallScriptFunction( x890066_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "MuRongFu", 2 )

	--Èç¹û»¹Ã»ÓĞÌôÕ½¹ıË«×ÓÔò¿ÉÒÔÌôÕ½Ë«×Ó....
	if 2 ~= CallScriptFunction( x890066_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "DingChunQiu" )	then
		CallScriptFunction( x890066_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "DingChunQiu", 1 )
	end
	
	-- zchw È«Çò¹«¸æ
	local	playerName	= GetName( sceneId, killerId )
	
	--É±ËÀ¹ÖÎïµÄÊÇ³èÎïÔò»ñÈ¡ÆäÖ÷ÈËµÄÃû×Ö....
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
		str = format("ÉÙÊÒÉ½#YÄ½Èİ¸´#W£º¿È, ¿È, ¿È£¬ËäÈ»ÎÒ´óÑàĞË¸´ÎŞÍû£¬#cFF0000µ«ÊÇ#cFF0000#{_INFOUSR%s}#WÄãÒ²²»ÒªµÃÒâ£¬ÆäËûµÄĞÖµÜ»áÎªÎÒ±¨³ğµÄ£¡", playerName); --ÎÚÀÏ´ó
		AddGlobalCountNews( sceneId, str )
	end

	--È¡µÃµ±Ç°³¡¾°ÀïµÄÈËÊı
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	
	for i = 0, num - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	for i = 0, num - 1 do
		if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then					-- ²»ÔÚ³¡¾°µÄ²»×ö´Ë²Ù×÷

			AddMonsterDropItem( sceneId, selfId, mems[i], 39910001 )

			rand = random(100)
			if rand < 60 then
				AddMonsterDropItem( sceneId, selfId, mems[i], 30505806 )
			end

			rand = random(100)
			if rand < 50 then
				AddMonsterDropItem( sceneId, selfId, mems[i], 30505252 )
			end

			rand = random(100)
			if rand < 50 then
				AddMonsterDropItem( sceneId, selfId, mems[i], 39910001 )
			end

			rand = random(100)
			if rand < 40 then
				local WuPin = random( getn(x890066_LootItem_1) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x890066_LootItem_1[WuPin] )

			end

			rand = random(100)
			if rand < 40 then
				AddMonsterDropItem( sceneId, selfId, mems[i], 39910050 )
			end

			rand = random(100)
			if rand < 10 then
				local WuPin = random( getn(x890066_LootItem_2) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x890066_LootItem_2[WuPin]  )
			end

		end
	end

end


--**********************************
--ÖØÖÃAI....
--**********************************
function x890066_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊı....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillFH, x890066_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillG, x890066_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillH, x890066_SkillCD_H )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890066_IDX_CombatFlag, 0 )

	--¸øËùÓĞÍæ¼ÒÇå³ıFHµÄbuff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x890066_BuffID_F1 )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x890066_BuffID_H )
		end
	end

end


--**********************************
--FH¼¼ÄÜĞÄÌø....
--**********************************
function x890066_TickSkillFH( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent <= 0.3333 or CurPercent > 0.6333 then
		return 0
	end

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillFH, cd-nTick )
		return 0

	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillFH, x890066_SkillCD_FH-(nTick-cd) )
		return x890066_UseSkillF( sceneId, selfId )
	end

end


--**********************************
--G¼¼ÄÜĞÄÌø....
--**********************************
function x890066_TickSkillG( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent <= 0.6666 then
		return 0
	end

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillG, x890066_SkillCD_G-(nTick-cd) )
		return x890066_UseSkillG( sceneId, selfId )
	end

end

--**********************************
--H¼¼ÄÜĞÄÌø....
--**********************************
function x890066_TickSkillH( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	if CurPercent > 0.3333 then
		return 0
	end

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillH )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillH, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_CD_SkillH, x890066_SkillCD_H-(nTick-cd) )
		return x890066_UseSkillH( sceneId, selfId )
	end

end

--**********************************
--I¼¼ÄÜĞÄÌø....
--**********************************
function x890066_TickSkillI( sceneId, selfId, nTick )

	--»ñµÃµ±Ç°¿ñ±©mode....
	local CurMode = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890066_IDX_KuangBaoMode )

	if CurMode == 0 or CurMode == 2 then

		--Èç¹û²»C¥n có ¿ñ±©»òÕßÒÑ¾­¿ñ±©ÁËÔò·µ»Ø....
		return 0

	elseif CurMode == 1 then

		--Èç¹ûC¥n có ¿ñ±©ÔòÊ¹ÓÃ¿ñ±©¼¼ÄÜ....
		local ret =  x890066_UseSkillI( sceneId, selfId )
		if ret == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890066_IDX_KuangBaoMode, 2 )
			return 1
		else
			return 0
		end

	end

end


--**********************************
--Ê¹ÓÃF¼¼ÄÜ....
--**********************************
function x890066_UseSkillF( sceneId, selfId )

	--¸±±¾ÖĞÓĞĞ§µÄÍæ¼ÒµÄÁĞ±í....
	local PlayerList = {}

	--½«ÓĞĞ§µÄÈË¼ÓÈëÁĞ±í....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--Ëæ»úÌôÑ¡Ò»¸öÍæ¼Ò....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--¶ÔÆäÊ¹ÓÃ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, PlayerId )
	LuaFnUnitUseSkill( sceneId, selfId, x890066_SkillID_F, PlayerId, x, z, 0, 1 )
	CallScriptFunction((200060), "Paopao",sceneId, "Ä½Èİ¸´", "ÉÙÊÒÉ½", "Ä½Èİ¸´£ººß£¬²»ÏëÄãÃÇÍ¬°éËÀµÄºÜ²Ò¾Í¾¡Çé·ÅÂí¹ıÀ´°É£¬±¾ÈË¾ø²»»¹ÊÖ£¡´ËºóÄªËµ±¾¹«×ÓÊÑÇ¿ÁèÈõ£¡" )
	MonsterTalk( sceneId, -1, "", "Çë×¢Òâ¹¥»÷Ç¿¶È£¬Ä½Èİ¸´»á½«ËùÓĞÉËº¦×ª¼Ş¸ø"..GetName( sceneId, PlayerId ).."£¬ËùÓĞÈËµÄ¹¥»÷¶¼»áÉËº¦Ëû£¡" )

	--¸øÍæ¼Ò¼Ó½áÊøºó»Øµ÷½Å±¾µÄbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x890066_BuffID_F1, 0 )

	return 1

end


--**********************************
--Ê¹ÓÃG¼¼ÄÜ....
--**********************************
function x890066_UseSkillG( sceneId, selfId )


	--¸±±¾ÖĞÓĞĞ§µÄÍæ¼ÒµÄÁĞ±í....
	local PlayerList = {}

	--½«ÓĞĞ§µÄÈË¼ÓÈëÁĞ±í....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--Ëæ»úÌôÑ¡Ò»¸öÍæ¼Ò....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890066_SkillID_G, selfId, x, z, 0, 1 )

	--ÔÚ¸ÃÍæ¼Ò½Åµ×ÏÂ·ÅÏİÚå....
	x,z = GetWorldPos( sceneId, PlayerId )
	CreateSpecialObjByDataIndex(sceneId, selfId, x890066_SkillID_G_SpecObj, x, z, 0)

	CallScriptFunction((200060), "Paopao",sceneId, "Ä½Èİ¸´", "ÉÙÊÒÉ½", "Ä½Èİ¸´£ºÎÒÄ½ÈİÊÀ¼ÒÎäÑ§Ô¨Ô´£¬´òÄãÃÇ¸ù±¾ÎŞĞèÎÒ¶¯ÓÃ×Ô¼Ò¾ø¼¼£¡" )
	return 1

end


--**********************************
--Ê¹ÓÃH¼¼ÄÜ....
--**********************************
function x890066_UseSkillH( sceneId, selfId )

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x890066_SkillID_H, selfId, x, z, 0, 1 )
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x890066_SkillID_J, selfId, x, z, 0, 1 )

		MonsterTalk( sceneId, -1, "", "Çë×¢Òâ¹¥»÷Ç¿¶È£¬Ä½Èİ¸´»á½«ËùÓĞÈËµÄÉËº¦·´µ¯£¡£¡" )
		CallScriptFunction((200060), "Paopao",sceneId, "Ä½Èİ¸´", "ÉÙÊÒÉ½", "¿´À´ÎÒ»¹ÓĞĞ©µÍ¹ÀÄãÃÇÁË£¬ÈÃÄãÃÇ¿´ÏÂÄ½Èİ¼ÒµÄ¾ø¼¼ÒÔ±ËÖ®µÀ»¹Ê©±ËÉí£¡£¡" )

		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1 do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
				x,z = GetWorldPos( sceneId, nHumanId )
				LuaFnSendSpecificImpactToUnit( sceneId, nHumanId, nHumanId, nHumanId, x890066_BuffID_H, 0 )
			end
		end

	return 1

end


--**********************************
--Ê¹ÓÃI¼¼ÄÜ....
--**********************************
function x890066_UseSkillI( sceneId, selfId )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890066_BuffID_I1, 5000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890066_BuffID_I2, 5000 )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890066_SkillID_I, selfId, x, z, 0, 1 )

	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_02}" )

	return 1

end


--**********************************
--°µÀ×ºÍÑÌ»¨µÄbuff½áÊøµÄÊ±ºò»Øµ÷±¾½Ó¿Ú....
--**********************************
function x890066_OnImpactFadeOut( sceneId, selfId, impactId )

	--Ñ°ÕÒBOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x890066_MyName == GetName( sceneId, MonsterId ) then
			bossId = MonsterId
		end
	end

	--Ã»ÕÒµ½Ôò·µ»Ø....
	if bossId == -1 then
		return
	end

	--Èç¹ûÊÇÑÌ»¨µÄbuffÔòÈÃBOSSº°»°....
	if impactId == 19629 then
		local PlayNowHp = GetHp( sceneId, selfId )
		local LastHp = CallScriptFunction( x890066_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "PlayHp" )
		if LastHp > PlayNowHp then
			local nMonsterNum = GetMonsterCount( sceneId )
			for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId, i)
				if GetName(sceneId, MonsterId) == "Ä½Èİ¸´" and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
				   LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 19630, 0)
		              end
	              end
              end

		CallScriptFunction( x890066_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "PlayHp", PlayNowHp )

		return
	end

end

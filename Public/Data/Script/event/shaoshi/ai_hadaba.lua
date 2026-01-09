--Æ®Ãì·å ÀîÇïË®AI

--A ¡¾Ğ¡ÎŞÏà¹¦¡¿¸ø×Ô¼ºÓÃ¸ö¿Õ¼¼ÄÜ....ÔÙ¸øËæ»ú¸øÒ»¸öÍæ¼ÒÊ§Ã÷....
--B ¡¾½£Îè¡¿¸ø×Ô¼ºÓÃÒ»¸ö¿Õ¼¼ÄÜ....½ÓÏÂÀ´15sÄÚÒÀ´Î¸øÈ«¸±±¾Íæ¼Ò¼ÓÉËº¦ÖµÖğ½¥¼Ó´óµÄÉËº¦buff....
--C ¡¾È÷ÍÑ¡¿¸ø×Ô¼ºÓÃÒ»¸öÇåbuffµÄ¼¼ÄÜ....
--D ¡¾±ù±¬¡¿¸ø×Ô¼ºÓÃ¸ö¿Õ¼¼ÄÜ....ÔÙ¸øËæ»ú¸øÍæ¼Ò½ÅÏÂ·Å¸öÏİÚå....
--E ¡¾¿ñ±©¡¿¸ø×Ô¼º¼Ó·è¿ñµÄbuff....²»ÔÙÊ¹ÓÃÆäËû¼¼ÄÜ....

--È«³Ì¶¼´øÓĞÃâÒßÖÆ¶¨¼¼ÄÜµÄbuff....
--Õ½¶·¿ªÊ¼Í¬Ê±Ã¿¸ô10ÃëÓÃA¼¼ÄÜ....
--µ±HP½µÎª66%ºÍ33%Ê±·Ö±ğÊ¹ÓÃB¼¼ÄÜ....B¼¼ÄÜµÄ³ÖĞøÊ±¼äÄÚ....ÆäËü¼¼ÄÜCDµ½ÁË²»Ê¹ÓÃ....
--Ã¿¸ô20ÃëÓÃC¼¼ÄÜ....
--Ã¿¸ô20ÃëÓÃD¼¼ÄÜ....


--Viet Translate by VTAngel (Suong Anh)
x890064_g_ScriptId	= 890064

--¸±±¾Âß¼­½Å±¾ºÅ....
x890064_g_FuBenScriptId = 890063


--ÃâÒßÌØ¶¨¼¼ÄÜbuff....
x890064_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ğ©¸ºÃæĞ§¹û....
x890064_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒşÉí....

--AÉñÀ´Ö®±Ê....
x890064_SkillA_ID			= 902
x890064_SkillA_Buff		=	19615
x890064_SkillA_CD			= 15000

--B½£Îè....
x890064_SkillB_SkillIDTbl = { 1043, 1044, 1045, 1046, 1047, 1048 }
x890064_SkillB_WeatherTbl = { 11, 12, 13, 14, 15, 16 }
x890064_SkillB_TalkTbl =
{
	"#{PMF_20080530_10}",
	"#{PMF_20080530_11}",
	"#{PMF_20080530_12}",
	"#{PMF_20080530_13}",
	"#{PMF_20080530_14}",
	"#{PMF_20080530_15}"
}

x890064_SkillB_Text =
{
	"#{SSSTS_80917_5}",
	"#{SSSTS_80917_3}",
	"#{SSSTS_80917_6}",
	"#{SSSTS_80917_1}",
	"#{SSSTS_80917_2}",
	"#{SSSTS_80917_4}"
}

x890064_SkillB_BuffIDTbl =
{
	[1] = {10280,10281,10282,10283,10284,10285,10286,10287,10288,10289,10290,10291,10292,10293,10294},
	[2] = {10295,10296,10297,10298,10299,10300,10301,10302,10303,10304,10305,10306,10307,10308,10309},
	[3] = {10310,10311,10312,10313,10314,10315,10316,10317,10318,10319,10320,10321,10322,10323,10324},
	[4] = {10325,10326,10327,10328,10329,10330,10331,10332,10333,10334,10335,10336,10337,10338,10339},
	[5] = {10340,10341,10342,10343,10344,10345,10346,10347,10348,10349,10350,10351,10352,10353,10354},
	[6] = {10355,10356,10357,10358,10359,10360,10361,10362,10363,10364,10365,10366,10367,10368,10369}
}

--CÈ÷ÍÑ....
x890064_SkillC_ID		= 902
x890064_SkillC_CD		= 45000

--D±ù±¬....
x890064_SkillD_ID		= 901
x890064_SkillD_CD		= 30000
x890064_SkillD_SpecObj = 1021

--E¿ñ±©....
x890064_SkillE_ID			= 1626
x890064_SkillE_Buff		=	22214
x890064_SkillE_CD			= 10000
x890064_SkillE_Buff1	= 10234
x890064_SkillE_Buff2	= 10235
--¿ªÊ¼½øÈë¿ñ±©×´Ì¬µÄÊ±¼ä....
x890064_EnterKuangBaoTime	= 10*60*1000

--Ğ¡¹ÖÅÜ
x890064_g_DogfacePos = {
	{ 128, 151, 0, 14269 }, { 131, 151, 1, 14269 }, { 118, 151, 2, 14269 }, 
       { 141, 151, 3, 14269 }
}

x890064_g_DogfaceGroup = 0					-- ÌÓÅÜĞ¡±øµÄ Group ID

--AI Index....
x890064_IDX_StopWatch						= 1	--Ãë±í....
x890064_IDX_SkillA_CD						= 2	--A¼¼ÄÜµÄCDÊ±¼ä....
x890064_IDX_SkillB_HPStep				= 3	--ÑªÁ¿¼¶±ğ....
x890064_IDX_SkillB_Step					= 4	--B¼¼ÄÜµÄStep....0=Î´·¢¶¯ 15=buff1 14=buff2 ¡­¡­ 1=buff15
x890064_IDX_SkillB_Type					= 5	--µ±Ç°ÕıÔÚÊ¹ÓÃÄÄÖÖÀàĞÍµÄ½£Îè....
x890064_IDX_SkillC_CD						= 6	--C¼¼ÄÜµÄCDÊ±¼ä....
x890064_IDX_SkillD_CD						= 7	--C¼¼ÄÜµÄCDÊ±¼ä....
x890064_IDX_KuangBaoTimer				= 8	--¿ñ±©µÄ¼ÆÊ±Æ÷....


x890064_IDX_CombatFlag 			= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....
x890064_IDX_IsKuangBaoMode	= 2	--ÊÇ·ñ´¦ÓÚ¿ñ±©Ä£Ê½µÄ±êÖ¾....

x890064_LootItem_1 = {
10510124, 10510125, 10510126, 10510127, 
}

x890064_LootItem_2 = {
30302527, 30302528, 30302529, 30302530, 30302531, 30302532, 
}

--**********************************
--³õÊ¼»¯....
--**********************************
function x890064_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x890064_ResetMyAI( sceneId, selfId )
end


--**********************************
--ĞÄÌø....
--**********************************
function x890064_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890064_IDX_CombatFlag ) then
		return
	end

	--¿ñ±©×´Ì¬²»C¥n có ×ßÂß¼­....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890064_IDX_IsKuangBaoMode ) then
		return
	end

	--A¼¼ÄÜĞÄÌø....
	if 1 == x890064_TickSkillA( sceneId, selfId, nTick ) then
		return
	end

	--B¼¼ÄÜĞÄÌø....
	if 1 == x890064_TickSkillB( sceneId, selfId, nTick ) then
		return
	end

	--C¼¼ÄÜĞÄÌø....
	if 1 == x890064_TickSkillC( sceneId, selfId, nTick ) then
		return
	end

	--D¼¼ÄÜĞÄÌø....
	if 1 == x890064_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

	--E¼¼ÄÜĞÄÌø....
	if 1 == x890064_TickSkillE( sceneId, selfId, nTick ) then
		return
	end

	--Ãë±íĞÄÌø....
	x890064_TickStopWatch( sceneId, selfId, nTick )

		local monstercount = GetMonsterCount( sceneId )
		local monsterId, GroupID, DogX, DogZ
		local x, z = GetLastPatrolPoint( sceneId, 0 )
		local xx, zz = GetLastPatrolPoint( sceneId, 3 )

		for i = 0, monstercount - 1 do
			monsterId = GetMonsterObjID( sceneId, i )
			GroupID = GetMonsterGroupID( sceneId, monsterId )

			if GroupID == x890064_g_DogfaceGroup
			 and LuaFnIsCharacterLiving( sceneId, monsterId ) == 1 then			-- ÅĞ¶Ï»î×ÅµÄĞ¡±øÊÇ·ñÌÓÅÜ³É¹¦
				DogX, DogZ = GetWorldPos( sceneId, monsterId )
				if (x - DogX) * (x - DogX) + (z - DogZ) * (z - DogZ) < 2 then	-- ÀëÖÕµã²»µ½ 5 Ã×
					local x,z = GetWorldPos( sceneId, selfId )
					LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19649, 0 )
					LuaFnDeleteMonster( sceneId, monsterId )
				elseif (xx - DogX) * (xx - DogX) + (zz - DogZ) * (zz - DogZ) < 2 then	-- ÀëÖÕµã²»µ½ 5 Ã×
					local x,z = GetWorldPos( sceneId, selfId )
					LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19649, 0 )
					LuaFnDeleteMonster( sceneId, monsterId )
				end
			end
		end

end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x890064_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890064_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890064_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x890064_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890064_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x890064_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x890064_ResetMyAI( sceneId, selfId )

	--É¾³ı×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨¶Ô»°NPC....
	local MstId = CallScriptFunction( x890064_g_FuBenScriptId, "CreateBOSS", sceneId, "JiuMoZhi_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )
end


--**********************************
--É±ËÀµĞÈË....
--**********************************
function x890064_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀÍö....
--**********************************
function x890064_OnDie( sceneId, selfId, killerId )

	--ÖØÖÃAI....
	x890064_ResetMyAI( sceneId, selfId )

	--ÉèÖÃÒÑ¾­ÌôÕ½¹ı¹ş´ó°Ô....
	CallScriptFunction( x890064_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "JiuMoZhi", 2 )

	--Èç¹û»¹Ã»ÓĞÌôÕ½¹ıÉ£ÍÁ¹«Ôò¿ÉÒÔÌôÕ½É£ÍÁ¹«....
	if 2 ~= CallScriptFunction( x890064_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ZhangJuXian" ) then
		CallScriptFunction( x890064_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ZhangJuXian", 1 )
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

	AddMonsterDropItem( sceneId, selfId, playerID, 39910001 )
	
	if playerName ~= nil then
		str = format("#{_INFOUSR%s}´øÁì¶ÓÎéÔÚÉÙÊÒÉ½ÉÏÇáËÉ½«#Gğ¯Ä¦ÖÇ#W»÷°Ü¡£¼ÌĞøÏòÉÙÊÒÉ½¶¥¶ËÍ¦½ø¡£", playerName); --¹ş´ó°Ô
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
				local WuPin = random( getn(x890064_LootItem_1) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x890064_LootItem_1[WuPin] )

			end

			rand = random(100)
			if rand < 40 then
				AddMonsterDropItem( sceneId, selfId, mems[i], 39910050 )
			end

			rand = random(100)
			if rand < 10 then
				local WuPin = random( getn(x890064_LootItem_2) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x890064_LootItem_2[WuPin]  )
			end

		end
	end
	
end


--**********************************
--ÖØÖÃAI....
--**********************************
function x890064_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊı....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_StopWatch, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillA_CD, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillB_HPStep, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillB_Step, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillB_Type, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillC_CD, x890064_SkillC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillD_CD, x890064_SkillD_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_KuangBaoTimer, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890064_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890064_IDX_IsKuangBaoMode, 0 )

end

--**********************************
--A¼¼ÄÜĞÄÌø....
--**********************************
function x890064_TickSkillA( sceneId, selfId, nTick )

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillA_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillA_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillA_CD, x890064_SkillA_CD-(nTick-cd) )
		return x890064_UseSkillA( sceneId, selfId )
	end

end

--**********************************
--B¼¼ÄÜĞÄÌø....
--**********************************
function x890064_TickSkillB( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	local LastStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillB_HPStep )
	local CurStep = 0
	if CurPercent >= 1.3333 then
		CurStep = 2
	elseif CurPercent >= 1.6666 then
		CurStep = 1
	end

	if CurStep > LastStep then

		--ÉèÖÃ²ÎÊı....
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillB_HPStep, CurStep )
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillB_Step, 15 )
		local JianWuType = random( getn(x890064_SkillB_SkillIDTbl) )
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillB_Type, JianWuType )

		--º°»°....
		MonsterTalk(sceneId, -1, "", x890064_SkillB_TalkTbl[JianWuType] )
		
		MonsterTalk(sceneId, -1, "", x890064_SkillB_Text[JianWuType] )
		--·ÅÈ«³¡¾°ÑÌ»¨....
		LuaFnSetSceneWeather(sceneId, x890064_SkillB_WeatherTbl[JianWuType], 15000 )

		--¶Ô×Ô¼ºÊ¹ÓÃ¿Õ¼¼ÄÜ....
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x890064_SkillB_SkillIDTbl[JianWuType], selfId, x, z, 0, 1 )

		return 1

	end

	return 0

end

--**********************************
--C¼¼ÄÜĞÄÌø....
--**********************************
function x890064_TickSkillC( sceneId, selfId, nTick )

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillC_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillC_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillC_CD, x890064_SkillC_CD-(nTick-cd) )
		return x890064_UseSkillC( sceneId, selfId )
	end

end

--**********************************
--D¼¼ÄÜĞÄÌø....
--**********************************
function x890064_TickSkillD( sceneId, selfId, nTick )

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillD_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillD_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillD_CD, x890064_SkillD_CD-(nTick-cd) )
		return x890064_UseSkillD( sceneId, selfId )
	end

end

--**********************************
--E¼¼ÄÜĞÄÌø....
--**********************************
function x890064_TickSkillE( sceneId, selfId, nTick )

	--Èç¹ûÕıÔÚÓÃB¼¼ÄÜÔòÏÈµÈ´ı....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillB_Step ) > 0 then
		return 0
	end

	--¼ì²âÊÇ·ñµ½ÁË¿ñ±©µÄÊ±ºò....
	local kbTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890064_IDX_KuangBaoTimer )
	if kbTime < x890064_EnterKuangBaoTime then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_KuangBaoTimer, kbTime+nTick )
		return 0

	else

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

	--¶Ô×Ô¼ºÊ¹ÓÃÒ»¸ö¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890064_SkillE_ID, selfId, x, z, 0, 1 )

	--¸øÍæ¼Ò¼ÓÊ§Ã÷buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, x890064_SkillE_Buff, 0 )

	return 1

	end
end

--**********************************
--Ãë±íĞÄÌø....
--**********************************
function x890064_TickStopWatch( sceneId, selfId, nTick )

	--ÏŞÖÆÃ¿Ãë²Å»áÖ´ĞĞÒ»´Î....
	local time = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890064_IDX_StopWatch )
	if (time + nTick) > 1000 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_StopWatch, time+nTick-1000 )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_StopWatch, time+nTick )
		return
	end


	-------------------------
	--½£Îè¼¼ÄÜÂß¼­....
	-------------------------
	local buffStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillB_Step )
	local skillType = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillB_Type )
	if buffStep >= 1 and buffStep <= 15 then

		--Ñ°ÕÒ·ûÃôÒÇ....
		local bossId = CallScriptFunction( x890064_g_FuBenScriptId, "FindBOSS", sceneId, "FuMinYi_NPC" )
		if bossId <= 0 then
			return 0
		end

		--ÈÃ·ûÃôÒÇ¸øÍæ¼Ò¼Óbuff....
		local buffTbl = x890064_SkillB_BuffIDTbl[skillType]
		local buffId = buffTbl[16-buffStep]
		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1 do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
				LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
			end
		end

	end

	if buffStep > 0 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillB_Step, buffStep-1 )
	end


end

--**********************************
--Ê¹ÓÃA¼¼ÄÜ....
--**********************************
function x890064_UseSkillA( sceneId, selfId )

	--Èç¹ûÕıÔÚÓÃB¼¼ÄÜÔòÌø¹ı....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillB_Step ) > 0 then
		return 0
	end

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

	--¶Ô×Ô¼ºÊ¹ÓÃÒ»¸ö¿Õ¼¼ÄÜ....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890064_SkillA_ID, selfId, x, z, 0, 1 )

	--¸øÍæ¼Ò¼ÓÊ§Ã÷buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, x890064_SkillA_Buff, 0 )

	return 1

end

--**********************************
--Ê¹ÓÃC¼¼ÄÜ....
--**********************************
function x890064_UseSkillC( sceneId, selfId )

	--Èç¹ûÕıÔÚÓÃB¼¼ÄÜÔòÌø¹ı....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillB_Step ) > 0 then
		return 0
	end

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890064_SkillC_ID, selfId, x, z, 0, 1 )
	return 1

end

--**********************************
--Ê¹ÓÃD¼¼ÄÜ....
--**********************************
function x890064_UseSkillD( sceneId, selfId )

	--Èç¹ûÕıÔÚÓÃB¼¼ÄÜÔòÌø¹ı....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x890064_IDX_SkillB_Step ) > 0 then
		return 0
	end

	CallScriptFunction((200060), "Paopao",sceneId, "ğ¯Ä¦ÖÇ", "ÉÙÊÒÉ½", "ÄãÃÇÕâĞ©ĞÅÍ½»¹ÔÚµÈÊ²Ã´£¬¿ì¹ıÀ´£¬ÎÒÒªÓÃÄãÃÇµÄÑªÒºÀ´·ÏµôËûÃÇµÄ¹¦Á¦¡£" )

	MonsterTalk( sceneId, -1, "", "×¢Òâ£¬ĞÅÍ½¿¿½ü¾¯½äµãºó£¬ğ¯Ä¦ÖÇ½«ÊÍ·ÅÊÈÄ§¾ö£¬ÇëÑ¸ËÙ»÷É±£¡" )

	--¸±±¾ÖĞÓĞĞ§µÄÍæ¼ÒµÄÁĞ±í....
		local dogfaceId = -1
		for i = 1, getn( x890064_g_DogfacePos ) do
			if x890064_g_DogfacePos[i] then
				dogfaceId = LuaFnCreateMonster( sceneId, x890064_g_DogfacePos[i][4], x890064_g_DogfacePos[i][1], x890064_g_DogfacePos[i][2], 1, 4, -1 )
				SetMonsterGroupID( sceneId, dogfaceId, x890064_g_DogfaceGroup )
				SetPatrolId( sceneId, dogfaceId, x890064_g_DogfacePos[i][3] )		-- ÉèÖÃÑ²ÂßÂ·¾¶
				SetCharacterDieTime( sceneId, dogfaceId, 15000 )
			end
		end

	--Ê¹ÓÃ¿Õ¼¼ÄÜ....
	--local x,z = GetWorldPos( sceneId, selfId )
	--LuaFnUnitUseSkill( sceneId, selfId, x890064_SkillD_ID, selfId, x, z, 0, 1 )

	--ÔÚ¸ÃÍæ¼Ò½Åµ×ÏÂ·ÅÏİÚå....
	--x,z = GetWorldPos( sceneId, PlayerId )
	CreateSpecialObjByDataIndex(sceneId, selfId, x890064_SkillD_SpecObj, 123, 171, 0)
	CreateSpecialObjByDataIndex(sceneId, selfId, x890064_SkillD_SpecObj, 135, 171, 0)

	return 1

end

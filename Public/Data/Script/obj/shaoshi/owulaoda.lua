--çÎç¿·å¸±±¾....
--ÎÚÀÏ´ó¶Ô»°½Å±¾....

-- Script ID
x890072_g_ScriptId = 890072

--¸±±¾Âß¼­½Å±¾ºÅ....
x890072_g_FuBenScriptId = 890063

--Õ½°ÜÎÚÀÏ´ó¶Ô»°½Å±¾ºÅ....
x890072_g_LossScriptId = 890075

--**********************************
--ÈÎÎñÈë¿Úº¯Êı....
--**********************************
function x890072_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)

		AddText(sceneId,"      ²Ø¾­¸óµÄ¾øÊÀÎäÑ§£¬´Ë´ÎÎÒÃÇÊÆÔÚ±ØµÃ£¬ÈËµ²É±ÈË£¬·ğµ²É±·ğ£¡¡£")

		if 1 == CallScriptFunction( x890070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "MuRongFu" ) then
		    AddNumText( sceneId, x890072_g_ScriptId, "ÌôÕ½", 10, 2 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
-- Danh sách sñ ki®n b§c 1
--**********************************
function x890072_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then

	--Èç¹ûÕıÔÚ¼¤»îBOSSÔò·µ»Ø....
	if 1 == CallScriptFunction( x890072_g_FuBenScriptId, "IsSSSTimerRunning", sceneId ) then
		return
	end

	--ÊÇ²»ÊÇ¶Ó³¤....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		BeginEvent(sceneId)
			AddText( sceneId, "#{PMF_20080521_07}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--Èç¹ûÕıÔÚºÍ±ğµÄBOSSÕ½¶·Ôò·µ»Ø....
	local ret, msg = CallScriptFunction( x890072_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--ÅĞ¶Ïµ±Ç°ÊÇ·ñ¿ÉÒÔÌôÕ½ÎÚÀÏ´ó....	
		if 1 ~= CallScriptFunction( x890072_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "MuRongFu" ) then
			BeginEvent(sceneId)
				AddText( sceneId, "#{PMF_20080521_11}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		--¿ªÆôçÎç¿·å¼ÆÊ±Æ÷À´¼¤»î×Ô¼º....
		CallScriptFunction( x890072_g_FuBenScriptId, "OpenSSSTimer", sceneId, 7, x890072_g_ScriptId, -1 ,-1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
  end

   if GetNumText() == 2 then
	BeginEvent(sceneId)
		AddText(sceneId,"      ÄãÈ·ÈÏ¿ªÊ¼ÌôÕ½Ã´£¿¿ªÊ¼ÌôÕ½ºó£¬ËÂÃÅ½«±»·âÓ¡£¬ËÀÍöºó½«ÎŞ·¨Á¢¼´²ÎÓëÕ½¶·£»ËùÓĞ¶ÓÔ±ÍÑÀëÕ½¶·£¬·âÓ¡½«½â³ı¡£")
		    AddNumText( sceneId, x890073_g_ScriptId, "ÌôÕ½", 10, 1 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
  end

end

--**********************************
--çÎç¿·å¼ÆÊ±Æ÷µÄOnTimer....
--**********************************
function x890072_OnSSSTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x890072_g_FuBenScriptId, "TipAllHuman", sceneId, "Õ½¶·5ÃëÖÓºó¿ªÊ¼" )
		return
	end

	if 6 == step then
		CallScriptFunction( x890072_g_FuBenScriptId, "TipAllHuman", sceneId, "Õ½¶·4ÃëÖÓºó¿ªÊ¼" )
		return
	end

	if 5 == step then
		CallScriptFunction( x890072_g_FuBenScriptId, "TipAllHuman", sceneId, "Õ½¶·3ÃëÖÓºó¿ªÊ¼" )
		return
	end

	if 4 == step then
		CallScriptFunction( x890072_g_FuBenScriptId, "TipAllHuman", sceneId, "Õ½¶·2ÃëÖÓºó¿ªÊ¼" )
		return
	end

	if 3 == step then
		CallScriptFunction( x890072_g_FuBenScriptId, "TipAllHuman", sceneId, "Õ½¶·1ÃëÖÓºó¿ªÊ¼" )
		return
	end

	if 2 == step then
		--ÌáÊ¾Õ½¶·¿ªÊ¼....
		CallScriptFunction( x890072_g_FuBenScriptId, "TipAllHuman", sceneId, "Õ½¶·¿ªÊ¼" )
		--É¾³ıNPC....
		CallScriptFunction( x890072_g_FuBenScriptId, "DeleteBOSS", sceneId, "MuRongFu_NPC" )
		return
	end

	if 1 == step then
		--½¨Á¢BOSS....
		CallScriptFunction( x890072_g_FuBenScriptId, "CreateBOSS", sceneId, "MuRongFu_BOSS", -1, -1 )
		return
	end

end

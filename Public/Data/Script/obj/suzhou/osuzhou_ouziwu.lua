
x001072_g_ScriptId   = 001072
x001072_g_Name			 = "Âu Tr¸ Vu"

x001066_g_ShenQiUpScriptId = 500505

x001072_g_eventList = {}

function x001072_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "#{SQSJ_0708_08}" )
		AddNumText( sceneId, x001072_g_ScriptId, "#{SQSJ_XML_01}", 6, 1 )
		--AddNumText( sceneId, x001072_g_ScriptId, "T¦y lÕi thuµc tính th¥n khí", 6, 40 )
		AddNumText( sceneId, x001072_g_ScriptId, "#{SQSJ_XML_04}", 11, 9 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x001072_OnEventRequest( sceneId, selfId, targetId, eventId)
	local key = GetNumText()

	if (key == 1) then
		BeginUICommand( sceneId)
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19831114 )
    return
  elseif (key == 9) then
    x001072_NotifyFailBox( sceneId, selfId, targetId, "#{SQSJ_0708_01}" )
    return
	end
end
--**********************************
-- ¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x001072_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ÆÁÄ»ÖÐ¼äÐÅÏ¢ÌáÊ¾
--**********************************
function x001072_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

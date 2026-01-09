--Th§p nh¸ Sát Tinh
--Khô Vinh ÐÕi Sß
--Author: Hoàng Steven

--************************--
x910113_g_ScriptId=910113
x910113_g_Event_ScriptId=910112												--Script event
--************************--

--*****************************--
--*     On Default Event      *--
--*****************************--
function x910113_OnDefaultEvent(sceneId,selfId,targetId)

	--************************--
	BeginEvent(sceneId)
		AddText(sceneId,"#{SXRW_090119_001}")
		CallScriptFunction(x910113_g_Event_ScriptId,"OnEnumerate",sceneId,selfId,targetId)
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,x910113_g_ScriptId)
	--************************--

end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x910113_OnEventRequest(sceneId,selfId,targetId,eventId)

	if eventId==x910113_g_Event_ScriptId then
		CallScriptFunction(eventId,"OnDefaultEvent",sceneId,selfId,targetId)
		return
	end

end

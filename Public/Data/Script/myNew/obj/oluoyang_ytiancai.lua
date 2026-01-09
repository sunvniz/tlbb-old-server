
x210534_g_scriptId = 210534

--**********************************
--
--**********************************
function x210534_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{SZPR_091023_01}")
		AddNumText( sceneId, x210534_g_scriptId, "#{SZPR_091023_02}", 6, 0 )
		AddNumText( sceneId, x210534_g_scriptId, "#{SZPR_091023_08}", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--
--**********************************
function x210534_OnEventRequest( sceneId, selfId, targetId, eventId )
	local key = GetNumText()
	if key == 0 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,0910281)
	end

	if key == 100 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SZPR_091023_10}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

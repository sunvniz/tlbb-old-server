--Viet Translate by VTAngel
x894062_g_ScriptId = 894062

x894062_g_eventList={894063,895063} --Phu ban
x894062_g_eventListch={000179} --Danh hieu


--**********************************
--Viet Translate by VTAngel
--**********************************
function x894062_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		--AddText(sceneId,"  #{JPZB_0610_01}")
		for i, eventId in x894062_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		for i, eventId in x894062_g_eventListch do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end

		AddText(sceneId,"   Binh Thánh KÏ Tr§n huy«n bí, ngß½i mu¯n tham gia không?")

		--AddNumText( sceneId, x894062_g_ScriptId, "Gi¾i thi®u", 0, 500 )
		
		AddNumText( sceneId, x894062_g_ScriptId, "L¥n sau lÕi ðªn!", 0, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Viet Translate by VTAngel
--**********************************
function x894062_OnDefaultEvent( sceneId, selfId,targetId )
	x894062_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--Viet Translate by VTAngel
--**********************************
function x894062_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	

	if nNumText == 0  then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end

	if nNumText == 500  then
		BeginEvent(sceneId)
		    AddText(sceneId,"#3")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	

	for i, findId in x894062_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
	for i, findId in x894062_g_eventListch do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end	

	
end

--**********************************
--Viet Translate by VTAngel
--**********************************
function x894062_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x894062_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--Viet Translate by VTAngel
--**********************************
function x894062_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
--Viet Translate by VTAngel
	for i, findId in x894062_g_eventList do
		if missionScriptId == findId then
			x894062_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x894062_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Viet Translate by VTAngel
--**********************************
function x894062_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x894062_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Viet Translate by VTAngel
--**********************************
function x894062_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x894062_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--Viet Translate by VTAngel
--**********************************
function x894062_OnDie( sceneId, selfId, killerId )
end

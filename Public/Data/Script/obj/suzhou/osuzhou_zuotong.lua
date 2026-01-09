--ËÕÖÝNPC		Ç§Ñ°
--×óÍ©
--½Å±¾ºÅ

x001080_g_ScriptId = 001080


--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x001080_g_eventList={229024, 050056}

--**********************************

--ÊÂ¼þÁÐ±í

--**********************************

function x001080_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)

	for i, eventId in x001080_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
  AddNumText( sceneId, x001080_g_ScriptId, "Ta mu¯n ghi vé ð«", 6, 101 );
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--ÊÂ¼þ½»»¥Èë¿Ú

--**********************************

function x001080_OnDefaultEvent( sceneId, selfId,targetId )

	x001080_UpdateEventList( sceneId, selfId, targetId )

end



--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x001080_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x001080_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
  if GetNumText() == 101 then  --È¡ÏûÁË
	  CallScriptFunction( (900034), "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x001080_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001080_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x001080_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x001080_g_eventList do
		if missionScriptId == findId then
			x001080_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x001080_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001080_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x001080_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001080_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x001080_OnDie( sceneId, selfId, killerId )
end

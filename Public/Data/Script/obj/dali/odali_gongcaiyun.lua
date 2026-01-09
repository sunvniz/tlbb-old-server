--¹¨²ÊÔÆ

--½Å±¾ºÅ
x002089_g_scriptId = 002089

--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x002089_g_eventList={ 808036,
					  808035,
					  808058,
					  808059,
--					  808060,
					  210242,
--					  808062,
					  808063,
					  210243,
					  050022,
					  808074,
					  808075,
					  808077,
--					 808078,
					  808079,
					  808038,    -- zchw signature
					  889052,
					  889053,
					  808129,    -- ²¹Áì¸ÉÀ¤´ü
					}

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x002089_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	local  strNpcDefault = "#{OBJ_DALI_GONGCAIYUN_DEFAULT}"
	AddText(sceneId, strNpcDefault );
	for i, eventId in x002089_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--AddNumText( sceneId, x002032_g_scriptId, "#GB°i Thß¶ng HTP Sau Bug Drop", 6, 74131 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x002089_OnDefaultEvent( sceneId, selfId,targetId )
	x002089_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x002089_OnEventRequest( sceneId, selfId, targetId, eventId )
	local key = GetNumText()
	if key == 74131 then
		local htp = GetMissionData(sceneId,selfId,BUG_HTP)
		if htp ~= 7413 then
			local free = LuaFnGetPropertyBagSpace(sceneId,selfId)
			if free <= 29 then
				BeginEvent(sceneId)
					AddText(sceneId, "Hãy chu¦n b¸ 30 ch² tr¯ng trong tai näi!" )
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
				return
			end
			for i = 1, 30 do
				local posnew = TryRecieveItem(sceneId,selfId,30900015,1)
				LuaFnItemBind(sceneId,selfId,posnew)
			end
			BeginEvent(sceneId)
				AddText(sceneId, "Ngß½i ðã nh§n ðßþc b°i thß¶ng, ð×ng kêu ca næa nhé!" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			SetMissionData(sceneId,selfId,BUG_HTP,7413)
			return
		else
			BeginEvent(sceneId)
				AddText(sceneId, "ChÆng phäi ngß½i ðã nh§n b°i thß¶ng r°i hay sao?" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	end

	for i, findId in x002089_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x002089_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

end

--**********************************
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x002089_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x002089_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x002089_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x002089_OnDie( sceneId, selfId, killerId )
end

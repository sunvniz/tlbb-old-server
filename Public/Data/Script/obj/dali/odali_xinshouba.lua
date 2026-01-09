--Ëï°ËÒ¯

--½Å±¾ºÅ
x002032_g_scriptId = 002032


--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x002032_g_eventList={
	210210,
	210211,
	210212,
	999997, -- Top Champion
}

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x002032_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local PlayerName=GetName(sceneId,selfId)
	local PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " muµi muµi"
	else
		PlayerSex = " huynh ð®"
	end
	AddText(sceneId,"  "..PlayerName..PlayerSex.."#{OBJ_dali_0014}")
	for i, eventId in x002032_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText( sceneId, x002032_g_scriptId, "HoÕt ðµng T¥n hoàng chiªn th¥n", 6, 200 )
	AddNumText( sceneId, x002032_g_scriptId, "Nh§n g¤p ðôi kinh nghi®m h¢ng ngày", 6, 201 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x002032_OnDefaultEvent( sceneId, selfId,targetId )
	x002032_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x002032_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	for i, findId in x002032_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	if nNumText == 200 then
		BeginEvent(sceneId)
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 20001) == 0 then
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 20001, 0 )
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 ) --Hieu ung thang cap
				AddText(sceneId,"  Chúc m×ng các hÕ ðã nh§n hi®u Ñng cüa hoÕt ðµng T¥n hoàng chiªn th¥n thành công, hãy bôn t¦u giang h° Thiên Long Bát Bµ cùng nó nhé!")
			else
				AddText(sceneId,"  Các hÕ ðang giæ trên ngß¶i trÕng thái này r°i!")
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	elseif nNumText == 201 then
	   local DayTime = GetDayTime()
	   if GetLevel(sceneId,selfId) < 10 then
	    BeginEvent(sceneId)
	    AddText(sceneId, "Thiên linh ðan và v§t ph¦m trân quý, hãy ðÕt c¤p ðµ 10 r°i t¾i tìm ta.")
	    EndEvent(sceneId)
	    DispatchEventList(sceneId,selfId, targetId)
		return
       elseif DayTime == GetMissionData( sceneId, selfId, MD_EXPX2) then
	    local textStr = "Ta nh¾ là các hÕ ðã nh§n h² trþ cüa ngày hôm nay r°i ."
        BeginEvent(sceneId)
	    AddText(sceneId, textStr)
	    EndEvent(sceneId)
	    DispatchEventList(sceneId,selfId, targetId)
		return
       else
	     local freeSpace = LuaFnGetPropertyBagSpace(sceneId,selfId)
		 if freeSpace >=1 then
		   SetMissionData(sceneId, selfId, MD_EXPX2, DayTime)


           BagIndex = LuaFnTryRecieveItem( sceneId, selfId, 30008014, 0)
		   LuaFnItemBind(sceneId, selfId, BagIndex)

		   BeginEvent(sceneId)
	       AddText(sceneId, "Chúc các hÕ mµt ngày ch½i game vui vë.")
	       EndEvent(sceneId)
	       DispatchEventList(sceneId,selfId, targetId)
		   return
		   else
		   BeginEvent(sceneId)
	       AddText(sceneId, "Túi ðÕo cø không có ðü 1 ch² tr¯ng, hãy s¡p xªp lÕi tay näi ði nhé.")
	       EndEvent(sceneId)
	       DispatchEventList(sceneId,selfId, targetId)
		   return
		 end
       end
	end
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x002032_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002032_g_eventList do
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
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x002032_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x002032_g_eventList do
		if missionScriptId == findId then
			x002032_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x002032_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002032_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x002032_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002032_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x002032_OnDie( sceneId, selfId, killerId )
end

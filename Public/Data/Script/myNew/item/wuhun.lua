-----------------------------
-- Script: Item Võ H°n
-- Author: Dark.Hades
-----------------------------

x809271_g_ScriptId	= 809271

function x809271_UpdateEventList(sceneId,selfId,targetId )
	BeginEvent(sceneId);
    AddText(sceneId,"  Hi®n tÕi ta ðang · ðê, vài hôm næa t§u nhà xong xuôi m¾i có tâm trí lo ð« ðóm ðßþc.");
	EndEvent(sceneId);

	DispatchEventList(sceneId,selfId,targetId);
end


function x809271_OnDefaultEvent( sceneId, selfId,targetId )
	x809271_UpdateEventList( sceneId, selfId, targetId )
end

function x809271_OnEventRequest( sceneId, selfId, targetId, eventId )
	local requestID = GetNumText();
  return
end

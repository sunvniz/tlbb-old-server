---------------------------------
-- mrvik20
---------------------------------
x900034_g_scriptId = 900034

--Ã‹Ã¹Ã“ÂµÃ“Ä?ÂµÃ„ÃŠÃ‚Â¼â‚«IDÃ?Ä?Â±Ã­
--**********************************
--900034
--**********************************
function x900034_UpdateEventList(sceneId,selfId,targetId )
	BeginEvent(sceneId);
    AddText(sceneId,"  Hi®n tÕi ta ðang · ðê, vài hôm næa t§u nhà xong xuôi m¾i có tâm trí lo ð« ðóm ðßþc.");
	EndEvent(sceneId);

	DispatchEventList(sceneId,selfId,targetId);
end


function x900034_OnDefaultEvent( sceneId, selfId,targetId )
	x900034_UpdateEventList( sceneId, selfId, targetId )
end

function x900034_OnEventRequest( sceneId, selfId, targetId, eventId )
	local requestID = GetNumText();
  return
end

function x900034_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA );
	BeginEvent( sceneId );
		AddText( sceneId, str );
	EndEvent( sceneId );
	DispatchMissionTips( sceneId, selfId );
end

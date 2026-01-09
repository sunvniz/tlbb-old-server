-- Áì½±NPC

x894068_g_scriptId = 894068

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x894068_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Thiên ðß¶ng hæu lµ quân b¤t t¦u, ð¸a ngøc vô môn t¯ng thßþng lai!")
		AddNumText( sceneId, x894068_g_scriptId, "#c00ff00Chiªn ð¤u", 10, 200)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
-- Danh sách sñ ki®n b§c 1
--**********************************
function x894068_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 200 then
		BeginEvent(sceneId)
			AddText(sceneId,"Huynh ð® ð°ng tâm chiªn ð¤u, chúng ta s¨ cùng các ngß½i chiªn ð¤u!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

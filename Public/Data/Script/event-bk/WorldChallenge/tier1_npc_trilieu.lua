x970005_g_ScriptId = 970005

function x970005_OnDefaultEvent(sceneId, selfId, targetId)
 BeginEvent(sceneId)
  AddText(sceneId, "Bän môn có vi®c h® tr÷ng, ta s¨ chæa tr¸ vªt thß½ng cho các ngß½i")
  AddNumText(sceneId, selfId, "Tr¸ li®u", 6, 1)
 EndEvent(sceneId)
 DispatchEventList(sceneId, selfId)
end

function x970005_OnEventRequest(sceneId, selfId, targetId, eventId)
   if GetNumText() == 1 then
         RestoreRage( sceneId, selfId )
        CallScriptFunction( 000064, "Restore_hpmp",sceneId, selfId, targetId )
   end
end
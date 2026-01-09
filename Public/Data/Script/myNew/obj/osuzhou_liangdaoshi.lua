--=======================--
-- Lß½ng ðÕo sî
-- Author: Dark.Hades
--=======================--

x210536_g_scriptId = 210536


function x210536_OnDefaultEvent( sceneId, selfId, targetId )

     
	BeginEvent(sceneId)
    AddText(sceneId, "#{SQXY_09061_12}")
	AddText(sceneId, "Sau khi tß¾i nß¾c cho #YCây ß¾c nguy®n#W và nh§n ðßþc ðü s¯ #GHÑa nguy®n quä #Wyêu c¥u, ta có th¬ ðáp Ñng nhi«u nguy®n v÷ng cüa các hÕ.")
    --AddNumText(sceneId, x210536_g_scriptId, "#{SQXY_09061_4}", 3, 10)
    AddNumText(sceneId, x210536_g_scriptId, "#{SQXY_09061_5}", 6, 11)

    AddNumText(sceneId, x210536_g_scriptId, "#{SQXY_09061_6}", 11, 1)
	EndEvent(sceneId)
	DispatchEventList( sceneId, selfId, targetId )
end
function x210536_UpdateEventList( sceneId, selfId,targetId )
     
end
function x210536_OnEventRequest( sceneId, selfId, targetId, eventId )
   
	local key = GetNumText();
    
	if (key ==1 ) then
		BeginEvent(sceneId)
		AddText( sceneId, "#{SQXY_09061_10}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif (key == 11) then
	 BeginEvent(sceneId)
		CallScriptFunction( 980001, "OnEnumerate", sceneId, selfId, targetId)
	 EndEvent(sceneId)
	 DispatchEventList( sceneId, selfId, targetId )
	 else
	 CallScriptFunction(980001, "OnDefaultEvent", sceneId, selfId, targetId)
	 
    end
end
function x210536_CheckAccept( sceneId, selfId )
end

--**********************************
--Tiªp thø
--**********************************
function x210536_OnAccept( sceneId, selfId )

end

--**********************************
--·ÅÆú
--**********************************
function x210536_OnAbandon( sceneId, selfId )
end

--**********************************
--¼ÌÐø
--**********************************
function x210536_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--¼ì²âÐúng·ñ¿ÉÒÔÌá½»
--**********************************
function x210536_CheckSubmit( sceneId, selfId )
	
end

function x210536_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
   CallScriptFunction(980001,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
end


function x210536_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

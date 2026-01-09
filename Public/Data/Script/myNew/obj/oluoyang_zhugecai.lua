--=======================--
-- Chﬂ C·t Th·i - L’c DﬂΩng
-- Author: Dark.Hades
-- NPC in luoyang_monster.ini:monster207
--=======================--

x210533_g_scriptId = 210533

function x210533_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)

    AddText(sceneId, "#{ZZ_091103_01}")
		AddNumText( sceneId, x210533_g_scriptId, "#{ZZ_091103_02}", 6, 100 )
		AddNumText( sceneId, x210533_g_scriptId, "#{ZZ_091103_03}", 11, 111 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x210533_OnEventRequest( sceneId, selfId, targetId, eventId )

	local key = GetNumText();

	if (111 == key) then
		BeginEvent(sceneId)

		AddText( sceneId, "#{ZZ_091103_08}" )

		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif (100 == key) then
		BeginEvent(sceneId)

    if (LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1) then
			x210533_NotifyFailTips(sceneId, selfId, "#{HFBC_90611_3}")
			return
		end

		local lastrcv = GetMissionData(sceneId, selfId, MD_LAST_RECIVE_HAMMER_TIME);
		local now = (date("%H")*3600)+(date("%M")*60)+date("%S");
		local timeleft = now-lastrcv;
		if ((timeleft>=0 and timeleft<7200) or (timeleft<0)) then
			AddText( sceneId, "#{ZZ_091103_04} #G"..floor((7200-timeleft)/60).."#W#{ZZ_091103_05}" )
		else
	    for i = 1,5 do
	      TryRecieveItem( sceneId, selfId, 30504179, QUALITY_MUST_BE_CHANGE )
	    end
		  AddText( sceneId, "#{ZZ_091103_07}" )

	  	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
	  	CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
			SetMissionData(sceneId, selfId, MD_LAST_RECIVE_HAMMER_TIME, now);
		end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	else

	end

end

function x210533_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

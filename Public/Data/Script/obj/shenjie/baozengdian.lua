--Vat pham <ID:30501100>
--Viet Translate by VTAngel
--Author: Steven.Han 10:39 2007-06-08

x899011_g_scriptId = 899011
--**********************************
--Viet Translate by VTAngel
--**********************************
function x899011_OnDefaultEvent( sceneId, selfId, bagIndex )
--Viet Translate by VTAngel
end

--**********************************
--Viet Translate by VTAngel
--**********************************
function x899011_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--Viet Translate by VTAngel
--**********************************
function x899011_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--Viet Translate by VTAngel
--**********************************
function x899011_OnConditionCheck( sceneId, selfId )
--Viet Translate by VTAngel
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		
	return 1; --不需要任何条 c醝，并且始终返回1。
end

--**********************************
--Viet Translate by VTAngel
--**********************************
function x899011_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end

	return 0;
end

--**********************************
--Viet Translate by VTAngel
--**********************************
function x899011_OnActivateOnce( sceneId, selfId )
    local ZengDianPerAct = 800
    ZengDian(sceneId,selfId,-1,1, ZengDianPerAct )
    x899011_ShowNotice( sceneId, selfId, "Th鄋h c鬾g gia t錸g "..(ZengDianPerAct).." 餴琺 tg" )
	return 1;
end

--**********************************
--Viet Translate by VTAngel
--**********************************
function x899011_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

function x899011_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

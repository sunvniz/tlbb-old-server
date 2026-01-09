
x100001_g_scriptId = 100001
x100001_g_ItemList = {
{id=30504088, value=100},
{id=30504089, value=200},
{id=30504090, value=500},
{id=30504091, value=1000},
{id=30504092, value=5000}
}

function x100001_OnDefaultEvent( sceneId, selfId, bagIndex )
end


function x100001_IsSkillLikeScript( sceneId, selfId)
	return 1; 
end


function x100001_CancelImpacts( sceneId, selfId )
	return 0; 
end


function x100001_OnConditionCheck( sceneId, selfId )
	return 1;
end



function x100001_OnDeplete( sceneId, selfId )
	
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end

	return 0;
end

function x100001_OnActivateOnce( sceneId, selfId )
	
    local   ItemId = LuaFnGetItemIndexOfUsedItem(sceneId,selfId)
	
	for i, item in x100001_g_ItemList do
       if(item.id == ItemId) then
	    ZengDian(sceneId, selfId, selfId, 1, item.value)
		str = format("Nh§n ðßþc %d ði¬m t£ng",item.value)
	    BeginEvent(sceneId)
	    AddText(sceneId, str)
	    EndEvent(sceneId)
	    DispatchMissionTips(sceneId,selfId)
	   end
	end
	return 1
end

function x100001_OnActivateEachTick( sceneId, selfId)
	return 1
end
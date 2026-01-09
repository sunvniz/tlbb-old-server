

x715031_g_MainItemId = 30505255

x715031_g_SubItemId = 50112003

x715031_g_MustHaveItemId = 20309009

function 	x715031_OnCreate(sceneId,growPointType,x,y)
	local targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x715031_g_MainItemId)


	if random(100) <= 80 then
		local ItemSn, ItemName, bBroadCast = GetItemSnByDropRateOfItemTable()
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,ItemSn)
	end

end



function	 x715031_OnOpen(sceneId,selfId,targetId)

	if HaveItem(sceneId,selfId, x715031_g_MustHaveItemId) > 0 then
		local Bagpos = GetBagPosByItemSn(sceneId,selfId,x715031_g_MustHaveItemId)
		if LuaFnIsItemAvailable(sceneId,selfId,Bagpos) == 1 then
			return OR_OK
		else
			Msg2Player(  sceneId, selfId,"Bäo tàng chü nhân không cho phép" ,MSG2PLAYER_PARA )
			BeginEvent(sceneId)
				AddText(sceneId, "C¥n tiêu di®t bäo tàng chü nhân")
			EndEvent()
			DispatchMissionTips(sceneId,selfId)
			return OR_ERROR
		end
	else
		BeginEvent(sceneId)
			AddText(sceneId, "C¥n có chìa khóa ð¬ m· kho báu");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return OR_STUFF_LACK
	end
end



function	x715031_OnProcOver(sceneId,selfId,targetId)

	if 1 == LuaFnDelAvailableItem(sceneId,selfId, x715031_g_MustHaveItemId, 1) then
		local BonusMoney = 114 + (GetLevel(sceneId, selfId)-20) * 16
		AddMoney(sceneId, selfId, BonusMoney)
		Msg2Player(  sceneId, selfId,"Nh§n ðßþc #{_MONEY" .. tostring(BonusMoney) .. "}" ,MSG2PLAYER_PARA )
	else
		Msg2Player(  sceneId, selfId,"Bäo tàng chü nhân không cho phép" ,MSG2PLAYER_PARA )
		return OR_ERROR
	end
	return OR_OK
end


function	 x715031_OnRecycle(sceneId,selfId,targetId)
		return OR_OK
end


function x715031_OnTickCreateFinish( sceneId, growPointType, tickCount )
end

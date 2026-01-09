--=======================--
-- Di chuyen bao thach
-- Author: Dark.Hades
--=======================--

x800119_g_scriptId = 800119

x800119_g_EquipGemTable = {}
x800119_g_GemLevelTable = {}
x800119_g_EquipGemTable[0] = { 1, 2, 3, 4, 6, 7, 8, 9, 21, 26 }
x800119_g_EquipGemTable[1] = { 11, 12, 13, 14, 16, 17, 18, 19 }
x800119_g_EquipGemTable[2] = { 11, 12, 13, 14, 16, 17, 18, 19 }
x800119_g_EquipGemTable[3] = { 11, 12, 13, 14, 16, 17, 18, 19 }
x800119_g_EquipGemTable[4] = { 11, 12, 13, 14, 16, 17, 18, 19 }
x800119_g_EquipGemTable[5] = { 11, 12, 13, 14, 16, 17, 18, 19 }
x800119_g_EquipGemTable[6] = { 1, 2, 3, 4, 6, 7, 8, 9, 21, 26 }
x800119_g_EquipGemTable[7] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 26 }
x800119_g_EquipGemTable[11] = { 1, 2, 3, 4, 6, 7, 8, 9, 21, 26 }
x800119_g_EquipGemTable[12] = { 1, 2, 3, 4, 6, 7, 8, 9, 21, 26 }
x800119_g_EquipGemTable[13] = { 1, 2, 3, 4, 6, 7, 8, 9, 21, 26 }
x800119_g_EquipGemTable[14] = { 1, 2, 3, 4, 6, 7, 8, 9, 21, 26 }
x800119_g_EquipGemTable[15] = { 11, 12, 13, 14, 16, 17, 18, 19 }
x800119_g_EquipGemTable[17] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 26 }
x800119_g_EquipGemTable[18] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 26 }
x800119_g_EquipGemTable[19] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 26 }
x800119_g_EquipGemTable[20] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21 }
x800119_g_EquipGemTable[21] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 26 }
x800119_g_GemLevelTable[1] = 2
x800119_g_GemLevelTable[2] = 3
x800119_g_GemLevelTable[3] = 6
x800119_g_GemLevelTable[4] = 8
x800119_g_GemLevelTable[5] = 24
x800119_g_GemLevelTable[6] = 29
x800119_g_GemLevelTable[7] = 34
x800119_g_GemLevelTable[8] = 39
x800119_g_GemLevelTable[9] = 44

function x800119_Do_Displace( sceneId, selfId, EQUIPITEM_SOURCE, EQUIPITEM_DEST )

  if (LuaFnGetMaterialBagSpace( sceneId, selfId ) < 1) then
		x800119_NotifyTip( sceneId, selfId, "#{STZDY_20080513_36}" )
		return
  end

  if (GetGemEmbededCount(sceneId, selfId, EQUIPITEM_DEST) > 0) then
		x800119_NotifyTip( sceneId, selfId, "Trang b¸ c¥n chuy¬n ðªn không ðw÷c phép khäm bäo thÕch" )
		return
  end

	local needFu = 0
	local GemID = -1
  local equipType = LuaFnGetBagEquipType( sceneId, selfId, EQUIPITEM_DEST )
  local Bore_Count_Source = GetGemEmbededCount(sceneId, selfId, EQUIPITEM_SOURCE)
  local GemList = {}

  for i=1,tonumber(Bore_Count_Source) do
		GemID = GetGemEmbededType( sceneId, selfId, EQUIPITEM_SOURCE, i-1 )

    if not x800119_g_EquipGemTable[equipType] then
  		return OR_GEM_NOT_FIT_EQUIP
  	end

    local gemType = LuaFnGetItemType( GemID )
  	local passFlag = 0
  	for i, gt in x800119_g_EquipGemTable[equipType] do
  		if gt == gemType then
  			passFlag = 1
  			break
  		end
  	end

  	if passFlag == 0 then
      x800119_NotifyTip( sceneId, selfId, "#{BSQKY_20110506_18}" )
  		return
  	end

		needFu = needFu + x800119_g_GemLevelTable[LuaFnGetItemQuality(GemID)]
    tinsert(GemList, GemID)
  end

	local FuNoBindCount = LuaFnGetAvailableItemCount(sceneId, selfId, 30900104)
	local FuBindCount = LuaFnGetAvailableItemCount(sceneId, selfId, 30900114)
	if (FuNoBindCount + FuBindCount < needFu) then
		x800119_NotifyTip( sceneId, selfId, "#{BSQKY_20110506_39}" )
		x800119_NotifyTip( sceneId, selfId, "Thiªu "..(needFu - FuNoBindCount - FuBindCount).." cái #{_ITEM30900104}" )
		return
	end

  if CostMoney(sceneId,selfId,100000) == -1 then
		x800119_NotifyTip( sceneId, selfId, "#{BSQKY_20110506_21}")
		return
	end
  if (FuBindCount >= needFu) then
	  LuaFnDelAvailableItem( sceneId, selfId, 30900114, needFu )
  else
    if (FuBindCount > 0) then
	     LuaFnDelAvailableItem( sceneId, selfId, 30900114, FuBindCount )
    end
	  LuaFnDelAvailableItem( sceneId, selfId, 30900104, needFu-FuBindCount )
  end

  -- Ep ngoc
	-- for i=1,getn(GemList) do
  --   if (getn(GemList) < 4) then
	-- 		ret	= AddBagItemSlot( sceneId, selfId, EQUIPITEM_DEST );
	-- 	else
	-- 		ret	= AddBagItemSlotFour( sceneId, selfId, EQUIPITEM_DEST );
  --   end
	-- 	if (ret == 1 or ret == -4) then
	-- 		local GemPos = TryRecieveItem( sceneId, selfId, GemList[i], QUALITY_MUST_BE_CHANGE )
  --     GemEnchasing( sceneId, selfId, GemPos, EQUIPITEM_DEST )
	-- 		EraseItem( sceneId, selfId, GemPos )
	-- 	else
	-- 		i = i - 1;
	-- 	end
	-- end
  -- Go ngoc

  x800119_NotifyTip( sceneId, selfId, "#{BSQKY_20110506_23}")
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
	local equipinfo = GetBagItemTransfer( sceneId, selfId, EQUIPITEM_DEST )
	local playername = GetName(sceneId, selfId)
	local strText = format("#{_INFOUSR%s0}#H sØ døng chÑc nång Bäo ThÕch Càn Khôn Di chuy¬n bäo thÕch v¯n khäm cÑng trên trang b¸ cû sang #{_INFOMSG%s1}#H, không phí chút công sÑc.", playername, equipinfo)
	BroadMsgByChatPipe(sceneId,selfId, strText, 4)
end

function x800119_NotifyTip( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

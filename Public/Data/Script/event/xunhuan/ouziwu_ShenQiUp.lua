--=======================--
-- Luy®n H°n Th¥n Khí
-- Author: Dark.Hades
--=======================--

x500505_g_scriptId = 500505

function x500505_OnShenqiUpgrade( sceneId, selfId, pos, targetId )
	local ItemID = LuaFnGetItemTableIndexByIndex(sceneId, selfId, pos)
  local handle = openfile("../Public/Config/SuperWeaponUp.txt", "r");
	local SuperWeaponUpTable = {}
  if nil ~= handle then
		local count = 1;
    while 1 do
      local line = read(handle, "*l")
			if (line == nil) then break end
			if ( count > 2 ) then
				if (tonumber(strsub(line, 1, strfind(line, "\t", 1))) == ItemID) then
					local to, from = 1, 1;
					while 1 do
						to = strfind(line, "\t", from);
						if to == nil then
							to = strlen(line)
						end
						local pop = tonumber(strsub(line, from, to));
						if (pop ~= nil) then
							tinsert(SuperWeaponUpTable, pop);
						end
						if to >= strlen(line) then break end
						from = to+1;
					end
					break
				end
			end
			count = count + 1;
    end
  	closefile(handle)
  end

	if (SuperWeaponUpTable[1] ~= ItemID) then
		x500505_NotifyTip( sceneId, selfId, "Hãy ð£t th¥n khí có th¬ ð±i!")
		return
	end

  if (LuaFnGetMaterialBagSpace( sceneId, selfId ) < 1) then
		x500505_NotifyTip( sceneId, selfId, "#{STZDY_20080513_36}" )
		return
  end

	local Bore_Count = GetGemEmbededCount(sceneId, selfId, pos)
  local GemList = {}
  for i=1,tonumber(Bore_Count) do
		local G_ID = GetGemEmbededType( sceneId, selfId, pos, i-1 )
		if G_ID > 0 then
    	tinsert(GemList, G_ID)
		else
			x500505_NotifyTip( sceneId, selfId, "Yêu c¥u khäm nÕm bäo thÕch vào l² thÑ "..tonumber(i).." trên trang b¸ ho£c tháo toàn bµ" )
			return
		end
  end

  local MenPai = GetMenPai(sceneId,selfId);
	local NewShengBing = SuperWeaponUpTable[9+tonumber(MenPai)];
	if (NewShengBing == nil) then
		x500505_NotifyTip( sceneId, selfId, "R¤t tiªc không h² trþ môn phái cüa ngß½i" )
		return
	end

	local NeedItem = SuperWeaponUpTable[3];
	local NeedItemCount = SuperWeaponUpTable[4];
	if (LuaFnGetAvailableItemCount(sceneId, selfId, NeedItem) < NeedItemCount) then
		x500505_NotifyTip( sceneId, selfId, format("Th¥n Khí Luy®n H°n c¥n %d #{_ITEM%s}", NeedItemCount, NeedItem) )
		return
	end

	-- Last to take money
  g_NeedMoney = SuperWeaponUpTable[getn(SuperWeaponUpTable)]
	if LuaFnCostMoneyWithPriority(sceneId,selfId,g_NeedMoney) == -1 then
		x500505_NotifyTip( sceneId, selfId, "#{SQSJ_0708_05}")
		return
	end
	LuaFnDelAvailableItem( sceneId, selfId, NeedItem, NeedItemCount )

	EraseItem( sceneId, selfId, pos )
	local NewItem = TryRecieveItem(sceneId,selfId,NewShengBing,QUALITY_MUST_BE_CHANGE)

	-- Ep ngoc
	for i=1,getn(GemList) do
    if (getn(GemList) < 4) then
			ret	= AddBagItemSlot( sceneId, selfId, NewItem );
		else
			ret	= AddBagItemSlotFour( sceneId, selfId, NewItem );
    end
		if (ret == 1 or ret == -4) then
			local GemPos = TryRecieveItem( sceneId, selfId, GemList[i], QUALITY_MUST_BE_CHANGE )
      GemEnchasing( sceneId, selfId, GemPos, NewItem )
			EraseItem( sceneId, selfId, GemPos )
		else
			i = i - 1;
		end
	end

	x500505_NotifyTip( sceneId, selfId, "#{SQSJ_0708_10}" )
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
	local equipinfo = GetBagItemTransfer( sceneId, selfId, NewItem )
	local playername = GetName(sceneId, selfId)
	local strText = format("#H#{_INFOUSR%s} #{SQSJ_0708_06} #G#{_INFOMSG%s}.", playername, equipinfo)
	BroadMsgByChatPipe(sceneId,selfId, strText, 4)
end

function x500505_NotifyTip( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


x260001_g_ScriptId	= 260001

x260001_g_ObbpszCost = 2000000;
x260001_g_Mainitem = {10155003,10155005};
x260001_g_Othertem = {30008069,30008070};--20310115,20310116};

function x260001_Anqi2Shenzhen ( sceneId, selfId, Anqi, needItem )

  local ItemID = LuaFnGetItemTableIndexByIndex( sceneId, selfId, Anqi )
  local needID = LuaFnGetItemTableIndexByIndex( sceneId, selfId, needItem )

  local Pass = 0
  for i, mI in x260001_g_Mainitem do
    if ItemID == mI then
      Pass = 1
      break
    end
  end
  if Pass == 0 then
    x260001_NotifyFailTips(sceneId, selfId, "#{AQSJ_090709_23}")
    return
  end
  Pass = 0
  for i, oI in x260001_g_Othertem do
    if needID == oI then
      Pass = 1
      break
    end
  end
  if Pass == 0 then
    x260001_NotifyFailTips(sceneId, selfId, "#{AQSJ_090709_24}")
    return
  end

  -- Lay Info ngoc
  if (LuaFnGetMaterialBagSpace( sceneId, selfId ) < 1) then
		x260001_NotifyFailTips( sceneId, selfId, "#{STZDY_20080513_36}" )
		return
  end
	local Bore_Count = GetGemEmbededCount(sceneId, selfId, Anqi)
  local GemList = {}
  for i=1,tonumber(Bore_Count) do
		local G_ID = GetGemEmbededType( sceneId, selfId, Anqi, i-1 )
		if G_ID > 0 then
    	tinsert(GemList, G_ID)
		else
			x260001_NotifyFailTips( sceneId, selfId, "YÍu c•u kh‰m n’m b‰o th’ch v‡o l≤ th— "..tonumber(i).." trÍn trang b∏ ho£c th·o to‡n bµ" )
			return
		end
  end

  if LuaFnGetPropertyBagSpace(sceneId,selfId) < 1 then
    BeginEvent(sceneId)
    AddText( sceneId, "H„y s°p x™p l’i 1 Ù trØng ∑ tay n‰i –’o C¯" )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
    return
  end

  if LuaFnCostMoneyWithPriority( sceneId, selfId, x260001_g_ObbpszCost ) == -1 then
    x260001_NotifyFailTips(sceneId, selfId, "Kh§u tr◊ v‡ng th§t b’i")
    return
  end

  local IsBind = LuaFnGetItemBindStatus( sceneId, selfId, Anqi )

  local NewItem = TryRecieveItem(sceneId,selfId,10155002,1)

  if IsBind == 1 then
    LuaFnItemBind(sceneId,selfId,NewItem)
  end
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
  local needIteminfo = GetBagItemTransfer( sceneId, selfId, needItem )
  EraseItem( sceneId, selfId, Anqi )
  EraseItem( sceneId, selfId, needItem )

  x260001_NotifyFailTips( sceneId, selfId, "#{AQSJ_090709_12}" )
  local playername = GetName(sceneId, selfId)
  local equipinfo = GetBagItemTransfer( sceneId, selfId, NewItem )
  local strText = format("#{_INFOUSR%s} #{AQSJ_090709_20} #{_INFOMSG%s} #{AQSJ_090709_21} #{_INFOMSG%s} #{AQSJ_090709_22}", playername,needIteminfo,equipinfo)
  BroadMsgByChatPipe(sceneId,selfId, strText, 4)
  LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,148,0)
end

--**********************************
-- ∂‘ª∞¥∞ø⁄–≈œ¢Ã· æ
--**********************************
function x260001_NotifyFailBox( sceneId, selfId, targetId, msg )
  BeginEvent( sceneId )
  AddText( sceneId, msg )
  EndEvent( sceneId )
  DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ∆¡ƒª÷–º‰–≈œ¢Ã· æ
--**********************************
function x260001_NotifyFailTips( sceneId, selfId, Tip )
  BeginEvent( sceneId )
  AddText( sceneId, Tip )
  EndEvent( sceneId )
  DispatchMissionTips( sceneId, selfId )
end

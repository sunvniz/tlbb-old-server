--------------------
-- Giftcode
-- Author: Dark.Hades
--------------------

x999998_g_scriptId = GIFTCODE_SCRIPT_ID

-- List num

x999998_g_AwardList = {}
--x999998_g_AwardList[MF_GIFTCODE_ALPHATEST] = {
--  needLevel = -1,
--  itemAward = { hashTable = {}, itemList = { 10155002, 50618004, 50608001, 30008014, 30008014, 30505805, 30505805, 30505805, 30505805 ,30505805 , 30505805, 30505805, 30505805, 30505805, 30505805 } },
--  moneyReward = 0,
--  PropBagSpaceNeed = 13,
--  MatBagSpaceNeed = 2,
--  TaskBagSpaceNeed = 0,
--  flagBit = MF_GIFTCODE_ALPHATEST,
--  redundantMsg = "    Các hÕ ðã nh§n ph¥n thß·ng cüa Alpha Test r°i, không th¬ nh§n thêm.",
--  recvMsg = "    M¤y món ð° trang sÑc · ðây, lßu lÕc trên giang h° ít nhi«u ð«u c¥n ðªn ngoài ra chõ ti«n này ð«u t£ng cho các hÕ, chúc các hÕ vui vë trong trò ch½i Thiên Long Bát Bµ",
--}
x999998_g_AwardList[MF_GIFTCODE_ALPHATEST] = {
  needLevel = -1,
  itemAward = { hashTable = {}, itemList = { 10155006, 30008014, 30008014, 31000005, 30504092, 50301001, 50301002, 10412013, 10411013, 10413013, 10421013} },
  moneyReward = 0,
  PropBagSpaceNeed = 9,
  MatBagSpaceNeed = 2,
  TaskBagSpaceNeed = 0,
  flagBit = MF_GIFTCODE_ALPHATEST,
  redundantMsg = "    Các hÕ ðã nh§n ph¥n thß·ng Gift Code r°i, không th¬ nh§n lÕi.",
  recvMsg = "    M¤y món ð° trang sÑc · ðây, lßu lÕc trên giang h° ít nhi«u ð«u c¥n ðªn ngoài ra chõ ti«n này ð«u t£ng cho các hÕ, chúc các hÕ vui vë trong trò ch½i Thiên Long Bát Bµ",
}

function x999998_OnDefaultEvent( sceneId, selfId, targetId, num, targetScriptID )
  --SetMissionFlag( sceneId, selfId, MF_GIFTCODE_CLOSEBETA,0 )
  if (targetScriptID == 002084) then
    BeginUICommand( sceneId )
    UICommand_AddInt( sceneId, targetId )
    EndUICommand( sceneId )
    DispatchUICommand( sceneId, selfId, 20161231 )

  end
end

function x999998_CheckCard(sceneId, selfId, card, op)
  -- A is Alphatest
  -- B is Closebeta
  local targetId = -1
  local grade = op
  local card_dir = "./Var/GiftCode/"..card;
  local of = readfrom(card_dir)
  if of then
    closefile(of)
    if (x999998_GetAward( sceneId, selfId, targetId, grade ) == 1) then
      remove(card_dir)
      -- Logs
      local fi = appendto("./Log/GiftCode_"..date("%Y-%m-%d")..".txt")
      if fi then
        local cd = " ("..date("T0=%Y-%m-%d_%X T1=")..tostring(clock())..")"
        local guid = LuaFnObjId2Guid(sceneId, selfId);
        write(fi,tostring(grade)..","..tostring(guid)..","..tostring(card)..cd.."\n")
        closefile(fi)
      end
    end
  else
    x999998_NotifyFailBox( sceneId, selfId, targetId, "    Mã các hÕ v×a nh§p vào không chính xác, vui lòng thØ lÕi ho£c liên h® Chính Khí Ðß¶ng nªu cäm th¤y ðây là mµt l²i." )
  end
end

function x999998_GetAward( sceneId, selfId, targetId, grade )
  local awardInfo = x999998_g_AwardList[grade]
  if not awardInfo then
    return
  end

  if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
    x999998_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
    return
  end

  if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
    x999998_NotifyFailBox( sceneId, selfId, targetId, "    », ðÆng c¤p cüa ngß½i chßa ðü, ðþi ð¬ ðÆng c¤p ðÕt t¾i " .. awardInfo.needLevel .. " c¤p lÕi ðªn tìm ta" )
    return
  end

  if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
    x999998_NotifyFailBox( sceneId, selfId, targetId, "    Thanh ðÕo cø ba lô cüa ngß½i ít nh¤t c¥n phäi ð¬ lÕi " .. awardInfo.PropBagSpaceNeed .. " Ô" )
    return
  end

  if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
    x999998_NotifyFailBox( sceneId, selfId, targetId, "    Thanh tài li®u ba lô cüa ngß½i ít nh¤t c¥n phäi ð¬ lÕi " .. awardInfo.MatBagSpaceNeed .. " Ô" )
    return
  end

  if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
    x999998_NotifyFailBox( sceneId, selfId, targetId, "    Thanh nhi®m vø ba lô cüa ngß½i ít nh¤t c¥n phäi ð¬ lÕi " .. awardInfo.TaskBagSpaceNeed .. " Ô" )
    return
  end

  local itemSN, itemName, itemDesc, bBroadCast
  for i, row in awardInfo.itemAward.hashTable do
    local itemSN, itemName, itemDesc, bBroadCast = GetOneMissionBonusItem( row )
    if itemSN > -1 then
      TryRecieveItem( sceneId, selfId, itemSN, 9 )								-- ·Å²»ÏÂ¾ÍÃ»ÓÐÁË
    end
  end

  for i, itemSN in awardInfo.itemAward.itemList do
    bagIndex = TryRecieveItem( sceneId, selfId, itemSN, 9 )
    LuaFnItemBind(sceneId, selfId, bagIndex)
  end

  if awardInfo.moneyReward > 0 then
    AddMoney( sceneId, selfId, awardInfo.moneyReward )
  end

  SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
  x999998_NotifyFailBox( sceneId, selfId, targetId, awardInfo.recvMsg )
  LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
  return 1;
end

function x999998_OnEnumerate( sceneId, selfId, targetId )

  AddNumText(sceneId,x999998_g_scriptId,"TÕi hÕ mu¯n sØ døng Gift Code", 2, 0)

end

function x999998_NotifyFailBox( sceneId, selfId, targetId, msg )
  BeginEvent( sceneId )
  AddText( sceneId, msg )
  EndEvent( sceneId )
  DispatchEventList( sceneId, selfId, targetId )
end

function x999998_NotifyFailTips( sceneId, selfId, Tip )
  BeginEvent( sceneId )
  AddText( sceneId, Tip )
  EndEvent( sceneId )
  DispatchMissionTips( sceneId, selfId )
end

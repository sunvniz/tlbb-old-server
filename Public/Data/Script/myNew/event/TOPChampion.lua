
x999997_g_scriptId = 999997

x999997_g_folderName = "TOPChampion"

-- Top type is the Folder name in Server/Var/TOPChampion
x999997_g_topList = {
  {
    type = "Level",
    param = {
      79, 99, -- List level
    },
  },
  -- {
  --   type = "Other",
  --   param = {
  --     59,
  --     79,
  --     99,
  --   },
  -- },
}

x999997_g_AwardList = {
  Level79 = {
    [1] = {
      itemAward = {
        menpai = {
          [0] = {},
          [1] = {},
          [2] = {},
          [3] = {},
          [4] = {},
          [5] = {},
          [6] = {},
          [7] = {},
          [8] = {},
          [9] = {},
        },
        itemList = {
          10155005, -- AK
          50513004, -- Gem TL
          20310114,20310114,20310114,20310114,20310114,20310114,20310114,20310114,20310114,20310114, -- HBTT
        },
      },
      moneyReward = 5000000,
      yuanbaoReward = 2000,
      zengdianReward = 0,
      PropBagSpaceNeed = 3,
      MatBagSpaceNeed = 1,
      TaskBagSpaceNeed = 0,
      recvMsg = "    Chúc m×ng các hÕ ðã ðÑng ð¥u trong sñ ki®n Ðua TOP level 79, ðây là vài ph¥n thß·ng nhö và chút ngân lßþng ta mu¯n t£ng cho các hÕ, hãy nh§n l¤y.",
    },
    [2] = {
      itemAward = {
        menpai = {
          [0] = {},
          [1] = {},
          [2] = {},
          [3] = {},
          [4] = {},
          [5] = {},
          [6] = {},
          [7] = {},
          [8] = {},
          [9] = {},
        },
        itemList = {
          10155005, -- AK
          50413004, -- Gem TL
          20310114,20310114,20310114,20310114,20310114, -- HBTT
        },
      },
      moneyReward = 4000000,
      yuanbaoReward = 1500,
      zengdianReward = 0,
      PropBagSpaceNeed = 2,
      MatBagSpaceNeed = 1,
      TaskBagSpaceNeed = 0,
      recvMsg = "    Chúc m×ng các hÕ ðã ðÑng thÑ 2 trong sñ ki®n Ðua TOP level 79, ðây là vài ph¥n thß·ng nhö và chút ngân lßþng ta mu¯n t£ng cho các hÕ, hãy nh§n l¤y.",
    },
    [3] = {
      itemAward = {
        menpai = {
          [0] = {},
          [1] = {},
          [2] = {},
          [3] = {},
          [4] = {},
          [5] = {},
          [6] = {},
          [7] = {},
          [8] = {},
          [9] = {},
        },
        itemList = {10155005,50413004,},
      },
      moneyReward = 3000000,
      yuanbaoReward = 1000,
      zengdianReward = 0,
      PropBagSpaceNeed = 1,
      MatBagSpaceNeed = 1,
      TaskBagSpaceNeed = 0,
      recvMsg = "    Chúc m×ng các hÕ ðã ðÑng thÑ 3 trong sñ ki®n Ðua TOP level 79, ðây là vài ph¥n thß·ng nhö và chút ngân lßþng ta mu¯n t£ng cho các hÕ, hãy nh§n l¤y.",
    },
    [4] = {
      itemAward = {
        menpai = {
          [0] = {},
          [1] = {},
          [2] = {},
          [3] = {},
          [4] = {},
          [5] = {},
          [6] = {},
          [7] = {},
          [8] = {},
          [9] = {},
        },
        itemList = {20310021,20310021,20310021,20310021,20310021,20310021,20310021,20310021,20310021,20310021,20310021,20310021,20310021,20310021,20310021,20310021,20310021,20310021,20310021,20310021,},
      },
      moneyReward = 2000000,
      yuanbaoReward = 800,
      zengdianReward = 0,
      PropBagSpaceNeed = 0,
      MatBagSpaceNeed = 1,
      TaskBagSpaceNeed = 0,
      recvMsg = "    Chúc m×ng các hÕ ðã ðoÕt giäi TOP4-10 trong sñ ki®n Ðua TOP level 79, ðây là vài ph¥n thß·ng nhö và chút ngân lßþng ta mu¯n t£ng cho các hÕ, hãy nh§n l¤y.",
    },
  },
}

function x999997_OnDefaultEvent ( sceneId, selfId, targetId )
	BeginEvent(sceneId)
  local guid = LuaFnObjId2Guid( sceneId, selfId );
  local num = 0
  for i, top in x999997_g_topList do
    local op = "./Var/"..x999997_g_folderName.."/"..(top.type).."/"..(top.param[i]).."/"..guid;
    local of = openfile(op, "r")
    if of then
      num = read(of, "*n")
      closefile(of)
      if (num) then
        local type = (top.type)..(top.param[i]);
        if x999997_GetAward( sceneId, selfId, targetId, type, num ) then
          remove(op)
        end
      end
      break
    end
  end
  if num == 0 then
    AddText(sceneId, "    Các hÕ không có ph¥n thß·ng ð¬ nh§n ho£c ðã nh§n hªt r°i.")
  end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x999997_OnEnumerate ( sceneId, selfId, targetId )
  AddNumText( sceneId, x999997_g_scriptId, "#PNh§n thß·ng "..x999997_g_folderName, 6, 0 )
end

function x999997_OnPlayerLevelUp ( sceneId, objId, level )
  local toplevel = -1--tonumber(x999997_g_topList[1].param[1]) -- Set to -1 or 0 to disable
  if level == toplevel then
    local uname = format("#{_INFOUSR%s}",GetName(sceneId,objId))
    local str = format("#PSñ ki®n #H[Ðua TOP ÐoÕt Quà HOT Level %s] #Pðã chính thÑc kªt thúc v¾i ph¥n thß·ng TOP 1 thuµc v« ngß¶i ch½i %s. Cäm ½n b¢ng hæu ðã tham gia. Chúng tôi s¨ tiªn hành bäo trì game ð¬ trao giäi.", toplevel, uname)
    BroadMsgByChatPipe(sceneId, objId, str, 4)
    LuaFnSendSystemMail( sceneId, GetName(sceneId,objId), str )
    local fi = appendto("./quitserver.cmd")
    if fi then
      write(fi,"f")
      closefile(fi)
    end
  end
end

function x999997_GetAward( sceneId, selfId, targetId, type, num )
  local awardInfo = x999997_g_AwardList[type]
  if not awardInfo then
    return
  else
    if not awardInfo[num] then
      num = getn(awardInfo)
    end
    awardInfo = awardInfo[num]
  end

  if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
    x999997_NotifyFailBox( sceneId, selfId, targetId, "    Thanh ðÕo cø ba lô cüa ngß½i ít nh¤t c¥n phäi ð¬ lÕi " .. awardInfo.PropBagSpaceNeed .. " Ô" )
    return
  end

  if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
    x999997_NotifyFailBox( sceneId, selfId, targetId, "    Thanh tài li®u ba lô cüa ngß½i ít nh¤t c¥n phäi ð¬ lÕi " .. awardInfo.MatBagSpaceNeed .. " Ô" )
    return
  end

  if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
    x999997_NotifyFailBox( sceneId, selfId, targetId, "    Thanh nhi®m vø ba lô cüa ngß½i ít nh¤t c¥n phäi ð¬ lÕi " .. awardInfo.TaskBagSpaceNeed .. " Ô" )
    return
  end

  if awardInfo.moneyReward > 0 then
    AddMoney( sceneId, selfId, awardInfo.moneyReward )
  end

  if awardInfo.yuanbaoReward > 0 then
    YuanBao( sceneId, selfId, targetId, 1, awardInfo.yuanbaoReward )
  end

  if awardInfo.zengdianReward > 0 then
    ZengDian( sceneId, selfId, targetId, 1, awardInfo.zengdianReward )
  end

  for i, itemMP in awardInfo.itemAward.menpai[GetMenPai(sceneId, selfId)] do
    bagIndex = TryRecieveItem( sceneId, selfId, itemMP, 9 )
    LuaFnItemBind(sceneId, selfId, bagIndex)
  end

  for i, itemSN in awardInfo.itemAward.itemList do
    bagIndex = TryRecieveItem( sceneId, selfId, itemSN, 9 )
    LuaFnItemBind(sceneId, selfId, bagIndex)
  end

  x999997_NotifyFailBox( sceneId, selfId, targetId, awardInfo.recvMsg )
  LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
  return 1;

end

function x999997_NotifyFailBox( sceneId, selfId, targetId, msg )
  BeginEvent( sceneId )
  AddText( sceneId, msg )
  EndEvent( sceneId )
  DispatchEventList( sceneId, selfId, targetId )
end

function x999997_NotifyFailTips( sceneId, selfId, Tip )
  BeginEvent( sceneId )
  AddText( sceneId, Tip )
  EndEvent( sceneId )
  DispatchMissionTips( sceneId, selfId )
end

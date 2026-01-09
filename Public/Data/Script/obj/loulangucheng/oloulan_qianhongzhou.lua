--**********************************
--事件交互入口
--**********************************

x001154_g_ScriptId	= 001154

function x001154_OnDefaultEvent( sceneId, selfId,targetId )
  BeginEvent(sceneId)
  AddText( sceneId, "#{AQSJ_090709_01}" )
  AddText( sceneId, "#{AQSJ_090709_05}" )
  AddNumText( sceneId, x001154_g_ScriptId, "#{AQSJ_090709_04}", 11, 1 )

  AddNumText( sceneId, x001154_g_ScriptId, "#{AQSJ_090709_02}", 6, 10 )
  AddNumText( sceneId, x001154_g_ScriptId, "#{AQSJ_090709_03}", 6, 11 )

  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件列表选中m祎 项
--**********************************
function x001154_OnEventRequest( sceneId, selfId, targetId, eventId)

  if GetNumText() == 1 then
    BeginEvent(sceneId)
    AddText( sceneId, "#{AQSJ_090709_19}" )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
  elseif GetNumText() == 10 then
    BeginUICommand( sceneId )
    UICommand_AddInt( sceneId, targetId )
    EndUICommand( sceneId )
    DispatchUICommand( sceneId, selfId, 070825 )
  elseif GetNumText() == 11 then
    BeginEvent(sceneId)
    AddText( sceneId, "#{AQSJ_090709_13}" )
    AddNumText( sceneId, x001154_g_ScriptId, "#{AQSJ_090709_03}", 6, 110 )
    AddNumText( sceneId, x001154_g_ScriptId, "#{AQSJ_090709_15}", 9, 111 )

    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
  elseif GetNumText() == 110 then
    local NotBindCount = LuaFnGetAvailableItemCount(sceneId,selfId,20310113)
    local BindCount = LuaFnGetAvailableItemCount(sceneId,selfId,20310114)

    if NotBindCount + BindCount < 20 then
      x001154_NotifyFailBox( sceneId, selfId, targetId, "    #{AQSJ_090709_16}" )
      return
    end
    if LuaFnGetPropertyBagSpace(sceneId,selfId) < 1 then
      x001154_NotifyFailBox( sceneId, selfId, targetId, "    #{AQSJ_090709_17}" )
      return
    end

    local SetBind = 0
    if BindCount >= 1 then
      if BindCount <= 20 then
        LuaFnDelAvailableItem(sceneId,selfId,20310114,BindCount)
      elseif(BindCount > 20) then
        LuaFnDelAvailableItem(sceneId,selfId,20310114,20)
      end
      SetBind = 1
    end
    if (BindCount < 20) then
      LuaFnDelAvailableItem(sceneId,selfId,20310113,20-BindCount)
    end
    if SetBind == 1 then
      TryRecieveItem(sceneId,selfId,30008070,1)
    else
      TryRecieveItem(sceneId,selfId,30008069,1)
    end
    x001154_NotifyFailTips( sceneId, selfId, "#{AQSJ_090709_18}" )
    BeginUICommand( sceneId )
    UICommand_AddInt( sceneId, targetId )
    EndUICommand( sceneId )
    DispatchUICommand( sceneId, selfId, 1000 )

  elseif GetNumText() == 111 then
    return x001154_OnDefaultEvent( sceneId, selfId,targetId )
  end
end
--**********************************
-- 对话窗口信息提示
--**********************************
function x001154_NotifyFailBox( sceneId, selfId, targetId, msg )
  BeginEvent( sceneId )
  AddText( sceneId, msg )
  EndEvent( sceneId )
  DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x001154_NotifyFailTips( sceneId, selfId, Tip )
  BeginEvent( sceneId )
  AddText( sceneId, Tip )
  EndEvent( sceneId )
  DispatchMissionTips( sceneId, selfId )
end

--洛阳NPC
--燕青
--普通

--脚本号
x002928_g_ScriptId = 002928

--所拥有的事件ID列表
x002928_g_eventList={}

x002928_g_randomText={
  "#{XL_090707_01}",
}

--**********************************
--事件列表
--**********************************
function x002928_UpdateEventList( sceneId, selfId, targetId )
  local rand = random(1, getn(x002928_g_randomText))
  BeginEvent(sceneId)
  AddText(sceneId, x002928_g_randomText[rand])

  AddNumText(sceneId, x002928_g_ScriptId, "#{XL_XML_35}", 6, 10)
  AddNumText(sceneId, x002928_g_ScriptId, "#{XL_XML_36}", 6, 11)
  AddNumText(sceneId, x002928_g_ScriptId, "#{XL_XML_37}", 6, 12)

  AddNumText(sceneId, x892000_g_ScriptId, "#{XL_XML_38}", 11, 6)
  AddNumText(sceneId, x002928_g_ScriptId, "#{XL_XML_60}", 11, 1)
  AddNumText(sceneId, x002928_g_ScriptId, "#{XL_XML_61}", 11, 2)
  AddNumText(sceneId, x002928_g_ScriptId, "#{XL_XML_62}", 11, 3)
  AddNumText(sceneId, x892000_g_ScriptId, "#{XL_XML_63}", 11, 4)
  AddNumText(sceneId, x892000_g_ScriptId, "#{XL_XML_64}", 11, 5)
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002928_OnDefaultEvent( sceneId, selfId, targetId )
  x002928_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002928_OnEventRequest( sceneId, selfId, targetId, eventId )
  for i, findId in x002928_g_eventList do
    if eventId == findId then
      CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
      return
    end
  end

  local NumText = GetNumText();
  if NumText == 1 then
    x892000_ShowNotice( sceneId, selfId, targetId, "#{XL_090707_48}")
  elseif NumText == 2 then
    x892000_ShowNotice( sceneId, selfId, targetId, "#{XL_090707_53}")
  elseif NumText == 3 then
    x892000_ShowNotice( sceneId, selfId, targetId, "#{XL_090707_54}")
  elseif NumText == 4 then
    x002928_ShowNotice( sceneId, selfId, targetId, "#{XL_090707_55}")
  elseif NumText == 5 then
    x002928_ShowNotice( sceneId, selfId, targetId, "#{XL_090707_56}")
  elseif NumText == 6 then
    x002928_ShowNotice( sceneId, selfId, targetId, "#{XL_090707_46}")
  elseif NumText == 10 then
    x002928_NotifyTips( sceneId, selfId, "#{YBFQ_XML_10}" )
    -- BeginUICommand( sceneId )
    -- UICommand_AddInt( sceneId, targetId )
    -- UICommand_AddInt( sceneId, 1 )
    -- EndUICommand( sceneId )
    -- DispatchUICommand( sceneId, selfId, 171717 )
  elseif NumText == 11 then
    x002928_NotifyTips( sceneId, selfId, "#{YBFQ_XML_10}" )
    -- BeginUICommand( sceneId )
    -- UICommand_AddInt( sceneId, targetId )
    -- UICommand_AddInt( sceneId, 2 )
    -- EndUICommand( sceneId )
    -- DispatchUICommand( sceneId, selfId, 171717 )
  elseif NumText == 12 then
    x002928_NotifyTips( sceneId, selfId, "#{YBFQ_XML_10}" )
  end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002928_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
  for i, findId in x002928_g_eventList do
    if missionScriptId == findId then
      ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
      if ret > 0 then
        CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
      end
      return
    end
  end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x002928_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
  --拒绝之后，要返回NPC的事件列表
  for i, findId in x002928_g_eventList do
    if missionScriptId == findId then
      x002928_UpdateEventList( sceneId, selfId, targetId )
      return
    end
  end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002928_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
  for i, findId in x002928_g_eventList do
    if missionScriptId == findId then
      CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
      return
    end
  end
end

--**********************************
--提交已做完的任务
--**********************************
function x002928_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
  for i, findId in x002928_g_eventList do
    if missionScriptId == findId then
      CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
      return
    end
  end
end

--**********************************
--死亡事件
--**********************************
function x002928_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x002928_NotifyTips( sceneId, selfId, Tip )
  BeginEvent( sceneId )
  AddText( sceneId, Tip )
  EndEvent( sceneId )
  DispatchMissionTips( sceneId, selfId )
end

function x002928_ShowNotice( sceneId, selfId, targetId, strNotice)
  BeginEvent( sceneId )
  AddText( sceneId, strNotice )
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)
end

function x002928_StudySkillImpact(sceneId, playerId)
  --显示学习到新技能的特效 目前使用升级特效
  LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end

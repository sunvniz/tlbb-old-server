--洛阳NPC
--燕青
--普通

--脚本号
x892000_g_ScriptId = 892000

--所拥有的事件ID列表
x892000_g_eventList={}

--**********************************
--事件列表
--**********************************
function x892000_UpdateEventList( sceneId, selfId, targetId )
   BeginEvent(sceneId)
   AddText(sceneId, "#{FLS_090721_92}")

   AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(03)}", 6, 10)
   AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(04)}", 6, 11)
   AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(05)}", 6, 12)
   AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(06)}", 6, 13)
   AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(07)}", 6, 14)
   AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(08)}", 6, 15)
   AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(81)}", 6, 16)
   AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(82)}", 6, 17)

   AddNumText(sceneId, x892000_g_ScriptId, "#{WH_xml_XX(12)}", 11, 1)
   AddNumText(sceneId, x892000_g_ScriptId, "#{WH_xml_XX(13)}", 11, 2)
   AddNumText(sceneId, x892000_g_ScriptId, "#{WH_xml_XX(14)}", 11, 3)
   EndEvent(sceneId)
   DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x892000_OnDefaultEvent( sceneId, selfId, targetId )
   x892000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x892000_OnEventRequest( sceneId, selfId, targetId, eventId )
   for i, findId in x892000_g_eventList do
      if eventId == findId then
         CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
         return
      end
   end

   local NumText = GetNumText();
   if NumText == 1 then
      x892001_ShowNotice( sceneId, selfId, targetId, "#{WH_090729_44}")
   elseif NumText == 2 then
      x892001_ShowNotice( sceneId, selfId, targetId, "#{WH_090729_45}")
   elseif NumText == 3 then
      x892001_ShowNotice( sceneId, selfId, targetId, "#{WH_090729_46}")
   elseif NumText == 10 then
      BeginUICommand( sceneId )
      UICommand_AddInt( sceneId, targetId )
      UICommand_AddInt( sceneId, 2 )
      EndUICommand( sceneId )
      DispatchUICommand( sceneId, selfId, 20090721 )
   elseif NumText == 11 then
      BeginUICommand( sceneId )
      UICommand_AddInt( sceneId, targetId )
      UICommand_AddInt( sceneId, 1 )
      EndUICommand( sceneId )
      DispatchUICommand( sceneId, selfId, 20090721 )
   elseif NumText == 12 then
      BeginUICommand( sceneId )
      UICommand_AddInt( sceneId, targetId )
      UICommand_AddInt( sceneId, 1 )
      EndUICommand( sceneId )
      DispatchUICommand( sceneId, selfId, 20090722 )
   elseif NumText == 13 then
      BeginUICommand( sceneId )
      UICommand_AddInt( sceneId, targetId )
      EndUICommand( sceneId )
      DispatchUICommand( sceneId, selfId, 20090723 )
   elseif NumText == 14 then
      BeginUICommand( sceneId )
      UICommand_AddInt( sceneId, targetId )
      EndUICommand( sceneId )
      DispatchUICommand( sceneId, selfId, 20090720 )
   elseif NumText == 15 then
      BeginUICommand( sceneId )
      UICommand_AddInt( sceneId, targetId )
      UICommand_AddInt( sceneId, 2 )
      EndUICommand( sceneId )
      DispatchUICommand( sceneId, selfId, 20090722 )
   elseif NumText == 16 then
      BeginUICommand( sceneId )
      UICommand_AddInt( sceneId, targetId )
      UICommand_AddInt( sceneId, 4 )
      EndUICommand( sceneId )
      DispatchUICommand( sceneId, selfId, 20090721 )
   elseif NumText == 17 then
      BeginUICommand( sceneId )
      UICommand_AddInt( sceneId, targetId )
      EndUICommand( sceneId )
      DispatchUICommand( sceneId, selfId, 20090727 )
   end
end

--**********************************
--接受此NPC的任务
--**********************************
function x892000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
   for i, findId in x892000_g_eventList do
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
function x892000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
   --拒绝之后，要返回NPC的事件列表
   for i, findId in x892000_g_eventList do
      if missionScriptId == findId then
         x892000_UpdateEventList( sceneId, selfId, targetId )
         return
      end
   end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x892000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
   for i, findId in x892000_g_eventList do
      if missionScriptId == findId then
         CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
         return
      end
   end
end

--**********************************
--提交已做完的任务
--**********************************
function x892000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
   for i, findId in x892000_g_eventList do
      if missionScriptId == findId then
         CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
         return
      end
   end
end

--**********************************
--死亡事件
--**********************************
function x892000_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x892000_NotifyTips( sceneId, selfId, Tip )
   BeginEvent( sceneId )
   AddText( sceneId, Tip )
   EndEvent( sceneId )
   DispatchMissionTips( sceneId, selfId )
end

function x892000_ShowNotice( sceneId, selfId, targetId, strNotice)
   BeginEvent( sceneId )
   AddText( sceneId, strNotice )
   EndEvent(sceneId)
   DispatchEventList(sceneId,selfId,targetId)
end

function x892000_StudySkillImpact(sceneId, playerId)
   --显示学习到新技能的特效 目前使用升级特效
   LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end

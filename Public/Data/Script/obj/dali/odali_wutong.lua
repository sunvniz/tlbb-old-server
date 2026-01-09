--ÂåÑôNPC
--ÑàÇà
--ÆÕÍ¨

--½Å±¾ºÅ
x892001_g_ScriptId = 892001

--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x892001_g_eventList={}

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x892001_UpdateEventList( sceneId, selfId, targetId )
  BeginEvent(sceneId)
  AddText(sceneId, "#{FLS_090721_92}")

  AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(09)}", 6, 10)
  AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(10)}", 6, 11) -- Wuhun_RH
  AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(11)}", 6, 12)

  AddNumText(sceneId, x892001_g_ScriptId, "#{WH_XML_1}", 11, 1)
  AddNumText(sceneId, x892001_g_ScriptId, "#{WH_XML_2}", 11, 2)
  AddNumText(sceneId, x892001_g_ScriptId, "#{WH_XML_3}", 11, 3)
  AddNumText(sceneId, x892000_g_ScriptId, "#{WHGBSX_xml_XX(02)}", 11, 4)
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x892001_OnDefaultEvent( sceneId, selfId, targetId )
  x892001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x892001_OnEventRequest( sceneId, selfId, targetId, eventId )
  for i, findId in x892001_g_eventList do
    if eventId == findId then
      CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
      return
    end
  end

  local NumText = GetNumText();
  if NumText == 1 then
    x892000_ShowNotice( sceneId, selfId, targetId, "#{WH_090909_06}")
  elseif NumText == 2 then
    x892000_ShowNotice( sceneId, selfId, targetId, "#{WH_090909_07}")
  elseif NumText == 3 then
    x892000_ShowNotice( sceneId, selfId, targetId, "#{WH_090909_08}")
  elseif NumText == 4 then
    x892001_ShowNotice( sceneId, selfId, targetId, "#{WHGBSX_091015_01}")
  elseif NumText == 10 then
    BeginUICommand( sceneId )
    UICommand_AddInt( sceneId, targetId )
    UICommand_AddInt( sceneId, 3 )
    EndUICommand( sceneId )
    DispatchUICommand( sceneId, selfId, 20090721 )
  elseif NumText == 11 then
    BeginUICommand( sceneId )
    UICommand_AddInt( sceneId, targetId )
    UICommand_AddInt( sceneId, 3 )
    EndUICommand( sceneId )
    DispatchUICommand( sceneId, selfId, 20090824 )
  elseif NumText == 12 then
    BeginEvent(sceneId)
      AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(108)}", 6, 120)
      AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(109)}", 6, 121)
      AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(110)}", 6, 122)
      AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(111)}", 6, 123)
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
  elseif (NumText >= 120 and NumText <= 130) then
    BeginEvent(sceneId)
      AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(112)}", 6, NumText*10)
      AddNumText(sceneId, x892001_g_ScriptId, "#{WH_xml_XX(113)}", 20, 12)
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
  elseif (NumText >= 1200 and NumText <= 1300) then
    x892001_HBC_Compound(sceneId, selfId, targetId, NumText/10)
  end
end

function x892001_HBC_Compound(sceneId, selfId, targetId, num)
  -- HBC List: 20310117 - 20310118 - 20310119 - 20310120 - 20310121
  local ItemByNum = {}
  ItemByNum[120] = {need = 5, from = 20310117, to = 20310118}
  ItemByNum[121] = {need = 5, from = 20310118, to = 20310119}
  ItemByNum[122] = {need = 5, from = 20310119, to = 20310120}
  ItemByNum[123] = {need = 5, from = 20310120, to = 20310121}

	if (GetItemCount(sceneId, selfId, ItemByNum[num].from) < ItemByNum[num].need) then
		local msg = format("Thång ngµ tính lên %d c¥n %s c¤p Cån c¯t ðan", ItemByNum[num].to, ItemByNum[num].from )
		x892001_ShowNotice( sceneId, selfId, targetId, msg)
		return 0;
	end
  LuaFnDelAvailableItem( sceneId, selfId, ItemByNum[num].from, ItemByNum[num].need )
  LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 49, 0 )


end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x892001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
  for i, findId in x892001_g_eventList do
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
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x892001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
  --¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
  for i, findId in x892001_g_eventList do
    if missionScriptId == findId then
      x892001_UpdateEventList( sceneId, selfId, targetId )
      return
    end
  end
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x892001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
  for i, findId in x892001_g_eventList do
    if missionScriptId == findId then
      CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
      return
    end
  end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x892001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
  for i, findId in x892001_g_eventList do
    if missionScriptId == findId then
      CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
      return
    end
  end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x892001_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- ÆÁÄ»ÖÐ¼äÐÅÏ¢ÌáÊ¾
--**********************************
function x892001_NotifyTips( sceneId, selfId, Tip )
  BeginEvent( sceneId )
  AddText( sceneId, Tip )
  EndEvent( sceneId )
  DispatchMissionTips( sceneId, selfId )
end

function x892001_ShowNotice( sceneId, selfId, targetId, strNotice)
  BeginEvent( sceneId )
  AddText( sceneId, strNotice )
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)
end

function x892001_StudySkillImpact(sceneId, playerId)
  --ÏÔÊ¾Ñ§Ï°µ½ÐÂ¼¼ÄÜµÄÌØÐ§ Ä¿Ç°Ê¹ÓÃÉý¼¶ÌØÐ§
  LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end

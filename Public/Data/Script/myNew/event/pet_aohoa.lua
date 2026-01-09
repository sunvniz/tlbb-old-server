
x800124_g_ScriptId = 800124

function x800124_Pet_HH( sceneId, selfId, hid, lid, m_KeepModel )
  x800124_NotifyFailTips( sceneId, selfId, "#{YBFQ_XML_10}")
end

function x800124_Pet_LXUP( sceneId, selfId, hid, lid )
  x800124_NotifyFailTips( sceneId, selfId, "#{YBFQ_XML_10}")
end

function x800124_NotifyFailTips( sceneId, selfId, Tip )
  BeginEvent( sceneId )
  AddText( sceneId, Tip )
  EndEvent( sceneId )
  DispatchMissionTips( sceneId, selfId )
end

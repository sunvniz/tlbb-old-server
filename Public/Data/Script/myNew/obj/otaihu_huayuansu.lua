--=======================--
-- HÑa nguy®n thø - Thái H°
-- Author: Dark.Hades
-- NPC in taihu_monster.ini:18
--=======================--

x210535_g_scriptId = 210535

function x210535_OnDefaultEvent( sceneId, selfId, targetId )
	local times = 0;
	BeginEvent(sceneId)

    AddText(sceneId, "#{SQXY_09061_37} "..tostring(times).." #{SQXY_09061_38}")

	EndEvent(sceneId)
	DispatchEventList( sceneId, selfId, targetId )
end

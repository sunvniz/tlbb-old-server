--=======================--
-- Chuông HÕnh Phúc - LÕc Dß½ng
-- Author: Dark.Hades
-- NPC in luoyang_monster.ini:monster208
--=======================--

x210532_g_scriptId = 210532

x210532_g_Text = {
	"#{YXN_091103_01}",
	"#{YXN_091103_02}",
	"#{YXN_091103_03}",
}

function x210532_OnDefaultEvent( sceneId, selfId, targetId )
  local maxIndex = getn(x210532_g_Text);
  local i = random(maxIndex);
	BeginEvent(sceneId)

    AddText(sceneId, x210532_g_Text[i])

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

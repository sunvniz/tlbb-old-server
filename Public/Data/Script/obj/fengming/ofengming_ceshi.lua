--苏州NPC
--套套
--普通

--套套
x045004_g_shoptableindex=264

--**********************************
--事件交互入口
--**********************************
function x045004_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x045004_g_shoptableindex )
end

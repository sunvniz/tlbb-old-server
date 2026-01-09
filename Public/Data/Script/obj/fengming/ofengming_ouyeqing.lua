--洛阳NPC
--抽奖
--普通
x045001_g_strGongGaoInfo = {
  "#H洛阳城内一道金光闪过，只见#{_INFOUSR%s}#H的手中出现一件#{_INFOMSG%s}，绝世神兵临降，看来人间又要迎来一场血雨腥风了！", 
  "#H洛阳城内一道金光闪过，只见#{_INFOUSR%s}#H的手中出现一件#{_INFOMSG%s}，绝世神兵临降，看来人间又要迎来一场血雨腥风了！", 
  "#H洛阳城内一道金光闪过，只见#{_INFOUSR%s}#H的手中出现一件#{_INFOMSG%s}，绝世神兵临降，看来人间又要迎来一场血雨腥风了！", 
  "#H洛阳城内一道金光闪过，只见#{_INFOUSR%s}#H的手中出现一件#{_INFOMSG%s}，绝世神兵临降，看来人间又要迎来一场血雨腥风了！", 
}
--**********************************
--事件交互入口
--**********************************
function x045001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "    神兵绝天下。灵石玄古今。" )
		AddText( sceneId, "    虽说重现轩辕神剑之威力已然无法，但大侠若有心追寻上古神兵，我自当以兵绝之全力，相助阁下，已慰平生。" )
		--AddText( sceneId, "#cFF0000提示：#G操作前，请先摘除宝石，以免宝石消失。" )
			AddNumText( sceneId, x045001_g_scriptId, " 二代神器通灵", 6, 101)
			AddNumText( sceneId, x045001_g_scriptId, " 进阶上古神兵", 6, 102)
			AddNumText( sceneId, x045001_g_scriptId, " 上古神兵重洗", 6, 103)
			AddNumText( sceneId, x045001_g_scriptId, " 重楼装备重洗", 6, 105)
			AddNumText(sceneId,x045001_g_ScriptId,"幻化游龙戏凤",6,60)
			------AddNumText( sceneId, x000179_g_scriptId, " 如何制作神器", 11, 107 )	
			--AddNumText( sceneId, x045001_g_scriptId, " #c00ffff进阶真·上古神兵", 6, 106)
		--AddNumText( sceneId, x045001_g_ScriptId, " 下次再来", 9, 4 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件列表选中一项
--**********************************
function x045001_OnEventRequest( sceneId, selfId, targetId, eventId)

		if	GetNumText()==60	then

			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1010)
			return

		end  



	if GetNumText() == 100 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff炼化材料#W可以在#Y各大BOSS#W获得!" )
		      AddText( sceneId, "#G（#cFF0000神器兑换#G）" )
		      AddText( sceneId, "#G（#cFF0000神器加星#G）" )
		      AddText( sceneId, "#G（#cFF0000神器附体#G）" )
		       AddText( sceneId, "#cff99ff提示（#G请拆下已镶嵌的宝石#cff99ff）" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 101 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#cff99ff聚灵石#W可以在#Y各大BOSS#W获得!" )
		      --AddText( sceneId, "#c0066ff一段#G（#cFF0000LV1-LV3#G）#cFF000050%↑" )
		      AddText( sceneId, "二代神器通灵需要消耗：" )
		      AddText( sceneId, "#G相对应的102神器#W1#G把" )
		      AddText( sceneId, "#cff99ff神兵符1级#W20#cff99ff个" )
		      AddText( sceneId, "#cFF0000提示：#G操作前，请先摘除宝石，否则会消失。" )
			AddNumText( sceneId, x045001_g_scriptId, "大夏龙雀 - 赤焰九龙刀", 6, 1011)
			AddNumText( sceneId, x045001_g_scriptId, "大秦锋镝 - 忘忧销魂枪", 6, 1012)
			AddNumText( sceneId, x045001_g_scriptId, "大唐昆岳 - 法天辟邪杖", 6, 1013)
			AddNumText( sceneId, x045001_g_scriptId, "大周岚夜 - 天光流影剑", 6, 1014)
			AddNumText( sceneId, x045001_g_scriptId, "大商尘影 - 九转龙泉剑", 6, 1015)
			AddNumText( sceneId, x045001_g_scriptId, "大燕韵章 - 星移月动剑", 6, 1031)
			AddNumText( sceneId, x045001_g_scriptId, "大晋星痕 - 灭魂轮回钩", 6, 1016)
			AddNumText( sceneId, x045001_g_scriptId, "大宋君岑 - 天雷真火扇", 6, 1017)
			AddNumText( sceneId, x045001_g_scriptId, "大隋凝霜 - 绝情裂影环", 6, 1018)
			AddNumText( sceneId, x045001_g_scriptId, "大汉弘纲 - 星云聚日环", 6, 1019)
			AddNumText( sceneId, x045001_g_scriptId, "大梁辟天 - 凌霄玉琼弩", 6, 1020)
			AddNumText( sceneId, x045001_g_scriptId, "改日再来", 9, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 1031 then
	local nStoneId0 = 10557050
	       	local nStoneId1 = 30505817
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10557050,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555009, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器通灵成功，您获得一把崭新的神器，小伙子装备上砍吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1011 then
	local nStoneId0 = 10300102
	       	local nStoneId1 = 30505817
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10300102,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555000, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器通灵成功，您获得一把崭新的神器，小伙子装备上砍吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1012 then
	local nStoneId0 = 10301102
	       	local nStoneId1 = 30505817
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301102,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555001, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器通灵成功，您获得一把崭新的神器，小伙子装备上砍吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1013 then
	local nStoneId0 = 10301202
	       	local nStoneId1 = 30505817
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301202,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555002, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器通灵成功，您获得一把崭新的神器，小伙子装备上砍吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1014 then
	local nStoneId0 = 10303102
	       	local nStoneId1 = 30505817
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303102,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555003, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器通灵成功，您获得一把崭新的神器，小伙子装备上砍吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end



	elseif GetNumText() == 1015 then
	local nStoneId0 = 10302102
	       	local nStoneId1 = 30505817
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302102,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555004, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器通灵成功，您获得一把崭新的神器，小伙子装备上砍吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

			
	elseif GetNumText() == 1016 then
	local nStoneId0 = 10303202
	       	local nStoneId1 = 30505817
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303202,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555005, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器通灵成功，您获得一把崭新的神器，小伙子装备上砍吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1017 then
	local nStoneId0 = 10304102
	       	local nStoneId1 = 30505817
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304102,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555006, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器通灵成功，您获得一把崭新的神器，小伙子装备上砍吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

			
	elseif GetNumText() == 1018 then
	local nStoneId0 = 10305202
	       	local nStoneId1 = 30505817
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305202,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555007, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器通灵成功，您获得一把崭新的神器，小伙子装备上砍吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

			
	elseif GetNumText() == 1019 then
	local nStoneId0 = 10305102
	       	local nStoneId1 = 30505817
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305102,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555008, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器通灵成功，您获得一把崭新的神器，小伙子装备上砍吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

			
	elseif GetNumText() == 1020 then
	local nStoneId0 = 10300100
	       	local nStoneId1 = 30505817
			c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10300100,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301100, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器通灵成功，您获得一把崭新的神器，小伙子装备上砍吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，材料不足！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 102 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#cff99ff玄兵石#W可以在#Y各大BOSS#W获得!" )
		      --AddText( sceneId, "#c0066ff一段#G（#cFF0000LV1-LV9#G）#cFF000070%↑" )
		      AddText( sceneId, "二代神器进阶上古神器需要消耗：" )
		      AddText( sceneId, "#G相对应的神器#W1#G把" )
		      AddText( sceneId, "#cff99ff女娲神石#W50#cff99ff个" )
		      AddText( sceneId, "#cFF0000提示：#G操作前，请先摘除宝石，否则会消失。" )
			AddNumText( sceneId, x045001_g_scriptId, "赤焰九龙刀 - 九霄炎阳", 6, 1021)
			AddNumText( sceneId, x045001_g_scriptId, "忘忧销魂枪 - 洪荒龙舞", 6, 1022)
			AddNumText( sceneId, x045001_g_scriptId, "法天辟邪杖 - 达摩一叹", 6, 1023)
			AddNumText( sceneId, x045001_g_scriptId, "天光流影剑 - 倚天长生", 6, 1024)
			AddNumText( sceneId, x045001_g_scriptId, "九转龙泉剑 - 大衍天玄", 6, 1025)
			AddNumText( sceneId, x045001_g_scriptId, "星移月动剑 - 末世王权", 6, 1032)
			AddNumText( sceneId, x045001_g_scriptId, "灭魂轮回钩 - 六道黄泉", 6, 1026)
			AddNumText( sceneId, x045001_g_scriptId, "天雷真火扇 - 太古飘零", 6, 1027)
			AddNumText( sceneId, x045001_g_scriptId, "绝情裂影环 - 无相绝踪", 6, 1028)
			AddNumText( sceneId, x045001_g_scriptId, "星云聚日环 - 万世枯荣", 6, 1029)
			AddNumText( sceneId, x045001_g_scriptId, "凌霄玉琼弩 - 灭影天诛", 6, 1030)
			AddNumText( sceneId, x045001_g_scriptId, "改日再来", 9, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 1032 then
                     local nStoneId0 = 10555009
	       	local nStoneId1 = 30004482
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555009,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004482,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305270, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶上古神器成功！您获得一件绝世神兵，江湖从此由您抒写！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 1021 then
                     local nStoneId0 = 10555000
	       	local nStoneId1 = 30004482
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555000,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004482,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305266, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶上古神器成功！您获得一件绝世神兵，江湖从此由您抒写！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1022 then
                     local nStoneId0 = 10555001
	       	local nStoneId1 = 30004482
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555001,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004482,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305267, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶上古神器成功！您获得一件绝世神兵，江湖从此由您抒写！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1023 then
                     local nStoneId0 = 10555002
	       	local nStoneId1 = 30004482
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555002,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004482,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305268, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶上古神器成功！您获得一件绝世神兵，江湖从此由您抒写！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1024 then
                     local nStoneId0 = 10555003
	       	local nStoneId1 = 30004482
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555003,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004482,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10306034, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶上古神器成功！您获得一件绝世神兵，江湖从此由您抒写！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1025 then
                     local nStoneId0 = 10555004
	       	local nStoneId1 = 30004482
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555004,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004482,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305269, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶上古神器成功！您获得一件绝世神兵，江湖从此由您抒写！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

			
	elseif GetNumText() == 1026 then
                     local nStoneId0 = 10555005
	       	local nStoneId1 = 30004482
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555005,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004482,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305271, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶上古神器成功！您获得一件绝世神兵，江湖从此由您抒写！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1027 then
                     local nStoneId0 = 10555006
	       	local nStoneId1 = 30004482
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555006,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004482,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305272, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶上古神器成功！您获得一件绝世神兵，江湖从此由您抒写！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


			
	elseif GetNumText() == 1028 then
                     local nStoneId0 = 10555007
	       	local nStoneId1 = 30004482
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555007,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004482,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305274, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶上古神器成功！您获得一件绝世神兵，江湖从此由您抒写！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

			
	elseif GetNumText() == 1029 then
                     local nStoneId0 = 10555008
	       	local nStoneId1 = 30004482
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555008,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004482,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305273, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶上古神器成功！您获得一件绝世神兵，江湖从此由您抒写！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1030 then
                     local nStoneId0 = 10301100
	       	local nStoneId1 = 30004482
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10301100,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004482,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10306033, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶上古神器成功！您获得一件绝世神兵，江湖从此由您抒写！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "材料不足！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

       elseif GetNumText() == 103 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#cff99ff神兵符#W可以在#Y各大BOSS#W获得!" )
		      --AddText( sceneId, "#c0066ff一段#G（#cFF0000LV1-LV9#G）#cFF000070%↑" )
		      AddText( sceneId, "上古神器重洗需要消耗：" )
		      AddText( sceneId, "#G相对应的上古神器#W1#G把" )
		      AddText( sceneId, "#cff99ff神兵符3级#W5#cff99ff个" )
		      AddText( sceneId, "#cFF0000提示：#G操作前，请先摘除宝石，否则会消失。" )
			AddNumText( sceneId, x045001_g_scriptId, "九霄焱阳 - 重洗", 6, 1041)
			AddNumText( sceneId, x045001_g_scriptId, "洪荒龙舞 - 重洗", 6, 1042)
			AddNumText( sceneId, x045001_g_scriptId, "达摩一叹 - 重洗", 6, 1043)
			AddNumText( sceneId, x045001_g_scriptId, "大衍天玄 - 重洗", 6, 1044)
			AddNumText( sceneId, x045001_g_scriptId, "末世王权 - 重洗", 6, 1045)
			AddNumText( sceneId, x045001_g_scriptId, "倚天长生 - 重洗", 6, 1033)
			AddNumText( sceneId, x045001_g_scriptId, "六道黄泉 - 重洗", 6, 1046)
			AddNumText( sceneId, x045001_g_scriptId, "太古飘翎 - 重洗", 6, 1047)
			AddNumText( sceneId, x045001_g_scriptId, "万世枯荣 - 重洗", 6, 1048)
			AddNumText( sceneId, x045001_g_scriptId, "无相绝踪 - 重洗", 6, 1049)
			AddNumText( sceneId, x045001_g_scriptId, "灭影天诛 - 重洗", 6, 1050)
			AddNumText( sceneId, x045001_g_scriptId, "改日再来", 9, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
       elseif GetNumText() == 1033 then
                     local nStoneId0 = 10306034
	       	local nStoneId1 = 30505819
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10306034,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505819,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10306034, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，上古神器重洗成功！获得一件崭新的上古神器，小伙子发挥你的战斗力吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000倚天长生#W和#G5个神兵符3级#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
       elseif GetNumText() == 1041 then
                     local nStoneId0 = 10305266
	       	local nStoneId1 = 30505819
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305266,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505819,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305266, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，上古神器重洗成功！获得一件崭新的上古神器，小伙子发挥你的战斗力吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000九霄焱阳#W和#G5个神兵符3级#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1042 then
                     local nStoneId0 = 10305267
	       	local nStoneId1 = 30505819
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305267,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505819,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305267, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，上古神器重洗成功！获得一件崭新的上古神器，小伙子发挥你的战斗力吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000洪荒龙舞#W和#G5个神兵符3级#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1043 then
                     local nStoneId0 = 10305268
	       	local nStoneId1 = 30505819
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305268,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505819,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305268, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，上古神器重洗成功！获得一件崭新的上古神器，小伙子发挥你的战斗力吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000达摩一叹#W和#G5个神兵符3级#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1044 then
                     local nStoneId0 = 10305269
	       	local nStoneId1 = 30505819
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305269,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505819,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305269, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，上古神器重洗成功！获得一件崭新的上古神器，小伙子发挥你的战斗力吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000大衍天玄#W和#G5个神兵符3级#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1045 then
                     local nStoneId0 = 10305270
	       	local nStoneId1 = 30505819
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305270,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505819,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305270, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，上古神器重洗成功！获得一件崭新的上古神器，小伙子发挥你的战斗力吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000末世王权#W和#G5个神兵符3级#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

			
	elseif GetNumText() == 1046 then
                     local nStoneId0 = 10305271
	       	local nStoneId1 = 30505819
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305271,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505819,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305271, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，上古神器重洗成功！获得一件崭新的上古神器，小伙子发挥你的战斗力吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000六道黄泉#W和#G5个神兵符3级#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1047 then
                     local nStoneId0 = 10305272
	       	local nStoneId1 = 30505819
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305272,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505819,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305272, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，上古神器重洗成功！获得一件崭新的上古神器，小伙子发挥你的战斗力吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000太古飘翎#W和#G5个神兵符3级#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


			
	elseif GetNumText() == 1048 then
                     local nStoneId0 = 10305273
	       	local nStoneId1 = 30505819
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305273,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505819,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305273, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，上古神器重洗成功！获得一件崭新的上古神器，小伙子发挥你的战斗力吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000万世枯荣#W和#G5个神兵符3级#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

			
	elseif GetNumText() == 1049 then
                     local nStoneId0 = 10305274
	       	local nStoneId1 = 30505819
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305274,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505819,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305274, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，上古神器重洗成功！获得一件崭新的上古神器，小伙子发挥你的战斗力吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000无相绝踪#W和#G5个神兵符3级#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1050 then
                     local nStoneId0 = 10306033
	       	local nStoneId1 = 30505819
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10306033,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505819,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10306033, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，上古神器重洗成功！获得一件崭新的上古神器，小伙子发挥你的战斗力吧！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000灭影天诛#W和#G5个神兵符3级#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

       elseif GetNumText() == 105 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff女娲石#W可以在#Y各大BOSS#W获得!" )
		      --AddText( sceneId, "#c0066ff一段#G（#cFF0000LV1-LV9#G）#cFF000070%↑" )
		      AddText( sceneId, "重楼装备重洗需要消耗：" )
		      AddText( sceneId, "#G相对应的重楼装备#W1#G件" )
		      AddText( sceneId, "#cff99ff女娲石#W5#cff99ff个" )
		      AddText( sceneId, "#cFF0000提示：#G操作前，请先摘除宝石，否则会消失。" )
			AddNumText( sceneId, x045001_g_scriptId, "重楼戒 - 重洗", 6, 1051)
			AddNumText( sceneId, x045001_g_scriptId, "重楼玉 - 重洗", 6, 1052)
			AddNumText( sceneId, x045001_g_scriptId, "重楼链 - 重洗", 6, 1053)
			AddNumText( sceneId, x045001_g_scriptId, "重楼带 - 重洗", 6, 1054)
			AddNumText( sceneId, x045001_g_scriptId, "重楼肩 - 重洗", 6, 1055)
			AddNumText( sceneId, x045001_g_scriptId, "重楼甲 - 重洗", 6, 1056)
			AddNumText( sceneId, x045001_g_scriptId, "改日再来", 9, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
       elseif GetNumText() == 1051 then
                     local nStoneId0 = 10553085
	       	local nStoneId1 = 30004481
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10553085,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004481,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10553085, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，重楼戒重洗成功，您获得一件崭新的重楼戒，属性貌似不错哦。"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G一件#cFF0000重楼戒#W和#G5个女娲石#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1052 then
                     local nStoneId0 = 10553084
	       	local nStoneId1 = 30004481
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10553084,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004481,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10553084, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，重楼玉重洗成功，您获得一件崭新的重楼玉，属性貌似不错哦。"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G一件#cFF0000重楼玉#W和#G5个女娲石#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1053 then
                     local nStoneId0 = 10553086
	       	local nStoneId1 = 30004481
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10553086,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004481,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10553086, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，重楼链重洗成功，您获得一件崭新的重楼链，属性貌似不错哦。"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G一件#cFF0000重楼链#W和#G5个女娲石#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1054 then
                     local nStoneId0 = 10553087
	       	local nStoneId1 = 30004481
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10553087,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004481,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10553087, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，重楼带重洗成功，您获得一件崭新的重楼带，属性貌似不错哦。"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G一件#cFF0000重楼带#W和#G5个女娲石#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1055 then
                     local nStoneId0 = 10553088
	       	local nStoneId1 = 30004481
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10553088,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004481,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10553088, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，重楼肩重洗成功，您获得一件崭新的重楼肩，属性貌似不错哦。"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G一件#cFF0000重楼肩#W和#G5个女娲石#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

			
	elseif GetNumText() == 1056 then
                     local nStoneId0 = 10553089
	       	local nStoneId1 = 30004481
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10553089,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30004481,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10553089, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，重楼甲重洗成功，您获得一件崭新的重楼甲，属性貌似不错哦。"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G一件#cFF0000重楼甲#W和#G5个女娲石#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1057 then
                     local nStoneId0 = 10555147
	       	local nStoneId1 = 30503141
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555147,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503141,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555149, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器熔炼附体成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


			
	elseif GetNumText() == 1058 then
                     local nStoneId0 = 10555152
	       	local nStoneId1 = 30503141
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555152,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503141,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555154, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器熔炼附体成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

			
	elseif GetNumText() == 1059 then
                     local nStoneId0 = 10555157
	       	local nStoneId1 = 30503141
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555157,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503141,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555159, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器熔炼附体成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1060 then
                     local nStoneId0 = 10555162
	       	local nStoneId1 = 30503141
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555162,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503141,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555164, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器熔炼附体成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

       elseif GetNumText() == 106 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#cff99ff女娲石#W可以在#Y各大BOSS#W获得!" )
		      --AddText( sceneId, "#c0066ff一段#G（#cFF0000LV1-LV3#G）#cFF000050%↑" )
		      AddText( sceneId, "进阶真·上古神器需要消耗：" )
		      AddText( sceneId, "#G相对应的神器#W1#G把" )
		      AddText( sceneId, "#cff99ff女娲石#W100#cff99ff个" )
		      AddText( sceneId, "#cFF0000提示：#G操作前，请先摘除宝石，否则会消失。" )
			AddNumText( sceneId, x045001_g_scriptId, "九霄焱阳 - 进阶", 6, 1061)
			AddNumText( sceneId, x045001_g_scriptId, "洪荒龙舞 - 进阶", 6, 1062)
			AddNumText( sceneId, x045001_g_scriptId, "达摩一叹 - 进阶", 6, 1063)
			AddNumText( sceneId, x045001_g_scriptId, "大衍天玄 - 进阶", 6, 1064)
			AddNumText( sceneId, x045001_g_scriptId, "末日王权 - 进阶", 6, 1065)
			AddNumText( sceneId, x045001_g_scriptId, "六道黄泉 - 进阶", 6, 1066)
			AddNumText( sceneId, x045001_g_scriptId, "太古飘翎 - 进阶", 6, 1067)
			AddNumText( sceneId, x045001_g_scriptId, "万世枯荣 - 进阶", 6, 1068)
			AddNumText( sceneId, x045001_g_scriptId, "无相绝踪 - 进阶", 6, 1069)
			--AddNumText( sceneId, x045001_g_scriptId, "#G天星耀阳环 - 蝶附体", 6, 1070)
			AddNumText( sceneId, x045001_g_scriptId, "改日再来", 9, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
       elseif GetNumText() == 1061 then
                     local nStoneId0 = 10305266
	       	local nStoneId1 = 30503144
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305266,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503144,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305257, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶真·上古神器成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000九霄焱阳#W和#G100个女娲石#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1062 then
                     local nStoneId0 = 10305267
	       	local nStoneId1 = 30503144
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305267,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503144,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305258, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶真·上古神器成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000洪荒龙舞#W和#G100个女娲石#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1063 then
                     local nStoneId0 = 10305268
	       	local nStoneId1 = 30503144
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305268,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503144,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305259, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶真·上古神器成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000达摩一叹#W和#G100个女娲石#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1064 then
                     local nStoneId0 = 10305269
	       	local nStoneId1 = 30503144
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305269,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503144,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305260, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶真·上古神器成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000大衍天玄#W和#G100个女娲石#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1065 then
                     local nStoneId0 = 10305270
	       	local nStoneId1 = 30503144
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305270,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503144,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305261, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶真·上古神器成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000末日王权#W和#G100个女娲石#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

			
	elseif GetNumText() == 1066 then
                     local nStoneId0 = 10305271
	       	local nStoneId1 = 30503144
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305271,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503144,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305262, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶真·上古神器成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000六道黄泉#W和#G100个女娲石#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1067 then
                     local nStoneId0 = 10305272
	       	local nStoneId1 = 30503144
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305272,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503144,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305263, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶真·上古神器成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000太古飘翎#W和#G100个女娲石#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


			
	elseif GetNumText() == 1068 then
                     local nStoneId0 = 10305273
	       	local nStoneId1 = 30503144
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305273,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503144,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305264, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶真·上古神器成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000万世枯荣#W和#G100个女娲石#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

			
	elseif GetNumText() == 1069 then
                     local nStoneId0 = 10305274
	       	local nStoneId1 = 30503144
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10305274,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503144,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305265, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶真·上古神器成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "Sorry，请检查您背包里是否具有#G上古神器#cFF0000无相绝踪#W和#G100个女娲石#W。"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 1070 then
                     local nStoneId0 = 10555162
	       	local nStoneId1 = 30503141
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555162,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503141,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555165, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，进阶真·上古神器成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

        elseif GetNumText() == 107 then
		BeginEvent( sceneId )
			AddText(sceneId,"如何制作神兵")
			AddText(sceneId,"#cffcc00二代102神器制作方法：#r#W玩家要先学习自己要做神器的#G图样#W。然后要拥有#G残缺的神节7级并#W使用#Y21#W个#G7级新莽神符#W之后拥有#cffcc00完整的神节7级#W。之后玩家要到#G苏州（252 150）#W即可做出102二代神器。")
			AddText(sceneId,"#cffcc00二代102神器如何通灵：#W#r玩家拥有#G二代102神器#W之后，可以到#G洛阳（151 102）#W使用#Y50个聚灵石#W进行通灵，通灵之后获得9星二代102神器。")
			AddText(sceneId,"#cffcc00如何进阶上古神器：#W#r玩家拥有#G9星二代102神器#W之后，可以到#G洛阳（151 102）#W使用#Y50个玄兵石#W给神器进阶，进阶之后获得上古神器。")
			AddText(sceneId,"#cffcc00如何获得材料：#W#r神器图样、聚灵石、玄兵石、神兵符、均可以赠点商店-神兵商店进行购买。也可以自己在游戏内刷BOSS副本获得。")

		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

       elseif GetNumText() == 1071 then
                     local nStoneId0 = 10555163
	       	local nStoneId1 = 30503141
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555163,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503141,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555163, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器熔炼附体成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

       elseif GetNumText() == 1072 then
                     local nStoneId0 = 10555164
	       	local nStoneId1 = 30503141
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555164,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503141,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555164, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器熔炼附体成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
			

       elseif GetNumText() == 1073 then
                     local nStoneId0 = 10555165
	       	local nStoneId1 = 30503141
              c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
                                  LuaFnDelAvailableItem(sceneId,selfId,10555165,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503141,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10555165, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜您，神器熔炼附体成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

  


	elseif GetNumText() == 4 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
end
--**********************************
-- 对话窗口信息提示
--**********************************
function x045001_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x045001_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x045001_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 4 )
	local str
	if nMsgIndex == 1 then
		str = format( x045001_g_strGongGaoInfo[1], PlayerName, strItemInfo )
	elseif nMsgIndex == 2 then
		str = format( x045001_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	elseif nMsgIndex == 3 then
		str = format( x045001_g_strGongGaoInfo[3], PlayerName, strItemInfo )
	else
		str = format( x045001_g_strGongGaoInfo[4], PlayerName, strItemInfo )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end

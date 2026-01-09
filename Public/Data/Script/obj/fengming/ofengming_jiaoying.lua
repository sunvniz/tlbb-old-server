--洛阳NPC
--抽奖
--普通
x045002_g_strGongGaoInfo = {
  "#{_INFOUSR%s}#H经过一番努力，终于收集全了合成龙纹装备需要的物品。#Y龙纹使者#W特赠送给其一个#{_INFOMSG%s}！", 
  "#{_INFOUSR%s} #cff99cc为#Y龙纹使者#cff99cc找齐了#Y灵魂装备精华#cff99cc，灵魂装备使者献上#{_INFOMSG%s}作为感谢！", 
  "#{_INFOUSR%s}#H在#Y李沧海处进行#R龙纹装备#I的升级中，一路过关斩将，不愧是功夫不负有心人,特赠与#{_INFOMSG%s}！",
  "#{_INFOUSR%s}#H经过不懈努力收集齐了#R龙纹装备升级#I的所有物品，获得#W#{_INFOMSG%s}#H，真是令人羡慕啊！", 
}
--**********************************
--事件交互入口
--**********************************
function x045002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "#cFF0000   师兄曾与我相约退隐江湖，隐居无量山中。岂料丁春秋毒害师兄将他退下悬崖，如今不知生死...你如何持有龙纹？是不是师兄还活着？请告知小女子，我将协助你升级龙纹之法！" )
		AddNumText( sceneId, x045002_g_ScriptId, "升级龙纹", 6, 500 )
		AddNumText( sceneId, x045002_g_ScriptId, "隐藏属性觉醒", 6, 600 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件列表选中一项
--**********************************
function x045002_OnEventRequest( sceneId, selfId, targetId, eventId)
	if GetNumText() == 500 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#cFF0000   升级龙纹等级，2-4级需要铸纹血玉50/60/70个、5-7级需要铸纹精玉50/60/70个、8-9级需要铸纹龙玉50/60个！龙纹少室山掉落，少室山掉落铸纹血玉，兵圣简单掉落铸纹精玉，兵圣困难掉落铸纹龙玉" )
			AddNumText(sceneId,x045002_g_ScriptId,"龙纹2级 龙纹",6,20010)
			AddNumText(sceneId,x045002_g_ScriptId,"龙纹3级 龙纹",6,20011)
			AddNumText(sceneId,x045002_g_ScriptId,"龙纹4级 龙纹",6,20012)
			AddNumText(sceneId,x045002_g_ScriptId,"龙纹5级 龙纹",6,20013)
			AddNumText(sceneId,x045002_g_ScriptId,"龙纹6级 龙纹",6,20014)
			AddNumText(sceneId,x045002_g_ScriptId,"龙纹7级 龙纹",6,20015)
			AddNumText(sceneId,x045002_g_ScriptId,"龙纹8级 龙纹",6,20016)
			AddNumText(sceneId,x045002_g_ScriptId,"龙纹9级 龙纹",6,20017)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 600 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#cFF0000   隐藏属性觉醒：需要2个9级龙纹，牺牲其中1个来刺激另外一个，使其觉醒。（很残忍吧⊙﹏⊙b）觉醒后属性有所提升，并增加属性攻击减抗和血上限！" )
		      AddNumText( sceneId, x045002_g_scriptId, "#c33ffcc龙纹·冰觉醒", 6, 20018)
		      AddNumText( sceneId, x045002_g_scriptId, "#c33ffcc龙纹·火觉醒", 6, 20019)
		      AddNumText( sceneId, x045002_g_scriptId, "#c33ffcc龙纹·玄觉醒", 6, 20020)
		      AddNumText( sceneId, x045002_g_scriptId, "#c33ffcc龙纹·毒觉醒", 6, 20021)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 20010 then
	       	local nStoneId0 = 38000152
	       	local nStoneId1 = 10157001
		local randtype = random(200)
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		if c0 >=50 and c1 >=1 then
		if randtype <= 200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,38000152,50)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,10157001,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157002, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045002_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜恭喜，你成功了！"
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId ) 
				LuaFnDelAvailableItem(sceneId,selfId,30503120,5)--删除物品
				strText = "#G这不是我的错..."
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end                     else
               	BeginEvent( sceneId ) 
					strText = "#G材料不够少来坑爹！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 20011 then
	       	local nStoneId0 = 38000152
	       	local nStoneId1 = 10157002
		local randtype = random(200)
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		if c0 >=60 and c1 >=1 then
		if randtype <= 200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,38000152,60)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,10157002,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157003, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045002_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜恭喜，你成功了！"
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId ) 
				LuaFnDelAvailableItem(sceneId,selfId,30503120,5)--删除物品
				strText = "#G这不是我的错..."
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end                     else
               	BeginEvent( sceneId ) 
					strText = "#G材料不够少来坑爹！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 20012 then
	       	local nStoneId0 = 38000152
	       	local nStoneId1 = 10157003
		local randtype = random(200)
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		if c0 >=70 and c1 >=1 then
		if randtype <= 200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,38000152,70)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,10157003,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157004, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045002_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜恭喜，你成功了！"
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId ) 
				LuaFnDelAvailableItem(sceneId,selfId,30503120,5)--删除物品
				strText = "#G这不是我的错..."
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end                     else
               	BeginEvent( sceneId ) 
					strText = "#G材料不够少来坑爹！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 20013 then
	       	local nStoneId0 = 38000164
	       	local nStoneId1 = 10157004
		local randtype = random(200)
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		if c0 >=50 and c1 >=1 then
		if randtype <= 200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,38000164,50)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,10157004,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157005, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045002_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜恭喜，你成功了！"
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId ) 
				LuaFnDelAvailableItem(sceneId,selfId,30503120,5)--删除物品
				strText = "#G这不是我的错..."
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end                     else
               	BeginEvent( sceneId ) 
					strText = "#G材料不够少来坑爹！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 20014 then
	       	local nStoneId0 = 38000164
	       	local nStoneId1 = 10157005
		local randtype = random(200)
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		if c0 >=60 and c1 >=1 then
		if randtype <= 200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,38000164,60)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,10157005,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157006, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045002_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜恭喜，你成功了！"
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId ) 
				LuaFnDelAvailableItem(sceneId,selfId,30503120,5)--删除物品
				strText = "#G这不是我的错..."
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end                     else
               	BeginEvent( sceneId ) 
					strText = "#G材料不够少来坑爹！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 20015 then
	       	local nStoneId0 = 38000164
	       	local nStoneId1 = 10157006
		local randtype = random(200)
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		if c0 >=70 and c1 >=1 then
		if randtype <= 200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,38000164,70)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,10157006,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157007, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045002_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜恭喜，你成功了！"
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId ) 
				LuaFnDelAvailableItem(sceneId,selfId,30503120,5)--删除物品
				strText = "#G这不是我的错..."
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end                     else
               	BeginEvent( sceneId ) 
					strText = "#G材料不够少来坑爹！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 20016 then
	       	local nStoneId0 = 38000165
	       	local nStoneId1 = 10157007
		local randtype = random(200)
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		if c0 >=50 and c1 >=1 then
		if randtype <= 200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,38000165,50)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,10157007,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157008, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045002_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜恭喜，你成功了！"
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId ) 
				LuaFnDelAvailableItem(sceneId,selfId,30503120,5)--删除物品
				strText = "#G这不是我的错..."
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end                     else
               	BeginEvent( sceneId ) 
					strText = "#G材料不够少来坑爹！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 20017 then
	       	local nStoneId0 = 38000165
	       	local nStoneId1 = 10157008
		local randtype = random(200)
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		if c0 >=60 and c1 >=1 then
		if randtype <= 200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,38000165,60)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,10157008,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157009, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045002_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜恭喜，你成功了！"
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId ) 
				LuaFnDelAvailableItem(sceneId,selfId,30503120,5)--删除物品
				strText = "#G这不是我的错..."
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end                     else
               	BeginEvent( sceneId ) 
					strText = "#G材料不够少来坑爹！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 20018 then
	       	local nStoneId0 = 10157009
		local randtype = random(200)
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		if c0 >=2  then
		if randtype <= 200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157009,2)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157010, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045002_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜恭喜，你成功了！"
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId ) 
				LuaFnDelAvailableItem(sceneId,selfId,30503120,5)--删除物品
				strText = "#G这不是我的错..."
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end                     else
               	BeginEvent( sceneId ) 
					strText = "#G材料不够少来坑爹！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 20019 then
	       	local nStoneId0 = 10157009
		local randtype = random(200)
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		if c0 >=2  then
		if randtype <= 200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157009,2)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157011, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045002_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜恭喜，你成功了！"
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId ) 
				LuaFnDelAvailableItem(sceneId,selfId,30503120,5)--删除物品
				strText = "#G这不是我的错..."
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end                     else
               	BeginEvent( sceneId ) 
					strText = "#G材料不够少来坑爹！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 20020 then
	       	local nStoneId0 = 10157009
		local randtype = random(200)
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		if c0 >=2  then
		if randtype <= 200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157009,2)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157012, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045002_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜恭喜，你成功了！"
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId ) 
				LuaFnDelAvailableItem(sceneId,selfId,30503120,5)--删除物品
				strText = "#G这不是我的错..."
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end                     else
               	BeginEvent( sceneId ) 
					strText = "#G材料不够少来坑爹！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 20021 then
	       	local nStoneId0 = 10157009
		local randtype = random(200)
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		if c0 >=2  then
		if randtype <= 200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157009,2)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157013, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x045002_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜恭喜，你成功了！"
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId ) 
				LuaFnDelAvailableItem(sceneId,selfId,30503120,5)--删除物品
				strText = "#G这不是我的错..."
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end                     else
               	BeginEvent( sceneId ) 
					strText = "#G材料不够少来坑爹！"
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
function x045002_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x045002_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x045002_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 4 )
	local str
	if nMsgIndex == 1 then
		str = format( x045002_g_strGongGaoInfo[1], PlayerName, strItemInfo )
	elseif nMsgIndex == 2 then
		str = format( x045002_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	elseif nMsgIndex == 3 then
		str = format( x045002_g_strGongGaoInfo[3], PlayerName, strItemInfo )
	else
		str = format( x045002_g_strGongGaoInfo[4], PlayerName, strItemInfo )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end


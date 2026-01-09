
-- 缥缈峰称号	20090220 by zhangguoxin
x894100_g_scriptId = 894100
--所拥有的事件ID列表

--征南先锋印
x894100_g_XuanFuID = 20310184

--兑换需求
x894100_g_Cost = {30,60,90,120,150,180,210}
--称号id
x894100_g_TitleID = {447,448,449,450,451,471,472,473,474,475,476,477,478,479,480}
--不同等级的失败提示
x894100_g_FailMsg = {"兑换此称号需要#Y征南先锋印#W30个","兑换此称号需要#Y征南先锋印#W60个","兑换此称号需要#Y征南先锋印#W90个","兑换此称号需要#Y征南先锋印#W120个","兑换此称号需要#Y征南先锋印#W150个","兑换此称号需要#Y征南先锋印#W180个","兑换此称号需要#Y征南先锋印#W210个"}
--称号等级
x894100_g_TitleLvNum = 7;
--称号idx 程序用
x894100_g_TitleIndex = 19;


function x894100_ChangePiaoMiaoTitle(sceneId, selfId, targetId,titleLv)
	
	--DeleteTitle(sceneId,selfId,x894100_g_TitleIndex);
	--合法性检查
	if titleLv < 1 and titleLv > x894100_g_TitleLvNum then
		return
	end
	
	--角色现有称号	
	local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
	
	if (titleLv == 1) then
		--是否已有称号
		if (HadTitleID == x894100_g_TitleID[1]
				or HadTitleID == x894100_g_TitleID[2]
				or HadTitleID == x894100_g_TitleID[3]
				or HadTitleID == x894100_g_TitleID[4]
				or HadTitleID == x894100_g_TitleID[5]
				or HadTitleID == x894100_g_TitleID[6]
				or HadTitleID == x894100_g_TitleID[7]
				or HadTitleID == x894100_g_TitleID[8]
				or HadTitleID == x894100_g_TitleID[9]
				or HadTitleID == x894100_g_TitleID[10]
				or HadTitleID == x894100_g_TitleID[11]
				or HadTitleID == x894100_g_TitleID[12]
				or HadTitleID == x894100_g_TitleID[13]
				or HadTitleID == x894100_g_TitleID[14]
				or HadTitleID == x894100_g_TitleID[15]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	

			return
		end
	end
	
	if (titleLv == 2) then
		--是否已有称号
		if (HadTitleID == x894100_g_TitleID[2]
				or HadTitleID == x894100_g_TitleID[3]
				or HadTitleID == x894100_g_TitleID[4]
				or HadTitleID == x894100_g_TitleID[5]
				or HadTitleID == x894100_g_TitleID[6]
				or HadTitleID == x894100_g_TitleID[7]
				or HadTitleID == x894100_g_TitleID[8]
				or HadTitleID == x894100_g_TitleID[9]
				or HadTitleID == x894100_g_TitleID[10]
				or HadTitleID == x894100_g_TitleID[11]
				or HadTitleID == x894100_g_TitleID[12]
				or HadTitleID == x894100_g_TitleID[13]
				or HadTitleID == x894100_g_TitleID[14]
				or HadTitleID == x894100_g_TitleID[15]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--是否有上一等级的称号
		if (HadTitleID ~= x894100_g_TitleID[1]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, x894100_g_FailMsg[titleLv])
			x894100_NotifyFailBox(sceneId, selfId, targetId, "您还未兑换上一称号")	

			return
		end
	end
	
	if (titleLv == 3) then
		--是否已有称号
		if (HadTitleID == x894100_g_TitleID[3]
				or HadTitleID == x894100_g_TitleID[4]
				or HadTitleID == x894100_g_TitleID[5]
				or HadTitleID == x894100_g_TitleID[6]
				or HadTitleID == x894100_g_TitleID[7]
				or HadTitleID == x894100_g_TitleID[8]
				or HadTitleID == x894100_g_TitleID[9]
				or HadTitleID == x894100_g_TitleID[10]
				or HadTitleID == x894100_g_TitleID[11]
				or HadTitleID == x894100_g_TitleID[12]
				or HadTitleID == x894100_g_TitleID[13]
				or HadTitleID == x894100_g_TitleID[14]
				or HadTitleID == x894100_g_TitleID[15]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--是否有上一等级的称号
		if (HadTitleID ~= x894100_g_TitleID[2]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, x894100_g_FailMsg[titleLv])
			x894100_NotifyFailBox(sceneId, selfId, targetId, "您还未兑换上一称号")	

			return
		end
	end
	
	if (titleLv == 4) then
		--是否已有称号
		if (HadTitleID == x894100_g_TitleID[4]
				or HadTitleID == x894100_g_TitleID[5]
				or HadTitleID == x894100_g_TitleID[6]
				or HadTitleID == x894100_g_TitleID[7]
				or HadTitleID == x894100_g_TitleID[8]
				or HadTitleID == x894100_g_TitleID[9]
				or HadTitleID == x894100_g_TitleID[10]
				or HadTitleID == x894100_g_TitleID[11]
				or HadTitleID == x894100_g_TitleID[12]
				or HadTitleID == x894100_g_TitleID[13]
				or HadTitleID == x894100_g_TitleID[14]
				or HadTitleID == x894100_g_TitleID[15]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--是否有上一等级的称号
		if (HadTitleID ~= x894100_g_TitleID[3]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, x894100_g_FailMsg[titleLv])
			x894100_NotifyFailBox(sceneId, selfId, targetId, "您还未兑换上一称号")	

			return
		end
	end

	if (titleLv == 5) then
		--是否已有称号
		if (HadTitleID == x894100_g_TitleID[5]
				or HadTitleID == x894100_g_TitleID[6]
				or HadTitleID == x894100_g_TitleID[7]
				or HadTitleID == x894100_g_TitleID[8]
				or HadTitleID == x894100_g_TitleID[9]
				or HadTitleID == x894100_g_TitleID[10]
				or HadTitleID == x894100_g_TitleID[11]
				or HadTitleID == x894100_g_TitleID[12]
				or HadTitleID == x894100_g_TitleID[13]
				or HadTitleID == x894100_g_TitleID[14]
				or HadTitleID == x894100_g_TitleID[15]) then

			x894100_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--是否有上一等级的称号
		if (HadTitleID ~= x894100_g_TitleID[4]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, x894100_g_FailMsg[titleLv])
			x894100_NotifyFailBox(sceneId, selfId, targetId, "您还未兑换上一称号")	

			return
		end
	end
	if (titleLv == 6) then
		--是否已有称号
		if (HadTitleID == x894100_g_TitleID[6]
				or HadTitleID == x894100_g_TitleID[7]
				or HadTitleID == x894100_g_TitleID[8]
				or HadTitleID == x894100_g_TitleID[9]
				or HadTitleID == x894100_g_TitleID[10]
				or HadTitleID == x894100_g_TitleID[11]
				or HadTitleID == x894100_g_TitleID[12]
				or HadTitleID == x894100_g_TitleID[13]
				or HadTitleID == x894100_g_TitleID[14]
				or HadTitleID == x894100_g_TitleID[15]) then

			x894100_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--是否有上一等级的称号
		if (HadTitleID ~= x894100_g_TitleID[5]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, x894100_g_FailMsg[titleLv])
			x894100_NotifyFailBox(sceneId, selfId, targetId, "您还未兑换上一称号")	

			return
		end
	end
	if (titleLv == 7) then
		--是否已有称号
		if (HadTitleID == x894100_g_TitleID[7]
				or HadTitleID == x894100_g_TitleID[8]
				or HadTitleID == x894100_g_TitleID[9]
				or HadTitleID == x894100_g_TitleID[10]
				or HadTitleID == x894100_g_TitleID[11]
				or HadTitleID == x894100_g_TitleID[12]
				or HadTitleID == x894100_g_TitleID[13]
				or HadTitleID == x894100_g_TitleID[14]
				or HadTitleID == x894100_g_TitleID[15]) then

			x894100_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--是否有上一等级的称号
		if (HadTitleID ~= x894100_g_TitleID[6]) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, x894100_g_FailMsg[titleLv])
			x894100_NotifyFailBox(sceneId, selfId, targetId, "您还未兑换上一称号")	
			return
		end
	end

	--检查物玄符量
	local checkRet = x894100_CheckXuanFu(sceneId,selfId,targetId,x894100_g_Cost[titleLv]);
	if (checkRet ~= 1) then
			x894100_NotifyFailBox(sceneId, selfId, targetId, x894100_g_FailMsg[titleLv])
			return
	end
	
	--扣除玄符
	local costRet = x894100_CostXuanFu(sceneId,selfId,targetId,x894100_g_Cost[titleLv]);
	if (costRet ~= 1) then
		x894100_NotifyFailBox(sceneId, selfId, targetId, "扣除物品失败！")
		return
	end
	
	--给予称号
	AwardTitle( sceneId, selfId, x894100_g_TitleIndex, x894100_g_TitleID[titleLv])
	--写audit日志 add by zhangguoxin 090226
	local guid = LuaFnObjId2Guid(sceneId, selfId);
	local LogInfo = format("LUAAUDIT_TITLE_GET,0X%08X,%d,",guid,x894100_g_TitleID[titleLv]);
	LuaFnAuditGeneralLog(LogInfo);
	--更新客户端
	DispatchAllTitle(sceneId,selfId)
	--设置当前称号
	SetCurTitle(sceneId,selfId,43,x894100_g_TitleID[titleLv])
	--关闭对话框
	x894100_CloseWindow(sceneId,selfId, targetId)
	--发送公告
	x894100_SendNotice(sceneId, selfId, targetId,titleLv)
	--放特效
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0)
	--醒目提示
	x894100_MsgBox(sceneId, selfId,"#{PMF_090302_6}")
end

--发送公告
function x894100_SendNotice(sceneId, selfId, targetId,lv)

	--合法性检查
	if lv < 1 and lv > x894100_g_TitleLvNum then
		return
	end
	local strformat;
	
	if (lv == 1) then
		strformat	= "从#{_INFOUSR%s}手中接过30枚征南先锋印#W后，#G楼兰#Y兵圣使者#W大喜道“侠之大者，为国为民。阁下为保我朝安危勇破兵圣奇阵，乃真大侠也！我已奏明圣上，以示表彰，特将#e339900#cFF0000侠者仁心#W称号赐封于你。"
	end
	if (lv == 2) then
		strformat	= "从#{_INFOUSR%s}手中接过60枚征南先锋印#W后，#G楼兰#Y兵圣使者#W大喜道“侠之大者，为国为民。阁下为保我朝安危勇破兵圣奇阵，乃真大侠也！我已奏明圣上，以示表彰，特将#e339900#cFF0000杀阵行者#W称号赐封于你"
	end
	if (lv == 3) then
		strformat	= "从#{_INFOUSR%s}手中接过90枚征南先锋印#W后，#G楼兰#Y兵圣使者#W大喜道“侠之大者，为国为民。阁下为保我朝安危勇破兵圣奇阵，乃真大侠也！我已奏明圣上，以示表彰，特将#e339900#cFF0000雄才伟略#W称号赐封于你。"
	end
	if (lv == 4) then
		strformat	= "从#{_INFOUSR%s}手中接过120枚征南先锋印#W后，#G楼兰#Y兵圣使者#W大喜道“侠之大者，为国为民。阁下为保我朝安危勇破兵圣奇阵，乃真大侠也！我已奏明圣上，以示表彰，特将#e339900#cFF0000先圣遗风#W称号赐封于你"
	end

	if (lv == 5) then
		strformat	= "从#{_INFOUSR%s}手中接过150枚征南先锋印#W后，#G楼兰#Y兵圣使者#W大喜道“侠之大者，为国为民。阁下为保我朝安危勇破兵圣奇阵，乃真大侠也！我已奏明圣上，以示表彰，特将#e339900#cFF0000鬼谷无双#W称号赐封于你"
	end
	if (lv == 6) then
		strformat	= "从#{_INFOUSR%s}手中接过180枚征南先锋印#W后，#G楼兰#Y兵圣使者#W大喜道“侠之大者，为国为民。阁下为保我朝安危勇破兵圣奇阵，乃真大侠也！我已奏明圣上，以示表彰，特将#e339900#cFF0000独步江湖#W称号赐封于你"
	end
	if (lv == 7) then
		strformat	= "从#{_INFOUSR%s}手中接过210枚征南先锋印#W后，#G楼兰#Y兵圣使者#W大喜道“侠之大者，为国为民。阁下为保我朝安危勇破兵圣奇阵，乃真大侠也！我已奏明圣上，以示表彰，特将#e339900#cFF0000天人合一#W称号赐封于你"
	end
	
	local strText = format(strformat, GetName(sceneId,selfId))	
	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
end

--检查物品
function x894100_CheckXuanFu(sceneId, selfId, targetId,num)
	if num <= 0 then
		return 0
	end
	
	local nCount =LuaFnGetAvailableItemCount(sceneId, selfId,x894100_g_XuanFuID)
	
	if (nCount < num) then
		return 0;
	end
	
	return 1;
end

--扣除物品
function x894100_CostXuanFu(sceneId, selfId, targetId,num)
	if num <= 0 then
		return 0
	end
	
	local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x894100_g_XuanFuID, num)
	if (ret1 < 1) then
		return 0;
	end
	
	return 1;
end

--关闭对话框
function x894100_CloseWindow(sceneId,selfId, targetId)
	BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
end

--**********************************
--任务入口函数
--**********************************
function x894100_OnDefaultEvent( sceneId, selfId, targetId )
	local nNum = GetNumText()
	
	--第一层界面
	if (nNum == 10) then
		BeginEvent(sceneId)
			AddText(sceneId,"   主持兵圣奇阵的#R耶律连城#W，乃是辽皇亲封的征南先锋，若能从他手中抢得#Y征南先锋印#W作为破阵佐证，我便可奏明圣上，为您请得江湖功名。#r    $N少侠，您想用手中的#Y征南先锋印#W换得如下哪种功名呢？")
			AddNumText( sceneId, x894100_g_scriptId, "   #G兑换称号#W——#e339900#cFF0000侠者仁心", 6, 21 )
			AddNumText( sceneId, x894100_g_scriptId, "   #G兑换称号#W——#e339900#cFF0000杀阵行者", 6, 22 )
			AddNumText( sceneId, x894100_g_scriptId, "   #G兑换称号#W——#e339900#cFF0000雄才伟略", 6, 23 )
			AddNumText( sceneId, x894100_g_scriptId, "   #G兑换称号#W——#e339900#cFF0000先圣遗风", 6, 24 )
			AddNumText( sceneId, x894100_g_scriptId, "   #G兑换称号#W——#e339900#cFF0000鬼谷无双", 6, 25 )
			AddNumText( sceneId, x894100_g_scriptId, "   #G兑换称号#W——#e339900#cFF0000独步江湖", 6, 26 )
			AddNumText( sceneId, x894100_g_scriptId, "   #G兑换称号#W——#e339900#cFF0000天人合一", 6, 27 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end

	if (nNum == 200) then
		BeginEvent(sceneId)
			AddText(sceneId,"   主持兵圣奇阵的#R耶律连城#W，乃是辽皇亲封的征南先锋，若能从他手中抢得#Y征南先锋印#W作为破阵佐证，我便可奏明圣上，为您请得江湖功名。#r    $N少侠，您想用手中的#Y兵圣称号#W换得如下哪种属性呢？")
			AddNumText( sceneId, x894100_g_scriptId, "#G领取属性#W——#e339900#cFF0000侠者仁心", 6, 210 )
			AddNumText( sceneId, x894100_g_scriptId, "#G领取属性#W——#e339900#cFF0000杀阵行者", 6, 220 )
			AddNumText( sceneId, x894100_g_scriptId, "#G领取属性#W——#e339900#cFF0000雄才伟略", 6, 230 )
			AddNumText( sceneId, x894100_g_scriptId, "#G领取属性#W——#e339900#cFF0000先圣遗风", 6, 240 )
			AddNumText( sceneId, x894100_g_scriptId, "#G领取属性#W——#e339900#cFF0000鬼谷无双", 6, 250 )
			AddNumText( sceneId, x894100_g_scriptId, "#G领取属性#W——#e339900#cFF0000独步江湖", 6, 260 )
			AddNumText( sceneId, x894100_g_scriptId, "#G领取属性#W——#e339900#cFF0000天人合一", 6, 270 )

			--AddNumText( sceneId, x894100_g_scriptId, "#G领取属性#W——#e339900#cFF0000三花聚顶", 6, 280 )
			--AddNumText( sceneId, x894100_g_scriptId, "#G领取属性#W——#e339900#cFF0000五气朝元", 6, 290 )
			--AddNumText( sceneId, x894100_g_scriptId, "#G领取属性#W——#e339900#cFF0000超凡武宗", 6, 300 )
			--AddNumText( sceneId, x894100_g_scriptId, "#G领取属性#W——#e339900#cFF0000惊世武尊", 6, 310 )
			--AddNumText( sceneId, x894100_g_scriptId, "#G领取属性#W——#e339900#cFF0000旷世武圣", 6, 320 )
			--AddNumText( sceneId, x894100_g_scriptId, "#G领取属性#W——#e339900#cFF0000无双武圣", 6, 330 )
			--AddNumText( sceneId, x894100_g_scriptId, "#G领取属性#W——#e339900#cFF0000绝世风华", 6, 340 )
			--AddNumText( sceneId, x894100_g_scriptId, "#G领取属性#W——#e339900#cFF0000超凡入圣", 6, 350 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
	--关于
	if (nNum == 11) then
		BeginEvent(sceneId)
			AddText(sceneId,"#eaf0c14#Y侠者仁心#r#G生命最大+2%#r物攻+5%#r物防+6%#r魔攻+5%#r魔防+6%#r")
			AddText(sceneId,"#eaf0c14#Y杀阵行者#r#G生命最大+5%#r物攻+10%#r物防+10%#r魔攻+10%#r魔防+10%#r")
			AddText(sceneId,"#eaf0c14#Y雄才伟略#r#G生命最大+8%#r物攻+15%#r物防+15%#r魔攻+15%#r魔防+15%#r")
			AddText(sceneId,"#eaf0c14#Y先圣遗风#r#G生命最大+10%#r物攻+20%#r物防+20%#r魔攻+20%#r魔防+20%#r")
			AddText(sceneId,"#eaf0c14#Y鬼谷无双#r#G生命最大+12%#r物攻+25%#r物防+25%#r魔攻+25%#r魔防+25%#r")
			AddText(sceneId,"#eaf0c14#Y独步江湖#r#G生命最大+15%#r物攻+30%#r物防+30%#r魔攻+30%#r魔防+30%#r")
			AddText(sceneId,"#eaf0c14#Y天人合一#r#G生命最大+18%#r物攻+35%#r物防+35%#r魔攻+35%#r魔防+35%#r")
			--AddText(sceneId,"#eaf0c14#Y三花聚顶#r#G生命最大+20%#r物攻+40%#r物防+40%#r魔攻+40%#r魔防+40%#r")
			--AddText(sceneId,"#eaf0c14#Y五气朝元#r#G生命最大+23%#r物攻+45%#r物防+45%#r魔攻+45%#r魔防+45%#r")
			--AddText(sceneId,"#eaf0c14#Y超凡武宗#r#G生命最大+25%#r物攻+50%#r物防+50%#r魔攻+50%#r魔防+50%#r")
			--AddText(sceneId,"#eaf0c14#Y惊世武尊#r#G生命最大+28%#r物攻+55%#r物防+55%#r魔攻+55%#r魔防+55%#r")
			--AddText(sceneId,"#eaf0c14#Y旷世武圣#r#G生命最大+30%#r物攻+60%#r物防+60%#r魔攻+60%#r魔防+60%#r")
			--AddText(sceneId,"#eaf0c14#Y无双武圣#r#G生命最大+33%#r物攻+65%#r物防+65%#r魔攻+65%#r魔防+65%#r")
			--AddText(sceneId,"#eaf0c14#Y绝世风华#r#G生命最大+35%#r物攻+70%#r物防+70%#r魔攻+70%#r魔防+70%#r")
			--AddText(sceneId,"#eaf0c14#Y超凡入圣#r#G生命最大+40%#r物攻+80%#r物防+80%#r魔攻+80%#r魔防+80%#r")


		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
	--第二层界面
	if (nNum == 21) then
		BeginEvent(sceneId)
			AddText(sceneId,"    若要获封称号，需要交予我#G30个#Y征南先锋印#W，以便我向圣上请功为你赐封，您确定要获封此称号吗?")
			AddNumText( sceneId, x894100_g_scriptId, "我要兑换", 6, 1 )
			AddNumText( sceneId, x894100_g_scriptId, "还是算了", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
	end
	
	if (nNum == 22) then
		BeginEvent(sceneId)
			AddText(sceneId,"    若要获封称号，需要交予我#G60个#Y征南先锋印#W，以便我向圣上请功为你赐封，您确定要获封此称号吗?")
			AddNumText( sceneId, x894100_g_scriptId, "我要兑换", 6, 2 )
			AddNumText( sceneId, x894100_g_scriptId, "还是算了", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
	end
	
	if (nNum == 23) then
		BeginEvent(sceneId)
			AddText(sceneId,"    若要获封称号，需要交予我#G90个#Y征南先锋印#W，以便我向圣上请功为你赐封，您确定要获封此称号吗?")
			AddNumText( sceneId, x894100_g_scriptId, "我要兑换", 6, 3 )
			AddNumText( sceneId, x894100_g_scriptId, "还是算了", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
	end
	
	if (nNum == 24) then
		BeginEvent(sceneId)
			AddText(sceneId,"    若要获封称号，需要交予我#G120个#Y征南先锋印#W，以便我向圣上请功为你赐封，您确定要获封此称号吗?")
			AddNumText( sceneId, x894100_g_scriptId, "我要兑换", 6, 4 )
			AddNumText( sceneId, x894100_g_scriptId, "还是算了", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
	end

	if (nNum == 25) then
		BeginEvent(sceneId)
			AddText(sceneId,"    若要获封称号，需要交予我#G150个#Y征南先锋印#W，以便我向圣上请功为你赐封，您确定要获封此称号吗?")
			AddNumText( sceneId, x894100_g_scriptId, "我要兑换", 6, 5 )
			AddNumText( sceneId, x894100_g_scriptId, "还是算了", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
	end
	if (nNum == 26) then
		BeginEvent(sceneId)
			AddText(sceneId,"    若要获封称号，需要交予我#G180个#Y征南先锋印#W，以便我向圣上请功为你赐封，您确定要获封此称号吗?")
			AddNumText( sceneId, x894100_g_scriptId, "我要兑换", 6, 6 )
			AddNumText( sceneId, x894100_g_scriptId, "还是算了", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
	end
	if (nNum == 27) then
		BeginEvent(sceneId)
			AddText(sceneId,"    若要获封称号，需要交予我#G210个#Y征南先锋印#W，以便我向圣上请功为你赐封，您确定要获封此称号吗?")
			AddNumText( sceneId, x894100_g_scriptId, "我要兑换", 6, 7 )
			AddNumText( sceneId, x894100_g_scriptId, "还是算了", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
	end

	if (nNum == 210) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[1] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5548, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "领取成功！")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"    领取失败，请检查是否拥有此称号！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	
	if (nNum == 220) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[2] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5549, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "领取成功！")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"    领取失败，请检查是否拥有此称号！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	
	if (nNum == 230) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[3] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5550, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "领取成功！")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"    领取失败，请检查是否拥有此称号！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end

	if (nNum == 240) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[4] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5551, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "领取成功！")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"    领取失败，请检查是否拥有此称号！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end

	if (nNum == 250) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[5] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5552, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "领取成功！")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"    领取失败，请检查是否拥有此称号！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 260) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[6] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5553, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "领取成功！")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"    领取失败，请检查是否拥有此称号！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 270) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[7] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5554, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "领取成功！")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"    领取失败，请检查是否拥有此称号！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 280) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[8] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5555, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "领取成功！")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"    领取失败，请检查是否拥有此称号！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 290) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[9] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5556, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "领取成功！")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"    领取失败，请检查是否拥有此称号！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 300) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[10] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5557, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "领取成功！")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"    领取失败，请检查是否拥有此称号！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 310) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[11] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5558, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "领取成功！")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"    领取失败，请检查是否拥有此称号！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 320) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[12] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5559, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "领取成功！")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"    领取失败，请检查是否拥有此称号！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 330) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[13] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5560, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "领取成功！")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"    领取失败，请检查是否拥有此称号！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 340) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[14] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5561, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "领取成功！")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"    领取失败，请检查是否拥有此称号！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end
	if (nNum == 350) then
		local HadTitleID = GetTitle(sceneId,selfId,x894100_g_TitleIndex)
		if HadTitleID == x894100_g_TitleID[15] then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5562, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			x894100_NotifyFailBox(sceneId, selfId, targetId, "领取成功！")	
		else
			BeginEvent(sceneId)
				AddText(sceneId,"    领取失败，请检查是否拥有此称号！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId,x894100_g_scriptId,0)
		end
	end

	if (nNum == 100) then
		--关闭对话框
		x894100_CloseWindow(sceneId,selfId, targetId)
	end
	
	--确认兑换
	if nNum >= 1 and nNum <= x894100_g_TitleLvNum then
		x894100_ChangePiaoMiaoTitle(sceneId, selfId, targetId,nNum)
	end
end

--**********************************
--列举事件
--**********************************
function x894100_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x894100_g_scriptId, "#G征南先锋#W—兑换—#G兵圣称号", 1, 10 )	
	AddNumText( sceneId, x894100_g_scriptId, "#ccc33cc兵圣称号#W—领取—#ccc33cc全属Buff", 3, 200 )	
	AddNumText( sceneId, x894100_g_scriptId, "——兵圣称号·属性查看——", 11, 11 )	
end




--**********************************
--检测接受条件
--**********************************
function x894100_CheckAccept( sceneId, selfId )
	return 1
end

--**********************************
--接受
--**********************************
function x894100_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x894100_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x894100_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x894100_CheckSubmit( sceneId, selfId )
end

--**********************************
--送出宠物蛋的公告
--**********************************
function x894100_ShowSystemNotice( sceneId, selfId, strItemInfo,iIndex )
		
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x894100_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--醒目信息提示
--**********************************
function x894100_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x894100_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x894100_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x894100_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x894100_OnItemChanged( sceneId, selfId, itemdataId )
end

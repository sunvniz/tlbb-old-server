
-- 修改[褚少微 2008.5.29 添加,魔兵天将,极品装备放出。]

-- 391201 套装兑换NPC

-- 梁师成

--脚本号
x391201_g_ScriptId = 391201

--所拥有的事件ID列表
x391201_g_eventList={391200,893063}

--**********************************
--事件列表
--**********************************
function x391201_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		for i, eventId in x391201_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end

		AddText(sceneId,"   眼下雁门关外战火焚天，天朝勇士亦是受制于胶着战局，北征之势再难寸进。日前又传密报言契丹一族将携奇阵而来，由是观之，大宋之兵已危在旦夕。#r    #Y由于兵圣副本比较复杂困难，建议玩家到本服网站查看详细攻略，以便更好的游戏。")


		AddNumText( sceneId, x391201_g_ScriptId, "关于兵圣奇阵", 0, 500 )
		
		AddNumText( sceneId, x391201_g_ScriptId, "离开……", 0, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x391201_OnDefaultEvent( sceneId, selfId,targetId )
	x391201_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x391201_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	
	if eventId == x391201_g_MenPaiTaoScriptId then
		if nNumText == 846 then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		elseif nNumText == 2500 or nNumText == 2600 or nNumText == 2700 then
			CallScriptFunction( eventId, "OnEventRequest",sceneId, selfId, targetId )
			return
		end
	end
	
	if nNumText == 0  then
		-- 关闭窗口
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end

	if nNumText == 500  then
		BeginEvent(sceneId)
		    AddText(sceneId,"兵圣奇阵完美官方副本，主要掉落龙纹升级材料，每日三次，最后成功击杀终极BOSS后可获得大量奖励，#r#Y    注意：BOSS技能完美和官方相同，小心哦，建议到一定级别再进行副本游戏！")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
end

--**********************************
--接受此NPC的任务
--**********************************
function x391201_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x391201_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x391201_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x391201_g_eventList do
		if missionScriptId == findId then
			x391201_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x391201_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x391201_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x391201_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--**********************************
--死亡事件
--**********************************
function x391201_OnDie( sceneId, selfId, killerId )
end

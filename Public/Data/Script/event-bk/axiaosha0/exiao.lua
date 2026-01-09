--血战雁门由啊萧杀制作q1552743098
--我第三个副本
--脚本号
x391200_g_ScriptId = 391200

x391200_g_CopySceneType = FUBEN_BINGSHENZHEN	--副本类型，定义在ScriptGlobal.lua里面

x391200_g_TickTime		= 1				--回调脚本的时钟时间（单位：秒/次）
x391200_g_NoUserTime	= 10			--副本中没有人后可以继续保存的时间（单位：秒）
x391200_g_Fuben_X			= 125			--进入副本的位置X
x391200_g_Fuben_Z			= 235			--进入副本的位置Z
x391200_g_FuBenTime		= 1*60*60	--副本关闭时间....

--BOSS表....
--是否可以挑战某个BOSS的标记列表....
x391200_g_BattleFlagTbl = 
{
	["XiaoYiFeng"]			= 8,	--是否可以挑战哈大霸...
	["XiaoRuJun"]	= 9,	--是否可以挑战桑土公....
	["YeLvYan"]			= 10,	--是否可以挑战乌老大....
	["ShuangZi"]		= 11,	--是否可以挑战双子....
	["YeLvLian"]		= 12,	--是否可以挑战李秋水....
	["PlayHp"]		= 21,	--玩家血量....
}

--场景变量索引....是否可以挑战某个BOSS的标记....
-- 0=不能挑战 1=可以挑战 2=已经挑战过了
x391200_g_IDX_BattleFlag_XiaoYiFeng			= 8
x391200_g_IDX_BattleFlag_XiaoRuJun	= 9
x391200_g_IDX_BattleFlag_YeLvYan		= 10
x391200_g_IDX_BattleFlag_Shuangzi		= 11
x391200_g_IDX_BattleFlag_YeLvLian	= 12
x391200_g_IDX_BattleFlag_PlayHp	= 21

x391200_g_IDX_FuBenOpenTime		= 13	--副本建立的时间....
x391200_g_IDX_FuBenLifeStep		= 14	--副本生命期的step....(包括建立NPC....关闭倒计时提示....)

--场景变量索引....通用的缥缈峰计时器....主要用于激活BOSS战斗....
x391200_g_IDX_BQZTimerStep			= 15
x391200_g_IDX_BQZTimerScriptID	= 16

--场景变量索引....乌老大死亡的计时器....用于处理死亡逻辑....
x391200_g_IDX_YeLvYanDieStep				= 17
x391200_g_IDX_YeLvYanDieScriptID		= 18
x391200_g_IDX_YeLvYanDiePosX				=	19
x391200_g_IDX_YeLvYanDiePosY				=	20


--**********************************
--任务入口函数....
--**********************************
function x391200_OnDefaultEvent( sceneId, selfId, targetId )

	--检测是否可以进入副本....
	local ret, msg = x391200_CheckCanEnter( sceneId, selfId, targetId )
	if 1 ~= ret then
		BeginEvent(sceneId)
			AddText(sceneId,msg)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--关闭NPC对话窗口....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

	x391200_MakeCopyScene( sceneId, selfId )
	local	nam	= LuaFnGetName( sceneId, selfId )
	BroadMsgByChatPipe( sceneId, selfId, "#Y雁门关外，耶律洪基不顾与萧峰之誓言，带领大军重新南征。#gff00f0胸怀报国之心#gffff00"..nam.."#gff00f0率队在凤鸣镇进入#gffff00血战雁门关#gff00f0副本,誓将耶律洪基大军击退。", 4 )

end

--**********************************
--列举事件
--**********************************
function x391200_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x391200_g_ScriptId, "#cFF0000血战雁门关（普通模式）", 10, 1 )

end

--**********************************
--检测是否可以进入此副本....
--**********************************
function x391200_CheckCanEnter( sceneId, selfId, targetId )

	--是否有队伍....
	if LuaFnHasTeam(sceneId,selfId) ~= 1 then
		return 0, "#{PMF_20080521_02}"
	end

	--是不是队长....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		return 0, "#{PMF_20080521_03}"
	end

	--人数是否够....
	if GetTeamSize(sceneId,selfId) < 1 then
		return 0, "人数不足3人，不能进入！"
	end

	--是否都在附近....
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)
	if GetTeamSize(sceneId,selfId) ~= NearTeamSize then
		return 0, "#{PMF_20080521_05}"
	end

	local Humanlist = {}
	local nHumanNum = 0

	--是否有人不够90级....
	for i=0, NearTeamSize-1 do
		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		if GetLevel( sceneId, PlayerId ) < 110 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end
	end

	if nHumanNum > 0 then

		local msg = "    队伍当中的"
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. "，"
		end
		msg = msg .. Humanlist[nHumanNum-1] .. "的修为不足120级，还是不要去为妙。"
		return 0, msg

	end


	--是否有人今天做过3次了....
	nHumanNum = 0
	local CurDayTime = GetDayTime()
	for i=0, NearTeamSize-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_HEXIE_GUANGHUAN_DATE )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )
	
		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 1 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end

	end

	if nHumanNum > 10 then

		local msg = "    "
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. "，"
		end
		msg = msg .. Humanlist[nHumanNum-1] .. "本日已经挑战过1次了。"
		return 0, msg

	end

	return 1

end

--**********************************
--创建副本....
--**********************************
function x391200_MakeCopyScene( sceneId, selfId )

	local x = 0
	local z = 0
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, "xuezhanymg.nav")
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x391200_g_NoUserTime*1000)
	LuaFnSetCopySceneData_Timer(sceneId, x391200_g_TickTime*1000)
	LuaFnSetCopySceneData_Param(sceneId, 0, x391200_g_CopySceneType)
	LuaFnSetCopySceneData_Param(sceneId, 1, x391200_g_ScriptId)
	LuaFnSetCopySceneData_Param(sceneId, 2, 0)
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)
	LuaFnSetCopySceneData_Param(sceneId, 4, x)
	LuaFnSetCopySceneData_Param(sceneId, 5, z)
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
	LuaFnSetCopySceneData_Param(sceneId, 7, 0)

	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end

	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BattleFlag_XiaoYiFeng, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BattleFlag_XiaoRuJun, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BattleFlag_YeLvYan, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BattleFlag_Shuangzi, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BattleFlag_YeLvLian, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BattleFlag_PlayHp, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenOpenTime, LuaFnGetCurrentTime() )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerScriptID, -1 )

	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieScriptID, -1 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosX, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosY, 0 )

	LuaFnSetSceneLoad_Area( sceneId, "xuezhanymg_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "xuezhanymg_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"副本创建成功！");
		else
			AddText(sceneId,"副本数量已达上限，请稍候再试！");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--副本事件....
--**********************************
function x391200_OnCopySceneReady( sceneId, destsceneId )

	--进入副本的规则
	-- 1，如果这个玩家没有组队，就传送这个玩家自己进入副本
	-- 2, 如果玩家有队伍，但是玩家不是队长，就传送自己进入副本
	-- 3，如果玩家有队伍，并且这个玩家是队长，就传送自己和附近队友一起进去

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
	local CurDayTime = GetDayTime()
	for	i=0,nearteammembercount-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_HEXIE_GUANGHUAN_DATE )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )

		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 11 then
			BeginEvent( sceneId )
				AddText( sceneId, "  您今天已经超过挑战副本上限，请您明天再来。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		return
		end
	end

	--统计创建副本次数....
	--AuditBQZCreateFuben( sceneId, leaderObjId )

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then
		NewWorld( sceneId, leaderObjId, destsceneId, x391200_g_Fuben_X, x391200_g_Fuben_Z) ;
	else
		local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
		local mems = {}
		for	i=0,nearteammembercount-1 do
			mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
			NewWorld( sceneId, mems[i], destsceneId, x391200_g_Fuben_X, x391200_g_Fuben_Z)
		end
	end

end

--**********************************
--副本场景定时器事件....
--**********************************
function x391200_OnCopySceneTimer( sceneId, nowTime )

	x391200_TickFubenLife( sceneId, nowTime )

	x391200_TickBQZTimer( sceneId, nowTime )

	x391200_TickYeLvYanDieTimer( sceneId, nowTime )

	x391200_TickJianWuArea( sceneId, nowTime )

end

--**********************************
--有玩家进入副本事件....
--**********************************
function x391200_OnPlayerEnter( sceneId, selfId )

	--设置死亡事件....
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x391200_g_Fuben_X, x391200_g_Fuben_Z )

	--设置挑战过一次缥缈峰....
	local lastTime = GetMissionData( sceneId, selfId, MD_HEXIE_GUANGHUAN_DATE )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )
	local CurDayTime = GetDayTime()

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	lastDayCount = lastDayCount + 1
	lastTime = lastDayTime * 100 + lastDayCount
	SetMissionData( sceneId, selfId, MD_HEXIE_GUANGHUAN_DATE, lastTime )

end

--**********************************
--有玩家在副本中死亡事件....
--**********************************
function x391200_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--提示所有副本内玩家....
--**********************************
function x391200_TipAllHuman( sceneId, Str )

	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, Str)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, PlayerId)
		end
	end

end

--**********************************
--Tick副本生命期....
--**********************************
function x391200_TickFubenLife( sceneId, nowTime )

	local openTime = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenOpenTime )
	local leftTime = openTime + x391200_g_FuBenTime - LuaFnGetCurrentTime()
	local lifeStep = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep )

	if lifeStep == 15 then

		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 16 )

		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		local oldSceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )
		local oldX = LuaFnGetCopySceneData_Param( sceneId, 4 )
		local oldZ = LuaFnGetCopySceneData_Param( sceneId, 5 )
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
				NewWorld( sceneId, PlayerId, oldSceneId, oldX, oldZ )
			end
		end

		return

	end

	if lifeStep == 39 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 38 )
		x391200_TipAllHuman( sceneId, "副本将在30秒後关闭。" )
		return
	end
	if lifeStep == 38 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 37 )
		x391200_TipAllHuman( sceneId, "副本将在29秒後关闭。" )
		return
	end
	if lifeStep == 37 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 36 )
		x391200_TipAllHuman( sceneId, "副本将在28秒後关闭。" )
		return
	end
	if lifeStep == 36 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 35 )
		x391200_TipAllHuman( sceneId, "副本将在27秒後关闭。" )
		return
	end
	if lifeStep == 35 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 34 )
		x391200_TipAllHuman( sceneId, "副本将在26秒後关闭。" )
		return
	end
	if lifeStep == 34 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 33 )
		x391200_TipAllHuman( sceneId, "副本将在25秒後关闭。" )
		return
	end
	if lifeStep == 33 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 32 )
		x391200_TipAllHuman( sceneId, "副本将在24秒後关闭。" )
		return
	end
	if lifeStep == 32 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 31 )
		x391200_TipAllHuman( sceneId, "副本将在23秒後关闭。" )
		return
	end
	if lifeStep == 31 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 30 )
		x391200_TipAllHuman( sceneId, "副本将在22秒後关闭。" )
		return
	end
	if lifeStep == 30 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 29 )
		x391200_TipAllHuman( sceneId, "副本将在21秒後关闭。" )
		return
	end
	if lifeStep == 29 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 28 )
		x391200_TipAllHuman( sceneId, "副本将在20秒後关闭。" )
		return
	end
	if lifeStep == 28 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 27 )
		x391200_TipAllHuman( sceneId, "副本将在19秒後关闭。" )
		return
	end
	if lifeStep == 27 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 26 )
		x391200_TipAllHuman( sceneId, "副本将在18秒後关闭。" )
		return
	end
	if lifeStep == 26 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 25 )
		x391200_TipAllHuman( sceneId, "副本将在17秒後关闭。" )
		return
	end
	if lifeStep == 25 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 24 )
		x391200_TipAllHuman( sceneId, "副本将在16秒後关闭。" )
		return
	end
	if lifeStep == 24 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 23 )
		x391200_TipAllHuman( sceneId, "副本将在15秒後关闭。" )
		return
	end
	if lifeStep == 23 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 22 )
		x391200_TipAllHuman( sceneId, "副本将在14秒後关闭。" )
		return
	end
	if lifeStep == 22 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 21 )
		x391200_TipAllHuman( sceneId, "副本将在13秒後关闭。" )
		return
	end
	if lifeStep == 21 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 20 )
		x391200_TipAllHuman( sceneId, "副本将在12秒後关闭。" )
		return
	end
	if lifeStep == 20 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 19 )
		x391200_TipAllHuman( sceneId, "副本将在11秒後关闭。" )
		return
	end
	if lifeStep == 19 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 18 )
		x391200_TipAllHuman( sceneId, "副本将在10秒後关闭。" )
		return
	end
	if lifeStep == 18 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 17 )
		x391200_TipAllHuman( sceneId, "副本将在9秒後关闭。" )
		return
	end
	if lifeStep == 17 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 16 )
		x391200_TipAllHuman( sceneId, "副本将在8秒後关闭。" )
		return
	end
	if lifeStep == 16 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 10 )
		x391200_TipAllHuman( sceneId, "副本将在7秒後关闭。" )
		return
	end
	if lifeStep == 14 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 15 )
		x391200_TipAllHuman( sceneId, "副本将在1秒後关闭。" )
		return
	end

	if lifeStep == 13 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 14 )
		x391200_TipAllHuman( sceneId, "副本将在2秒後关闭。" )
		return
	end

	if lifeStep == 12 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 13 )
		x391200_TipAllHuman( sceneId, "副本将在3秒後关闭。" )
		return
	end

	if lifeStep == 11 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 12 )
		x391200_TipAllHuman( sceneId, "副本将在4秒後关闭。" )
		return
	end

	if lifeStep == 10 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 11 )
		x391200_TipAllHuman( sceneId, "副本将在5秒後关闭。" )
		return
	end

	if leftTime <= 10 and lifeStep == 9 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 10 )
		x391200_TipAllHuman( sceneId, "副本将在10秒後关闭。" )
		return
	end

	if leftTime <= 30 and lifeStep == 8 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 9 )
		x391200_TipAllHuman( sceneId, "副本将在30秒後关闭。" )
		return
	end

	if leftTime <= 60 and lifeStep == 7 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 8 )
		x391200_TipAllHuman( sceneId, "副本将在1分钟後关闭。" )
		return
	end

	if leftTime <= 120 and lifeStep == 6 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 7 )
		x391200_TipAllHuman( sceneId, "副本将在2分钟後关闭。" )
		return
	end

	if leftTime <= 180 and lifeStep == 5 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 6 )
		x391200_TipAllHuman( sceneId, "副本将在3分钟後关闭。" )
		return
	end

	if leftTime <= 300 and lifeStep == 4 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 5 )
		x391200_TipAllHuman( sceneId, "副本将在5分钟後关闭。" )
		return
	end

	if leftTime <= 900 and lifeStep == 3 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 4 )
		x391200_TipAllHuman( sceneId, "副本将在15分钟後关闭。" )
		return
	end

	if leftTime <= 1800 and lifeStep == 2 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 3 )
		x391200_TipAllHuman( sceneId, "副本将在30分钟後关闭。" )
		return
	end

	if leftTime <= 3600 and lifeStep == 1 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 2 )
		x391200_TipAllHuman( sceneId, "副本将在60分钟後关闭。" )
		return
	end

	--初始化副本内的NPC....
	if lifeStep == 0 then

	local MstIdA = LuaFnCreateMonster(sceneId, 45220, 125, 244, 3, 128, 391211 )
	SetUnitReputationID( sceneId, MstIdA, MstIdA, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 1 )

		return
	end

end

--**********************************
--Tick缥缈峰计时器....
--**********************************
function x391200_TickBQZTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerStep )
	if step <= 0 then
		return
	end
	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerScriptID )

	--回调指定脚本的OnTimer....
	CallScriptFunction( scriptID, "OnBQZTimer", sceneId, step )

	--如果已经走完所有step则关闭计时器....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerScriptID, -1 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerStep, step )
	end

end

--**********************************
--开启缥缈峰计时器....
--**********************************
function x391200_OpenBQZTimer( sceneId, allstep, ScriptID )

	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerScriptID, ScriptID )

end

--**********************************
--当前缥缈峰计时器是否激活....
--**********************************
function x391200_IBQZSTimerRunning( sceneId )

	local step = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerStep )
	if step > 0 then
		return 1
	else
		return 0
	end

end

--**********************************
--Tick乌老大死亡计时器....
--**********************************
function x391200_TickYeLvYanDieTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieStep )
	if step <= 0 then
		return
	end

	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieScriptID )
	local posX = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosX )
	local posY = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosY )

	--回调指定脚本的OnTimer....
	CallScriptFunction( scriptID, "OnXiaoYiFengDieTimer", sceneId, step, posX, posY )

	--如果已经走完所有step则关闭计时器....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieScriptID, -1 )
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosX, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosY, 0 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieStep, step )
	end

end

--**********************************
--开启乌老大死亡计时器....
--**********************************
function x391200_OpenYeLvYanDieTimer( sceneId, allstep, ScriptID, posX, posY )

	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieScriptID, ScriptID )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosX, posX )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosY, posY )

end

--**********************************
--Tick剑舞区域....
--只要玩家站在场景里的6个光柱内....每秒都能获得一个免疫剑舞的buff....
--**********************************
function x391200_TickJianWuArea( sceneId, nowTime )

end

--**********************************
--创建指定BOSS....
--**********************************
--**********************************
--寻找指定BOSS....
--**********************************
function x391200_FindBOSS( sceneId, name )

	local BOSSData = x391200_g_BOSSList[name]
	if not BOSSData then
		return -1
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if BOSSData.DataID == GetMonsterDataID( sceneId, MonsterId ) then
			return MonsterId
		end
	end

	return -1

end

--**********************************
--检测当前是否已经存在一个BOSS了....
--**********************************
function x391200_CheckHaveBOSS( sceneId )

	local BossList = {}
	local nBossNum = 0

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
				if (GetName(sceneId, MonsterId)  == "耶律洪基" ) or (GetName(sceneId, MonsterId)  == "耶律元" ) or (GetName(sceneId, MonsterId)  == "耶律宛" ) or (GetName(sceneId, MonsterId)  == "耶律辛" ) then
					nBossNum = nBossNum + 1
				end
			end

	if nBossNum > 0 then
		local msg = "boss正在战斗中"
		return 1, msg
	end

	return 0, ""

end

--**********************************
--获取是否可以挑战某个BOSS的标记....
--**********************************
function x391200_GetBossBattleFlag( sceneId )

	return LuaFnGetCopySceneData_Param( sceneId, 8 )

end

--**********************************
--设置是否可以挑战某个BOSS的标记....
--**********************************
function x391200_SetBossBattleFlag( sceneId, bCan )
	LuaFnSetCopySceneData_Param(sceneId, 8, bCan)
	if bCan == 5 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 39 )
end
end

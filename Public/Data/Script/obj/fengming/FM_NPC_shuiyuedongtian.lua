--玄海NPC
--传送

x045008_g_ScriptId	= 045008
x045008_g_Yinpiao = 40002000 

x045008_g_Impact_NotTransportList = { 5929, 5944 } -- 禁止传送的Impact
x045008_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- 禁止传送的Impact提示信息
x045008_g_TalkInfo="    #Y凤鸣镇#W百里之外的无边的海域名为#Y玄海#W。相传在上古时期，炎黄、九黎二族曾决战于此，九黎大圣蚩尤被封印于海底，#Y天荒古镇#W才得享数千年太平。而如令#G禹王九鼎#W现世，九黎遗民也纷纷从海眼中现身，整片海域也变得危险重重。"
x045008_g_TalkInfo2="    #W这位英雄，若你想入得#Y玄海#W,我定不阻拦。但前提是你武艺超凡，且习得#Y避水之法#W。这样我才能引你前往#Y水月洞天#W，并前往#G玄海#W之中。 "

--**********************************
--事件交互入口
--**********************************
function x045008_OnDefaultEvent( sceneId, selfId,targetId )
	
	-- 检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
	if GetItemCount(sceneId, selfId, x045008_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
		AddText( sceneId, "  你身上有银票，正在跑商！我不能帮助你。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

		BeginEvent( sceneId )

		AddText( sceneId, x045008_g_TalkInfo)
		AddText( sceneId, x045008_g_TalkInfo2) 
		AddNumText( sceneId, x045008_g_ScriptId, "前往水月洞天", 9, 1 )
	
	
	        EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--事件列表选中一项
--**********************************
function x045008_OnEventRequest( sceneId, selfId, targetId, eventId )

	--漕运禁止传送....
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		num=LuaFnGetFollowedMembersCount( sceneId, selfId)
		local mems = {}
		for	i=0,num-1 do
			mems[i] = GetFollowedMember(sceneId, selfId, i)
			if mems[i] == -1 then
				return
			end
			if IsHaveMission(sceneId,mems[i],4021) > 0 then
				x045008_MsgBox( sceneId, selfId, targetId, "  你队伍成员中有人有漕运货舱在身，我们驿站不能为你提供传送服务。" )
				return
			end
		end
	end

	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x045008_MsgBox( sceneId, selfId, targetId, "  你有漕运货舱在身，我们驿站不能为你提供传送服务。" )
		return
	end

	--检测Impact状态驻留效果
	for i, ImpactId in x045008_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			x045008_MsgBox( sceneId, selfId, targetId, x045008_g_TalkInfo_NotTransportList[i] )			
			return 0
		end
	end
        local arg=GetNumText()
	--去水月洞天....
	if arg == 1 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 546, 36, 68 )
		return
	end
end

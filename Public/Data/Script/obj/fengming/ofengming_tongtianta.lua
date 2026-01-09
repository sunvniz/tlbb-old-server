x045003_g_ScriptId	= 045003

--**********************************
--事件交互入口
--**********************************
function x045003_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "通天塔，是天外江湖中最险恶的藏宝地，由佛经中的“天龙八部”真身镇守，非武艺绝高者不得进入。高耸入云的通天塔里，到底是怎样的光景？塔顶究竟隐藏着什么秘密？与八部神魔发起的试炼相比，来自身边的危险更值得警惕！#W（90级以上方可进入）")
		AddNumText(sceneId, x045003_g_ScriptId,"通天塔试炼", 6, 101)
		--AddNumText(sceneId, x045003_g_ScriptId,"你看，我这里有些零钱。。", 5, 102)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end

--**********************************
--事件列表选中一项
--**********************************
function x045003_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 101  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev>=90 then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 581, 256, 378 )
		end
	elseif GetNumText() == 102  then
		local reply = CostMoney(sceneId,selfId,5000000)
		if reply == -1 then
			x045003_MsgBox( sceneId, selfId, targetId, "    #Y小子，钱呢，你不说你有钱的吗?麻痹，死穷鬼，没钱想忽悠我，滚远点！" )
			return	
		end
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 584, 258, 310 )
	end
end

--**********************************
--对话窗口信息提示
--**********************************
function x045003_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

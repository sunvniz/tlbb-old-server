--Thú cßÞi

x999996_g_scriptId = 999996


x999996_g_Mount_Pos = 108 --V¸ trí ô thú cßÞi trên ngß¶i nhân v§t

x999996_g_Rider = {} --Impact cüa thú cßÞi (StandardImpact.txt)

x999996_g_Rider[10141000]={Impact=4912,RecipeId=446} --Løc Hành Ðiêu (VC)
x999996_g_Rider[10141254]={Impact=4741,RecipeId=-1}
x999996_g_Rider[10141258]={Impact=4742,RecipeId=-1}
x999996_g_Rider[10141263]={Impact=4743,RecipeId=-1}
x999996_g_Rider[10141271]={Impact=4745,RecipeId=-1}
x999996_g_Rider[10141275]={Impact=4746,RecipeId=-1}
x999996_g_Rider[10141292]={Impact=4748,RecipeId=-1}
x999996_g_Rider[10141300]={Impact=4750,RecipeId=-1}
x999996_g_Rider[10141304]={Impact=4751,RecipeId=-1}
x999996_g_Rider[10141308]={Impact=4752,RecipeId=-1}
x999996_g_Rider[10141315]={Impact=4753,RecipeId=-1}
x999996_g_Rider[10141317]={Impact=4754,RecipeId=-1}
x999996_g_Rider[10141323]={Impact=4755,RecipeId=-1}
x999996_g_Rider[10141328]={Impact=4756,RecipeId=-1}
x999996_g_Rider[10141333]={Impact=4757,RecipeId=-1}
x999996_g_Rider[10141335]={Impact=4758,RecipeId=-1}
x999996_g_Rider[10141336]={Impact=4759,RecipeId=-1}
x999996_g_Rider[10141337]={Impact=4760,RecipeId=-1}
x999996_g_Rider[10141338]={Impact=4761,RecipeId=-1}
x999996_g_Rider[10141366]={Impact=4762,RecipeId=-1}
x999996_g_Rider[10141370]={Impact=4763,RecipeId=-1}
x999996_g_Rider[10141380]={Impact=4764,RecipeId=-1}

function x999996_OnDefaultEvent(sceneId,selfId,bagIndex)
end

function x999996_IsSkillLikeScript(sceneId,selfId)
	return 1
end

function x999996_CancelImpacts(sceneId,selfId)
	local nIndex=LuaFnGetItemTableIndexByIndex(sceneId,selfId,x999996_g_Mount_Pos) --Index thú cßÞi ðang trang b¸ trên ngß¶i

	if not x999996_g_Rider[nIndex] then
		return 0
	end
	if LuaFnCancelSpecificImpact(sceneId,selfId,x999996_g_Rider[nIndex].Impact)>0 then
		return 1
	else
		return 0
	end
end

function x999996_OnConditionCheck(sceneId,selfId)
	local nIndex=LuaFnGetItemTableIndexByIndex(sceneId,selfId,x999996_g_Mount_Pos)
	if (x999996_g_Rider[nIndex].RecipeId ~= -1) then
		if LuaFnIsPrescrLearned(sceneId,selfId,x999996_g_Rider[nIndex].RecipeId)<1 then
			x999996_ShowTips(sceneId,selfId,"Các hÕ chßa h÷c kÛ nång ði«u khi¬n thú cßÞi này!")
			return 0
		end
	end
	if LuaFnGetItemTableIndexByIndex(sceneId,selfId,x999996_g_Mount_Pos)~=0 then
		return 1
	end
	x999996_ShowTips(sceneId,selfId,"Các hÕ c¥n trang b¸ thú cßÞi!")
	return 0
end

function x999996_OnDeplete(sceneId,selfId)
	return 1
end

function x999996_OnActivateOnce(sceneId,selfId)
	local nIndex=LuaFnGetItemTableIndexByIndex(sceneId,selfId,x999996_g_Mount_Pos)
	if not x999996_g_Rider[nIndex] then
		x999996_ShowTips(sceneId,selfId,"Thú cßÞi này hi®n chßa ðßþc c§p nh¤t!")
		return 0
	end
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x999996_g_Rider[nIndex].Impact,0)
	x999996_ShowTips(sceneId,selfId,"Tri®u h°i thú cßÞi thành công!")
	return 1
end

function x999996_OnActivateEachTick(sceneId,selfId)
	return 1
end

function x999996_ShowTips(sceneId,selfId,Tip)
	BeginEvent(sceneId)
		AddText(sceneId,Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

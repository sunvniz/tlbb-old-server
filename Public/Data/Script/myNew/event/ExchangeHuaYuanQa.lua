x980001_g_scriptId = 980001

x980001_g_AwardItemList = {
	{need = 3, itemList = {{item = 30501213, num = 1},{item = 30501222, num = 1},{item = 30501231, num = 1},{item = 30501240, num = 1},{item = 30501195, num = 1},{item = 30501204, num = 1},{item = 30501322, num = 1},{item = 30501331, num = 1}}},
	{need = 5, itemList = {{item = 30501214, num = 1},{item = 30501223, num = 1},{item = 30501232, num = 1},{item = 30501241, num = 1},{item = 30501196, num = 1},{item = 30501205, num = 1},{item = 30501323, num = 1},{item = 30501332, num = 1}}},
	{need = 25, itemList = {{item = 30501215, num = 1},{item = 30501224, num = 1},{item = 30501233, num = 1},{item = 30501242, num = 1},{item = 30501197, num = 1},{item = 30501206, num = 1},{item = 30501324, num = 1},{item = 30501333, num = 1}}},
	{need = 50, itemList = {{item = 30501216, num = 1},{item = 30501225, num = 1},{item = 30501234, num = 1},{item = 30501243, num = 1},{item = 30501198, num = 1},{item = 30501207, num = 1},{item = 30501325, num = 1},{item = 30501334, num = 1}}},
	{need = 7, itemList = {{item = 50302001, num = 1},{item = 50302002, num = 1},{item = 50302003, num = 1},{item = 50302004, num = 1},{item = 50303001, num = 1},{item = 50314001, num = 1},{item = 50313006, num = 1},{item = 50313004, num = 1}}},
	{need = 5, itemList = {{item = 30900045, num = 1},{item = 30008048, num = 1},{item = 30503133, num = 7},{item = 30900014, num = 1}}},
	{need = 100, itemList = {{item = 30402021, num = 1},{item = 30402022, num = 1},{item = 30402023, num = 1},{item = 30402024, num = 1}}}
}
function x980001_OnDefaultEvent(sceneId, selfId, targetId)
	local key = GetNumText()
	if (key == 100) then
		BeginEvent(sceneId)
		AddNumText(sceneId, x980001_g_scriptId, "#Y3 #WHÑa Nguy®n Quä ð±i#G Bäo thÕch tinh hoa #Yc¤p 4", 6, 101)
		AddNumText(sceneId, x980001_g_scriptId, "#Y5 #WHÑa Nguy®n Quä ð±i#G Bäo thÕch tinh hoa #Yc¤p 5", 6, 102)
		AddNumText(sceneId, x980001_g_scriptId, "#Y25 #WHÑa Nguy®n Quä ð±i#G Bäo thÕch tinh hoa #Yc¤p 6", 6, 103)
		AddNumText(sceneId, x980001_g_scriptId, "#Y50 #WHÑa Nguy®n Quä ð±i#G Bäo thÕch tinh hoa #Yc¤p 7", 6, 104)
		EndEvent(sceneId )
		DispatchEventList(sceneId, selfId, targetId)
	elseif (key == 110) then
		BeginEvent(sceneId)
		AddText(sceneId, "Ð¬ ð±i bäo thÕch c¤p 3 các hÕ c¥n có #G7 #{SQXY_09061_24}")
		for i, AwardList in x980001_g_AwardItemList[5].itemList do
			AddRadioItemBonus(sceneId, AwardList.item, AwardList.num)
		end
		EndEvent( )
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x980001_g_scriptId,0)
	elseif (key == 120) then
		BeginEvent(sceneId)
		AddText(sceneId, "Ð¬ ð±i mµt trong các v§t ph¦m dß¾i ðây các hÕ c¥n có #G5 #{SQXY_09061_24}#r#G(V¾i Thiên Th¯i Th¥n Ng÷c các hÕ s¨ nh§n ðßþc 7 cái)")
		for i, AwardList in x980001_g_AwardItemList[6].itemList do
			AddRadioItemBonus(sceneId, AwardList.item, AwardList.num)
		end
		EndEvent(sceneId )
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x980001_g_scriptId,0)
	elseif (key == 130) then
		BeginEvent(sceneId)
		AddNumText(sceneId, x980001_g_scriptId, "Ð±i trÑng Th¤t T¸ch Uyên ¿½ng c¤p 75", 6, 131)
		AddNumText(sceneId, x980001_g_scriptId, "Ð±i trÑng Th¤t T¸ch Uyên ¿½ng c¤p 85", 6, 132)
		AddNumText(sceneId, x980001_g_scriptId, "Ð±i trÑng Th¤t T¸ch Uyên ¿½ng c¤p 95", 6, 133)
		EndEvent(sceneId )
		DispatchEventList(sceneId, selfId, targetId)
	elseif (key == 140) then
		BeginEvent(sceneId)
		AddText(sceneId, "Ð¬ ð±i ðßþc#Y Bí kíp th¤t truy«n#W các hÕ c¥n có #G100 #{SQXY_09061_24}")
		for i, AwardList in x980001_g_AwardItemList[7].itemList do
			AddRadioItemBonus(sceneId, AwardList.item, AwardList.num)
		end
		EndEvent(sceneId )
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x980001_g_scriptId,0)
	elseif (key == 101) then
		BeginEvent(sceneId)
		AddText(sceneId, "Ð¬ ð±i Bäo thÕch tinh hoa c¤p 4 các hÕ c¥n có #G3 #{SQXY_09061_24}")
		for i, AwardList in x980001_g_AwardItemList[1].itemList do
			AddRadioItemBonus(sceneId, AwardList.item, AwardList.num)
		end
		EndEvent(sceneId )
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x980001_g_scriptId,0)
	elseif (key == 102) then
		BeginEvent(sceneId)
		AddText(sceneId, "Ð¬ ð±i Bäo thÕch tinh hoa c¤p 5 các hÕ c¥n có #G5 #{SQXY_09061_24}")
		for i, AwardList in x980001_g_AwardItemList[2].itemList do
			AddRadioItemBonus(sceneId, AwardList.item, AwardList.num)
		end
		EndEvent(sceneId )
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x980001_g_scriptId,0)
	elseif (key == 103) then
		BeginEvent(sceneId)
		AddText(sceneId, "Ð¬ ð±i Bäo thÕch tinh hoa c¤p 6 các hÕ c¥n có #G25 #{SQXY_09061_24}")
		for i, AwardList in x980001_g_AwardItemList[3].itemList do
			AddRadioItemBonus(sceneId, AwardList.item, AwardList.num)
		end
		EndEvent(sceneId )
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x980001_g_scriptId,0)
	elseif (key == 104) then
		BeginEvent(sceneId)
		AddText(sceneId, "Ð¬ ð±i Bäo thÕch tinh hoa c¤p 7 các hÕ c¥n có #G50 #{SQXY_09061_24}")
		for i, AwardList in x980001_g_AwardItemList[4].itemList do
			AddRadioItemBonus(sceneId, AwardList.item, AwardList.num)
		end
		EndEvent(sceneId )
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x980001_g_scriptId,0)
	elseif (key == 131) then
		BeginEvent(sceneId)
		AddText(sceneId, "Ð±i TrÑng Th¤t T¸ch Uyên ¿½ng #Gc¤p 75 #Wc¥n #G10 #{SQXY_09061_24}")
		AddNumText(sceneId, x980001_g_scriptId, "#{SQXY_09061_25}", 6, 134)
		AddNumText(sceneId, x980001_g_scriptId, "Hüy bö", 8, 137)
		EndEvent(sceneId )
		DispatchEventList(sceneId, selfId, targetId)
	elseif (key == 132) then
		BeginEvent(sceneId)
		AddText(sceneId, "Ð±i TrÑng Th¤t T¸ch Uyên ¿½ng #Gc¤p 85 #Wc¥n #G20 #{SQXY_09061_24}")
		AddNumText(sceneId, x980001_g_scriptId, "#{SQXY_09061_25}", 6, 135)
		AddNumText(sceneId, x980001_g_scriptId, "Hüy Bö", 8, 137)
		EndEvent(sceneId )
		DispatchEventList(sceneId, selfId, targetId)
	elseif (key == 133) then
		BeginEvent(sceneId)
		AddText(sceneId, "Ð±i TrÑng Th¤t T¸ch Uyên ¿½ng #Gc¤p 95 #Wc¥n #G30 #{SQXY_09061_24}")
		AddNumText(sceneId, x980001_g_scriptId, "#{SQXY_09061_25}", 6, 136)
		AddNumText(sceneId, x980001_g_scriptId, "Hüy Bö", 8, 137)
		EndEvent(sceneId )
		DispatchEventList(sceneId, selfId, targetId)
	elseif (key == 134 or key == 135 or key ==136) then

		local mode = key - 134
		local needCount = (mode+1)*10
		local eggId = 30504303 + mode

		if LuaFnGetAvailableItemCount(sceneId,selfId,20502010) < needCount then
			str = format("#{SQXY_09061_26} %d #{SQXY_09061_27}", needCount)
			BeginEvent(sceneId)
			AddText(sceneId, str)
			EndEvent(sceneId )
			DispatchEventList(sceneId, selfId, targetId)
			return
		end

		if (LuaFnGetPropertyBagSpace(sceneId,selfId) < 1) then
			x980001_NotifyFailTips(sceneId, selfId, "#{XRLB_90226_1} 1 #{XRLB_90226_2}")
			return
		else
			BagIndex = LuaFnTryRecieveItem( sceneId, selfId, eggId, 0)
			LuaFnItemBind(sceneId, selfId, BagIndex)
			x980001_NotifyFailTips(sceneId, selfId, "#{SQXY_09061_28}")
			LuaFnDelAvailableItem(sceneId,selfId,20502010, needCount)
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			BeginUICommand(sceneId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId, selfId, 1000)
			return
		end
	elseif key == 137 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 1000)
	end
end



function x980001_OnEnumerate( sceneId, selfId, targetId )
	AddText(sceneId, "Nªu các hÕ có nguy®n v÷ng gì, hãy ch÷n · bên dß¾i.#rT¤t cä nhæng v§t ph¦m này ð«u là v§t ph¦m thuµc hàng trân quý, chúng s¨ c¯ ð¸nh trên ngß¶i các hÕ, chï tr× bí kíp trân thú #YTh¤t Truy«n.")
	AddNumText(sceneId, x980001_g_scriptId, "HÑa Nguy®n Quä ð±i#G Bäo thÕch tinh hoa", 6, 100)
	AddNumText(sceneId, x980001_g_scriptId, "HÑa Nguy®n Quä ð±i#G Bäo thÕch C¤p 3", 6, 110)
	AddNumText(sceneId, x980001_g_scriptId, "HÑa Nguy®n Quä ð±i#G Thiên công khai v§t", 6, 120)
	AddNumText(sceneId, x980001_g_scriptId, "HÑa Nguy®n Quä ð±i#G Th¤t T¸ch Uyên ¿½ng", 6, 130)
	AddNumText(sceneId, x980001_g_scriptId, "HÑa Nguy®n Quä ð±i#G Bí kíp trân thú#Y th¤t truy«n", 6, 140)
	CallScriptFunction( 210536, "UpdateEventList", sceneId, selfId, targetId)
end

function x980001_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	local demandCount = LuaFnGetAvailableItemCount(sceneId,selfId,20502010)
	local Award
	for n = 1, 7 do
		for i, Award in x980001_g_AwardItemList[n].itemList do
			if Award.item == selectRadioId then
				if demandCount < x980001_g_AwardItemList[n].need then
					str = format("Các hÕ không có ðü %d HÑa Nguy®n Quä", x980001_g_AwardItemList[n].need)
					x980001_NotifyFailTips(sceneId, selfId, str)
					return
				end
				local matBag = LuaFnGetMaterialBagSpace(sceneId, selfId)
				local proBag = LuaFnGetPropertyBagSpace(sceneId, selfId)
				if (matBag*proBag == 0) then
					x980001_NotifyFailTips(sceneId, selfId, "Túi ðÕo cø và túi nguyên li®u c¥n ít nh¤t 1 ch² tr¯ng.")
					return
				else
					for j = 1, Award.num do
						BagIndex = LuaFnTryRecieveItem( sceneId, selfId, selectRadioId, 0)
						if n < 7 then
							LuaFnItemBind(sceneId, selfId, BagIndex)
						end
					end
					x980001_NotifyFailTips(sceneId, selfId, "Chúc m×ng các hÕ ð±i thß·ng thành công!")
					LuaFnDelAvailableItem(sceneId,selfId,20502010, x980001_g_AwardItemList[n].need)
					LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
					return
				end
			end
		end
	end
end

function x980001_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
	AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

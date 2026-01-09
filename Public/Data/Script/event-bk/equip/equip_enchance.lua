--Cuong hoa trang bi
--Viet Translate by VTAngel (Suong Anh)
x809262_g_ScriptId = 809262

x809262_g_QianghualuId = 30900045

x809262_g_QianghualuTime = 11
gem_index = 30900045
--×°±¸Ç¿»¯UI 1002

--**********************************
--Cuong hoa trang bi
--**********************************
function x809262_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--×°±¸Ç¿»¯¼ì²é
--**********************************
function x809262_FinishEnhance( sceneId, selfId, itemidx1, itemidx2 )
	local ret = LuaFnIsItemLocked( sceneId, selfId, itemidx1 )

	if ret ~= 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"Không có trang b¸");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	ret = LuaFnIsItemAvailable( sceneId, selfId, itemidx2 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		--AddText(sceneId,"¸ÃÇ¿»¯¾«»ª²»¿ÉÓÃ¡£");
		AddText(sceneId,"C¥n cß¶ng hóa tinh hoa không th¬ dùng.");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	equip_level = GetBagItemLevel( sceneId, selfId, itemidx1 )
	gem_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, itemidx2 )
	if equip_level < 40 then

		if gem_index ~= 30900005 then
			--µÍ¼¶Ç¿»¯¾«»ª
			str	= format( "Mu¯n cß¶ng hóa trang b¸ c¥n %s ", GetItemName( sceneId, 30900005 ) )
			BeginEvent(sceneId)
			AddText(sceneId,str);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	else

		if gem_index ~= 30900006 and gem_index ~= x809262_g_QianghualuId then
			--¸ß¼¶Ç¿»¯¾«»ª
			str	= format( "Mu¯n cß¶ng hóa trang b¸ c¥n %s ho£c %s ", GetItemName( sceneId, 30900006 ), GetItemName( sceneId, x809262_g_QianghualuId ) )
			BeginEvent(sceneId)
			AddText(sceneId,str);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	end

	--¼ì²éÊÇ·ñÄÜ¹»Ç¿»¯
	ret, arg0 = LuaFnEquipEnhanceCheck( sceneId, selfId, itemidx1, itemidx2 )
	local text="Cß¶ng hóa trang b¸ thành công!"
	if ret == 0 then
		--Ç¿»¯ÏûºÄ¼ì²é³É¹¦
		x809262_DoFinishEnhance( sceneId, selfId, itemidx1*1000+itemidx2)
		return
	end

	if ret == -1 then
		text="Không biªt l²i"
	end

	if ret == -2 then
		text="Không dùng ðßþc trang b¸ này"
	end

	if ret == -3 then
		--text="Ç¿»¯¾«»ª²»¿ÉÓÃ¡£"
		text="Cß¶ng hóa tinh hoa không th¬ dùng"
	end

	if ret == -4 then
		text="ÐÆng c¤p Cß¶ng hóa cüa trang b¸ này ðã l¾n nh¤t"
	end

	if ret == -5 then
		text="Cß¶ng hóa trang b¸ c¥n #{_EXCHG%d}, ngân lßþng trên ngß¶i các hÕ không ðü." --zchw
		text=format( text, arg0 )
	end

	if ret == -7 then
		text="Trang b¸ này không Cß¶ng hóa ðßþc"
	end

	if ret == -6 then
		--C¥n có È·ÈÏ½çÃæ
		--text="Ç¿»¯Ê§°ÜÖ®ºó£¬Ç¿»¯µÈ¼¶½«»á±ä³É"..tostring(arg0).."£¬ÊÇ·ñ¼ÌÐøÇ¿»¯£¿"
		--BeginUICommand(sceneId)
			--UICommand_AddInt(sceneId,x809262_g_ScriptId);
			--UICommand_AddInt(sceneId,targetId);
			--UICommand_AddInt(sceneId,itemidx1*1000+itemidx2);
			--UICommand_AddString(sceneId,"DoFinishEnhance");
			--UICommand_AddString(sceneId,text);
			--EndUICommand(sceneId)
		--DispatchUICommand(sceneId,selfId, 24)
		x809262_DoFinishEnhance( sceneId, selfId, itemidx1*1000+itemidx2)
		return
	end

	BeginEvent(sceneId)
	AddText(sceneId,text)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--×°±¸Ç¿»¯
--**********************************
function x809262_DoFinishEnhance( sceneId, selfId, index )
	local itemidx1 = floor(index / 1000)
	local itemidx2 = mod(index , 1000)
	local text="Cß¶ng hóa trang b¸ thành công!"

	--Ç¿»¯
	local ret,arg0 = LuaFnEquipEnhance( sceneId, selfId, itemidx1, itemidx2 )

	if ret == 0 then
		if arg0 >= 5 then
			local	szTranItm1	= GetBagItemTransfer( sceneId, selfId, itemidx1 )
			local	szTranItm2	= GetBagItemTransfer( sceneId, selfId, itemidx2 )
			local	szMsg				= format( "#W#{_INFOUSR%s}#{EQ_1}#{_INFOMSG%s}#{EQ_2}%d#{EQ_3}#{_INFOMSG%s}#{EQ_4}",
														LuaFnGetName( sceneId, selfId ), szTranItm2, arg0, szTranItm1 )
			--¹«¸æ¾«¼ò£¬Ð¡ÓÚ5¼¶µÄÇ¿»¯£¬²»·¢¹«¸æ
			AddGlobalCountNews( sceneId, szMsg )
		end

		gem_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, itemidx2 )

		if x809262_g_QianghualuId == gem_index then
			local r, t = LuaFnEraseItemTimes( sceneId, selfId, itemidx2, x809262_g_QianghualuTime )
			--PrintNum(r);
			--PrintNum(t)

			BeginEvent(sceneId)
			--local str = "Ììî¸Ç¿»¯Â¶Còn lÕi Ê¹ÓÃ´ÎÊý%d"
			local	szMsg				= format( "T¥n su¤t % cß¶ng hóa còn lÕi %d/%d",
														tonumber(t), tonumber(x809262_g_QianghualuTime) );
			AddText(sceneId,szMsg);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		else
			LuaFnDelAvailableItem( sceneId, selfId, gem_index, 1 )
		end

		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	end

	if ret == -1 then
		text="Không biªt l²i"
	end

	if ret == -2 then
		text="Không dùng ðßþc trang b¸ này"
	end

	if ret == -3 then
		text="Cß¶ng hóa tinh hoa không th¬ dùng."
	end

	if ret == -4 then
		text="ÐÆng c¤p Cß¶ng hóa cüa trang b¸ này ðã l¾n nh¤t"
	end

	if ret == -5 then
		text="Cß¶ng hóa trang b¸ c¥n có #{_EXCHG%d}, ngân lßþng trên ngß¶i các hÕ không ðü." --zchw
		text=format( text, arg0 )
	end

	if ret == -6 then
		text="Do thao tác b¸ sai, trang b¸ Cß¶ng hóa th¤t bÕi!"

		if x809262_g_QianghualuId == gem_index then
			local r, t = LuaFnEraseItemTimes( sceneId, selfId, itemidx2, x809262_g_QianghualuTime )
			--PrintNum(r);
			--PrintNum(t)

			BeginEvent(sceneId)
			local	szMsg				= format( "T¥n su¤t % cß¶ng hóa còn lÕi %d/%d",
														tonumber(t), tonumber(x809262_g_QianghualuTime) );
			AddText(sceneId,szMsg);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)

		else
			LuaFnDelAvailableItem( sceneId, selfId, gem_index, 1 )
		end
		--LuaFnEraseItem( sceneId, selfId, itemidx2 )
	end

	BeginEvent(sceneId)
	AddText(sceneId,text);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

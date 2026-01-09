
x300084_g_scriptId = 300084 --ÁÙÊ±Ð´Cái này ,ÕæÕýÓÃtoÕ ðµ Ê±ºòmµt ¶¨Òª¸Ä.

x300084_g_GetItem =
{	-- Percent: Num/10
	[3] = { -- Ngoc 4
		50401001,
		50401002,
		50402001,
		50402002,
		50402003,
		50402004,
		50403001,
		50404002,
		50411001,
		50411002,
		50412001,
		50412002,
		50412003,
		50412004,
		50413001,
		50413002,
		50413003,
		50413004,
		50413005,
		50414001,
	},
	[7] = {
		20310111, -- HNTTúy
		-- 7 sac Long Chau
		30505085,
		30505086,
		30505087,
		30505088,
		30505089,
		30505090,
		30505091,
	},
	[20] = {
		30505192, -- QVTS
		30008030, -- TÐChâu
		--Ngoc 3
		50301001,
		50301002,
		50302001,
		50302002,
		50302003,
		50302004,
		50303001,
		50304002,
		50311001,
		50311002,
		50312001,
		50312002,
		50312003,
		50312004,
		50313001,
		50313002,
		50313003,
		50313004,
		50313005,
		50314001,
	},
	[50] = {
		30505255, -- NLTuyen
		30900045, -- CHLo
		30008048, -- KCT
		30509014, -- 15 ðoa mai khôi
		30900014, -- CCKhac Danh
		--Ngoc 2
		50201001,
		50201002,
		50202001,
		50202002,
		50202003,
		50202004,
		50203001,
		50204002,
		50211001,
		50211002,
		50212001,
		50212002,
		50212003,
		50212004,
		50213001,
		50213002,
		50213003,
		50213004,
		50213005,
		50214001,
	},
	[80] = {
		30008034, -- KCS
	},
	[100] = {--Phao hoa
		30505005,
		30505006,
		30505007,
		30505008,
		30505009,
		30505081,
		30505082,
		30505083,
		30505084,
		30505023,
		30505024,
		30505025,
		30505026,
	},
	[150] = {
		30008014, -- TTLÐan
		30505122, -- NKQV
	},
}

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x300084_OnDefaultEvent( sceneId, selfId, bagIndex )
	-- ²»C¥n Cái này ½Ó¿Ú,µ«Òª±£Áô¿Õº¯Êý
end

--**********************************
--Cái này ÎïÆ·toÕ ðµ Ê¹ÓÃ¹ý³ÌÐúng·ñÀàËÆÓÚ¼¼ÄÜ:
--H® th¯ng»áTÕi Ö´ÐÐ¿ªÊ¼Ê±¼ì²âCái này º¯ÊýtoÕ ðµ Tr· v«Öµ,Èç¹ûTr· v«th¤t bÕiÔòºöÂÔºóÃætoÕ ðµ ÀàËÆ¼¼ÄÜtoÕ ðµ Ö´ÐÐ.
--Tr· v«1: ¼¼ÄÜÀàËÆtoÕ ðµ ÎïÆ·,¿ÉÒÔ¼ÌÐøÀàËÆ¼¼ÄÜtoÕ ðµ Ö´ÐÐ£»Tr· v«0: ºöÂÔºóÃætoÕ ðµ ²Ù×÷.
--**********************************
function x300084_IsSkillLikeScript( sceneId, selfId)
	return 1; --Cái này ½Å±¾C¥n ¶¯×÷Ö§³Ö
end

--**********************************
--Ö±½ÓHuÖ böÐ§¹û:
--H® th¯ng»áÖ±½Óµ÷ÓÃCái này ½Ó¿Ú,²¢¸ù¾ÝCái này º¯ÊýtoÕ ðµ Tr· v«ÖµXác nh§nÒÔºótoÕ ðµ Á÷³ÌÐúng·ñÖ´ÐÐ.
--Tr· v«1: ÒÑ¾­HuÖ bö¶ÔÓ¦Ð§¹û,²»ÔÙÖ´ÐÐºóÐø²Ù×÷£»Tr· v«0: Ã»ÓÐ¼ì²âµ½Ïà¹ØÐ§¹û,¼ÌÐøÖ´ÐÐ.
--**********************************
function x300084_CancelImpacts( sceneId, selfId )
	return 0; --²»C¥n Cái này ½Ó¿Ú,µ«Òª±£Áô¿Õº¯Êý,²¢ÇÒÊ¼ÖÕTr· v«0.
end

--**********************************
--Ìõ¼þ¼ì²âÈë¿Ú:
--H® th¯ng»áTÕi ¼¼ÄÜ¼ì²âtoÕ ðµ Ê±¼ä ði¬mµ÷ÓÃCái này ½Ó¿Ú,²¢¸ù¾ÝCái này º¯ÊýtoÕ ðµ Tr· v«ÖµXác nh§nÒÔºótoÕ ðµ Á÷³ÌÐúng·ñÖ´ÐÐ.
--Tr· v«1: Ìõ¼þ¼ì²âÍ¨¹ý,¿ÉÒÔ¼ÌÐøÖ´ÐÐ£»Tr· v«0: Ìõ¼þ¼ì²âth¤t bÕi,ÖÐ¶ÏºóÐøÖ´ÐÐ.
--**********************************
function x300084_OnConditionCheck( sceneId, selfId )

	-- if 1==1 then
	-- 	BeginEvent( sceneId )
	-- 	AddText( sceneId, "ChÑc nång này s¡p ðßþc ra m¡t" )
	-- 	EndEvent( sceneId )
	-- 	DispatchMissionTips( sceneId, selfId )
	-- 	return 0
	-- end
	--Ð£ÑéÊ¹ÓÃtoÕ ðµ ÎïÆ·
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end

	local posX, posZ = GetWorldPos(sceneId, selfId)
	if ((sceneId ~= 4) or (floor(posX) < 155 or floor(posX) > 160 or floor(posZ) < 180 or floor(posZ) > 188)) then
		BeginEvent( sceneId )
		AddText( sceneId, "#{SQXY_09061_14}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

  if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
  	BeginEvent( sceneId )
  	AddText( sceneId, "#{XRLB_90226_1} 2 #{XRLB_90226_2}" )
  	EndEvent( sceneId )
  	DispatchMissionTips( sceneId, selfId )
    return 0
  end

  if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 2 then
  	BeginEvent( sceneId )
  	AddText( sceneId, "#{XRLB_90226_3} 2 #{XRLB_90226_2}" )
  	EndEvent( sceneId )
  	DispatchMissionTips( sceneId, selfId )
    return 0
  end
	BeginEvent( sceneId )
	AddText( sceneId, "#{SQXY_09061_17}" )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	return 1;
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú:
--H® th¯ng»áTÕi ¼¼ÄÜÏûºÄtoÕ ðµ Ê±¼ä ði¬mµ÷ÓÃCái này ½Ó¿Ú,²¢¸ù¾ÝCái này º¯ÊýtoÕ ðµ Tr· v«ÖµXác nh§nÒÔºótoÕ ðµ Á÷³ÌÐúng·ñÖ´ÐÐ.
--Tr· v«1: ÏûºÄ´¦ÀíÍ¨¹ý,¿ÉÒÔ¼ÌÐøÖ´ÐÐ£»Tr· v«0: ÏûºÄ¼ì²âth¤t bÕi,ÖÐ¶ÏºóÐøÖ´ÐÐ.
--×¢Òâ: Õâ²»¹â¸ºÔðÏûºÄtoÕ ðµ ¼ì²âÒ²¸ºÔðÏûºÄtoÕ ðµ Ö´ÐÐ.
--**********************************
function x300084_OnDeplete( sceneId, selfId )
	--²»ÏûºÄ....ºó±ß»¹ÒªÊ¹ÓÃ´æµ½ÎïÆ·ÉÏtoÕ ðµ ÐÅÏ¢ÄØ....
	return 1;
end

--**********************************
--Ö»»áÖ´ÐÐmµt ´ÎÈë¿Ú:
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áTÕi ÏûºÄÍê³Éºóµ÷ÓÃCái này ½Ó¿Ú(¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼þ¶¼Thöa mãntoÕ ðµ Ê±ºò),¶øÒýµ¼
--¼¼ÄÜÒ²»áTÕi ÏûºÄÍê³Éºóµ÷ÓÃCái này ½Ó¿Ú(¼¼ÄÜtoÕ ðµ mµt ¿ªÊ¼,ÏûºÄ³É¹¦Ö´ÐÐÖ®ºó).
--Tr· v«1: ´¦Àí³É¹¦£»Tr· v«0: ´¦Àíth¤t bÕi.
--×¢: ÕâÀïÐúng¼¼ÄÜÉúÐ§mµt ´ÎtoÕ ðµ Èë¿Ú
--**********************************
function x300084_OnActivateOnce( sceneId, selfId )

	--×Ô¼º²»ÄÜÊ¹ÓÃ....
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return
	end

  if LuaFnDepletingUsedItem(sceneId, selfId) <= 0 then
		return
	end

	BeginEvent( sceneId )
	AddText( sceneId, "#{SQXY_09061_18}" )
	AddText( sceneId, "#{SQXY_09061_21}" )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

	local playerlvl = LuaFnGetLevel( sceneId, selfId )
	LuaFnAddExp( sceneId, selfId, 60*playerlvl )
	TryRecieveItem( sceneId, selfId, 20502010, QUALITY_MUST_BE_CHANGE ) -- HNQua
  --Ëæ»ú²úÉú²»Í¬toÕ ðµ ½ð±Ò
	local MaxPercent = 1000
  local GoodLuck = random(MaxPercent)
	local showmsg = 0
	local itemIn = {}
	for i=GoodLuck,MaxPercent do
		itemIn = x300084_g_GetItem[i]
		if nil ~= itemIn then
			if i <= 20 then
				showmsg = 1
			end
			break
		end
	end

	if (itemIn == nil) then
		return
	end

	if (getn(itemIn) <= 0) then
		return
	end

  local randitem = random(getn(itemIn))

  local BagIndex = TryRecieveItem( sceneId, selfId, itemIn[randitem], QUALITY_MUST_BE_CHANGE )
  if (BagIndex ~= -1) then
    LuaFnItemBind( sceneId, selfId, BagIndex )
    local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
    Msg2Player( sceneId, selfId, format("#{XRLB_81203_7} #Y#{_ITEM%s}", itemIn[randitem]), MSG2PLAYER_PARA )
    if (showmsg == 1) then
      local str = format("#{_INFOUSR%s} #{SQXY_09061_3} #cB3DB35#{_INFOMSG%s}", GetName(sceneId,selfId), ItemInfo)
      BroadMsgByChatPipe( sceneId, selfId, str, 4 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
			CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
    end
  end

	return
end

--**********************************
--Òýµ¼ÐÄÌø´¦ÀíÈë¿Ú:
--Òýµ¼¼¼ÄÜ»áTÕi Ã¿´ÎÐÄÌø½áÊøÊ±µ÷ÓÃCái này ½Ó¿Ú.
--Tr· v«: 1¼ÌÐøÏÂ´ÎÐÄÌø£»0: ÖÐ¶ÏÒýµ¼.
--×¢: ÕâÀïÐúng¼¼ÄÜÉúÐ§mµt ´ÎtoÕ ðµ Èë¿Ú
--**********************************
function x300084_OnActivateEachTick( sceneId, selfId)
	return 1; --²»ÐúngÒýµ¼ÐÔ½Å±¾, Ö»±£Áô¿Õº¯Êý.
end

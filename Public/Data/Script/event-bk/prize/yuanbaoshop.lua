--ÐÂµÄÔª±¦ÉÌµê

x888902_g_scriptId = 888902
--Ôª±¦ÉÌµêÁÐ±í ÒªÓë¿Í»§¶Ë½çÃæ¶ÔÓ¦

-- KNB SHOP
x888902_g_shoplist     = {}
x888902_g_shoplist[1]	 = {188, 189}				--´óÂô³¡
x888902_g_shoplist[2]	 = {212, 198}			--±¦Ê¯ÉÌ³Ç,Ìí¼Ó"ÐÕi Lý±¦Ê¯Õ«--149",czf,2009.07.21
x888902_g_shoplist[3]	 = {194, 152, 195}			--ÕäÊÞÉÌ³Ç
x888902_g_shoplist[4]	 = {136, 137, 209}				--ÄÏ±±ÔÓ»õ
x888902_g_shoplist[5]	 = {120, 181, 134, 208}			--ÐÎÏó¹ã³¡
x888902_g_shoplist[6]	 = {190, 191, 192, 133}				--{190, 191, 192, 133}
x888902_g_shoplist[7]	 = {230}						--Îä¹¦Bí T¸ch
x888902_g_shoplist[8]	 = {156, 157, 158, 159, 160, 161, 162, 163}	--´òÔìÍ¼

-- Search Shop - Must have ID in KNB SHOP
x888902_g_shoplist[9]	   = {149, 212, 198, 194, 136}			--ÎÒÒª¸üÇ¿´ó
x888902_g_shoplist[10]	 = {134, 120, 181, 145, 182}			--ÎÒÒª¸üÓÐ÷ÈÁ¦
x888902_g_shoplist[11]	 = {149, 212, 193, 137, 209}			--ÎÒÒª´òÔì¼«Æ·×°±¸
x888902_g_shoplist[12]	 = {194, 135, 152, 195}				--ÎÒÒª´òÔì¼«Æ·ÕäÊÞ
x888902_g_shoplist[13]	 = {134, 144}					--ÎÒÒªÒÆ¶¯µÄ¸ü¿ì
x888902_g_shoplist[14]	 = {191, 192, 133, 120, 134}			--{191, 192, 133, 120, 134}
x888902_g_shoplist[15]	 = {230, 135, 152}				--ÎÒÒªÑ§Ï°ÐÂ¼¼ÄÜ

-- Bind SHOP
x888902_g_shoplist[101]	= {164, 258}
x888902_g_shoplist[102]	= {197}
x888902_g_shoplist[103]	= {165, 135}
x888902_g_shoplist[104]	= {144}
x888902_g_shoplist[105]	= {145, 182}	--´óÂô³¡(ÐÂÆ·,ÈÈÂô£¬³¬¼¶ÉñÆ÷£¬Ê±×°,×øÆï£¬ÆïÊõ,Îä¹¦1£¬Îä¹¦2,Éñ±øÀûÆ÷220BOSS¿¨)
				--150, 197
				--ÕäÊÞÉÌ³Ç				--ÄÏ±±Ææ»õ


--**********************************
-- ¼ì²é´ËËæÉíNPCµÄ¹¦ÄÜ
-- opÐúngÇëÇóÀà±ð£¬±ÈÈç1´ú±íÔª±¦Ïà¹ØµÄËæÉí²Ù×÷¡­¡­
--**********************************
function x888902_OpenYuanbaoShop( sceneId, selfId, targetId, shopA, shopB )

	local bCheck = x888902_YuanbaoShopCheckOp(sceneId,selfId);

	if bCheck > 0 then
		if ((shopA > 0 and shopA < 200) and (x888902_g_shoplist[shopA] ~= nil) and (x888902_g_shoplist[shopA][shopB] ~= nil)) then
			--PrintStr(x888902_g_shoplist[shopA][shopB])
			if targetId == -1 then
				DispatchYuanbaoShopItem( sceneId, selfId, x888902_g_shoplist[shopA][shopB])
			else
				DispatchNpcYuanbaoShopItem( sceneId, selfId, targetId , x888902_g_shoplist[shopA][shopB])
			end
		end
	end
end

function x888902_YuanbaoShopCheckOp(sceneId,selfId)
	--µØ¸®
	if sceneId == 77 then
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:Trong Ð¸a Phü không th¬ tùy ti®n sØ døng công nång", 0);
		return 0
	end
	--×é¶Ó¸úËæ
	local selfHasTeamFlag = LuaFnHasTeam(sceneId, selfId);
	if selfHasTeamFlag and selfHasTeamFlag == 1 then
		local teamFollowFlag = IsTeamFollow(sceneId,selfId);
		local teamLeaderFlag = LuaFnIsTeamLeader(sceneId,selfId);
		if not teamLeaderFlag or not teamFollowFlag then
			return 0
		end
		if teamFollowFlag ~= 0 and teamLeaderFlag ~= 1 then
			return 0
		end
	end
	--Ë«ÈËÆï³Ë
	local selfHasDRideFlag = LuaFnGetDRideFlag(sceneId, selfId);
	if selfHasDRideFlag and selfHasDRideFlag == 1 then
		local selfIsDRideMountOwner = LuaFnIsDRideMountOwner(sceneId, selfId);
		if not selfIsDRideMountOwner or selfIsDRideMountOwner ~= 1 then
			--´¦ÓÚË«ÈËÆï³Ë×´Ì¬£¬ÇÒÐúng±»¶¯µÄ£¬½»¸øÖ÷¶¯·½À´´¦Àí
			return 0
		end
	end
	--15c¤pÒÔÉÏ
	local level = GetLevel(sceneId,selfId);
	if nil == level or level < 15 then
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:Các hÕ c¥n ðÕt t¾i c¤p ðµ 15 m¾i có th¬ sØ døng", 0);
		return 0
	else

		return 1
	end
	return 0
end

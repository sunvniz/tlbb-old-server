-- Viet Translate by VTAngel (Suong Anh)

-- Script ID
x900012_g_ScriptId = 900012

--½øÈëÎïÆ·ID

x900012_g_ItemId = 20309019

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x900012_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText(sceneId,"    #W N½i này là tín hi®u cüa cØu lê ti«n tuyªn, dùng cho #G CØu lê bµ tµc ti«n tuyªn chï huy #W ra l®nh. #G Chú ý: lúc này ð® trình 10 cái #YCØu Lê Phø Tùng #Gcó th¬ h¤p dçn #H CØu lê ð¥u lînh #Gtiªn ðªn") 
		AddNumText( sceneId, x900012_g_scriptId, "Ð£t 10 cái #GCØu lê phø tùng", 6, 10)
		AddNumText( sceneId, x900012_g_scriptId, "V« Ác chiªn cØu lê", 11, 11)
		--AddNumText( sceneId, x900012_g_ScriptId, "V« Truy tìm Næ Oa thÕch", 11, 12 )
		--AddNumText( sceneId, x900012_g_scriptId, "V« Truy tìm Næ Oa th¥n thÕch", 11, 13)
        EndEvent(sceneId)
        DispatchEventList(sceneId,selfId,targetId)

  end


--**********************************
-- Danh sách sñ ki®n b§c 1
--**********************************
function x900012_OnEventRequest( sceneId, selfId, targetId, eventId )
  
  if GetNumText()  == 10 then
	  --¼ì²é°üÄÚÊÇ·ñÓÐÎ»ÖÃ
	if GetItemCount(sceneId, selfId, x900012_g_ItemId) < 10  then
	BeginEvent( sceneId )
		AddText(sceneId,"Ngß½i trên ngß¶i phäi có 10 cái #cFF0000 CØu lê phø tùng, #W m¾i có th¬ h¤p dçn #cff99cc CØu lê ð¥u lînh #W tiªn ðªn")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	return
	end
	LuaFnDelAvailableItem(sceneId,selfId,x900012_g_ItemId,10)	-- Xóa v§t ph¦m
	--É¾³ý¸ÃÎïÆ·
		
	local bRet = 0;
		
	local	bagpos = GetItemBagPos( sceneId, selfId, 20309019, 0 )
	
	if LuaFnLockCheck( sceneId, selfId, bagpos, 0 ) < 1 then
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, 20309019 );		
		if nItemNum <= 0 then
			x900012_MsgBox( sceneId, selfId, targetId, "V§t ph¦m ðã b¸ khóa!" )
			return 0;
		end
	end


--¿ªÊ¼Ö´ÐÐËæ»úÊÂ¼þ
		BeginEvent( sceneId )
		LuaFnCreateMonster(549, 15705, 150, 51, 17, 0, 402030)
		local playername = GetName(sceneId, selfId)
		local strText = format("#b#cff00f0Hoang nh§t cØu lê ð¥u lînh: Là ai, dám qu¤y r¥y ta ngü, các ngß½i s¨ phäi trä giá ð¡c cho vi®c này!", playername)		
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end

  if GetNumText()  == 11 then
	BeginEvent( sceneId )
		      AddText( sceneId, "   Xi Vßu h§u du® #G cØu lê bµ lÕc #W xâm l¤n #G huy«n häi #W, b÷n h÷ hy v÷ng thu th§p #G ngû thäi th¥n thÕch #W ð¬ luy®n #Y huy«n binh thÕch #W dùng chª #G th¥n khí #W, cûng hy v÷ng tìm kiªm Xi Vßu chi phü ð¬ s¯ng lÕi Xi Vßu, mµt l¥n næa xâm l¤n CØu Châu ðÕi løc. Trách nhi®m di®p tan ý ð° cüa chúng phäi do các nhân sî Trung Nguyên gánh vác r°i." )
		      AddText( sceneId, "   M²i ngày: #G10 gi¶ t¾i 10 gi¶ 30 phút #W, #G16 gi¶ t¾i 16 gi¶ 30 phút #W, #G20 gi¶ t¾i 20 gi¶ 30 phút #W, · thiên thái c± cänh #G huy«n häi #W xu¤t hi®n mµt lßþng l¾n #cff99cc cØu lê chiªn sî #W. Ðánh chªt #cff99cc cØu lê chiªn sî có th¬ ðÕt ðßþc #Y cØu lê phø tùng #W cùng v¾i #Y huy«n binh thÕch" )
		      AddText( sceneId, "   Ð°ng th¶i, ðánh chªt #cff99cc cØu lê chiªn sî #W có th¬ ðÕt ðßþc #Y cØu lê phø tùng #W. SØ døng 10 #Y cØu lê phø tùng #W có th¬ · #G huy«n häi #W #cff99cc cØu lê tª ðàn #W và #cff99cc cØu lê thßþng c± tª ðàn #W g÷i v« #cff99cc cØu lê ð¥u lînh #W và #cff99cc cØu lê tµc trß·ng #W, ðánh chªt có th¬ ðÕt ðßþc lßþng l¾n #Y huy«n binh thÕch #W." )
		      
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

		if GetNumText()  == 12 then
	BeginEvent( sceneId )
		 AddText( sceneId, "#YV« Truy tìm Næ Oa thÕch" )
		 AddText( sceneId, "      " )
		 AddText( sceneId, "  #YÅ®æ´Ê¯#W×÷ÎªÉñÆ÷#GÁùÐÇÉýÆßÐÇ#WµÄ½ø½×Ö÷Òª²ÄÁÏ,Íæ¼ÒÖ»ÓÐµ½´ï#GÐþº£#WÖÐ,ÔÚ#cff99ccKi«n nguyên cØu lê ð¥u lînh#W¡¢#cff99ccThái khôn cØu lê ð¥u lînh#W¡¢#cff99ccHoang nh§t cØu lê ð¥u lînh#W¡¢#cff99ccC± nguy®t cØu lê ð¥u lînh#W¡¢#cff99ccTuy®t tinh cØu lê ð¥u lînh#W¡¢#cff99ccThß½ng vân cØu lê ð¥u lînh#WËÀÍöºó£¬ÐèÒª·Ö±ðÊÕ¼¯Æä°ÜºóµôÂäµÄ¾ÅÀèÔªÆø¡£" )
		 AddText( sceneId, "#WÊÕ¼¯ÈçÉÏ#GÁùÖÖ¾ÅÀèÔªÆø#W¼È¿É·µ»Ø#GÂåÑô¹ã³¡#W,´¦»»È¡#YÅ®æ´Ê¯" )
		 EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

		if GetNumText()  == 13 then
	BeginEvent( sceneId )
		 AddText( sceneId, "#YV« Truy tìm Næ Oa th¥n thÕch£º" )
		 AddText( sceneId, "      " )
		 AddText( sceneId, "   #YÅ®æ´ÉñÊ¯#W×÷ÎªÉñÆ÷#GÆßÐÇÉý°ËÐÇ#WµÄ½ø½×Ö÷Òª²ÄÁÏ,Íæ¼ÒÖ»ÓÐµ½´ï#GÐþº£#WÖÐ,ÔÚ#cff99ccKi«n nguyên cØu lê ð¥u lînh#W¡¢#cff99ccThái khôn cØu lê ð¥u lînh#W¡¢#cff99ccHoang nh§t cØu lê ð¥u lînh#W¡¢C± nguy®t cØu lê ð¥u lînh#W¡¢Tuy®t tinh cØu lê ð¥u lînh#W¡¢Thß½ng vân cØu lê ð¥u lînh#WËÀÍöºó£¬ÐèÒª·Ö±ðÊÕ¼¯Æä°ÜºóµôÂäµÄ¾ÅÀèÔªÆø¡£" )
		 AddText( sceneId, "#WÊÕ¼¯ÈçÉÏ#GÁùÖÖ¾ÅÀèÔªÆø#W¼È¿É·µ»Ø#GÂåÑô¹ã³¡#W,´¦»»È¡#YÅ®æ´ÉñÊ¯" )
		 AddText( sceneId, "#WÊ¹ÓÃ#YÅ®æ´ÉñÊ¯#W½ø½×µ½°ËÐÇµÄ#GÉñÆ÷#W,¿ÉÊ¹ÓÃ#Y¾ÛÁéÊ¯#W,ÔÚ#GÂåÑô#W,½øÐÐÉñÆ÷#GÍ¨Áé#W£¬#GÍ¨Áé#WÖ®ºóµÄÉñÆ÷,½«½ø½×¸ü¸ßÒ»¸ö¼¶±ðµÄ#GÉñÆ÷#W,Í¬Ê±Íâ¹ÛÒ²½«±ä³É#GËÄ´ú102¼¶#WµÄÉñÆ÷Íâ¹Û£¬ÊôÐÔ¸ü¼ÓÇ¿´ó" )
		 EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
  
 end
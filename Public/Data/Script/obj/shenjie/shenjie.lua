--Viet Translate by VTAngel

--2014
x009999_g_ScriptId = 009999

--Viet Translate by VTAngel

x009999_g_MapId = {
	                 128,
	                 129,
	                 560,
	                 561,
	                 562,
	                 563,
	                 564,
	                 565,	
}

--Tàng Bäo Các Nh§p Trß¶ng Khoán
x009999_g_ItemId = 30503166

--**********************************
--Main Start
--**********************************
function x009999_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		BeginEvent( sceneId )
		AddText(sceneId," Nªu ð°ng th¶i quá nhi«u ngß¶i khiêu chiªn tàng kinh các, phäi thông qua rút thåm quyªt ð¸nh#r Nªu rút thåm thành công là có th¬ tiªn vào tàng kinh các khiêu chiªn #r Nªu v§n khí không t¯t chï có mµt l¥n næa rút thåm thôi!!!")
		AddNumText( sceneId, x009999_g_ScriptId, "#G Khiêu chiªn #Ytàng kinh các", 6, 1 )
		AddNumText( sceneId, x009999_g_ScriptId, "#Y Tàng kinh các gi¾i thi®u", 11, 2 )
		--AddNumText( sceneId, x009999_g_ScriptId, "Quên ði", 12, 3 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--Viet Translate by VTAngel
--**********************************
function x009999_OnEventRequest( sceneId, selfId, targetId, eventId )
if GetNumText() == 1 then

	if GetItemCount(sceneId, selfId, x009999_g_ItemId)<1  then
	BeginEvent( sceneId )
		AddText(sceneId,"Ngß½i trên ngß¶i không có #Y[Tàng Bäo Các Nh§p Trß¶ng Khoán]#W, ta không có bi®n pháp giúp ngß½i . !")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	return
	end

	local level = GetLevel( sceneId, selfId )
	if level < 120 then
	BeginEvent( sceneId )
		AddText(sceneId,"Ngß½i c¤p b§c dß¾i 120, ta không có bi®n pháp giúp ngß½i .")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	return
	end

	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
	BeginEvent( sceneId )
		AddText(sceneId,"    TrÕng thái kÜ th×a nhi«u ngß¶i, không th¬ vào, cám ½n!")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	return
	end
--To doi khong the vao
	if LuaFnHasTeam( sceneId, selfId ) > 0 then
	BeginEvent( sceneId )
		AddText(sceneId,"     Khiêu chiªn tàng kinh các chï có th¬ ð½n thân ðµc chiªn mà thôi!")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	return
	end

	  if LuaFnDelAvailableItem(sceneId, selfId, x009999_g_ItemId, 1) == 0 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ngß½i trên ngß¶i không có #Y[Tàng Bäo Các Nh§p Trß¶ng Khoán]#W, ta không có bi®n pháp giúp ngß½i . !")
		   EndEvent(sceneId)
		   DispatchMissionTips( sceneId, selfId )
		   return
		 end

	
--Bat dau su kien
	local odd = random(1,85)
	local MapId = 0
	if( odd >= 1 and odd <= 10 ) then       
	MapId = x009999_g_MapId[1]
	elseif( odd >= 11 and odd <= 20 ) then       
	MapId = x009999_g_MapId[2]
	elseif( odd >= 21 and odd <= 30 ) then
	MapId = x009999_g_MapId[3]
	elseif( odd >= 31 and odd <= 40 ) then
	MapId = x009999_g_MapId[4]
	elseif( odd >= 41 and odd <= 50 ) then
	MapId = x009999_g_MapId[5]
	elseif( odd >= 51 and odd <= 60 ) then
	MapId = x009999_g_MapId[6]
	elseif( odd >= 61 and odd <= 70 ) then
	MapId = x009999_g_MapId[7]
	elseif( odd >= 71 and odd <= 80 ) then
	MapId = x009999_g_MapId[8]
	elseif( odd >= 81 and odd <= 85 ) then

		BeginEvent( sceneId )
		AddText(sceneId,"      Th§t ðáng tiªc, v§n khí cüa các hÕ không t¯t r°i. Hãy thØ lÕi xem nhé!")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	return
	end
	    
--Dich chuyen
	local nHumanNum = LuaFnGetCopyScene_HumanCount("..MapId..")
	if nHumanNum > 100 then
	BeginEvent( sceneId )
		AddText(sceneId,"    Th§t xin l²i, s¯ ngß¶i trong Tàng Kinh Các này ðã quá nhi«u.Vui lòng ch÷n bän ð° khác")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	return
	end
	SetMissionData( sceneId, selfId, MF_JIETIANLAO, 0 )
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, MapId, 29, 31, 10 )
	return

end
if GetNumText() == 2 then
	BeginEvent( sceneId )
		BeginEvent( sceneId )
		AddText(sceneId,"Khiêu chiªn #Gtàng kinh các#W là hoÕt ðµng m¾i trong phiên bän này")
		AddText(sceneId,"Ð¬ tham gia c¥n ðÕt c¤p 120 tr· lên và có #G[Tàng Bäo Các Nh§p Trß¶ng Khoán]")
		AddText(sceneId,"Tiªn vào thành công hãy ðªn NPC giæa bän ð° ð¬ khiêu chiªn")
		AddText(sceneId,"Thành công tiêu di®t t¤t cä quái v§t sau có th¬ tìm trong #Ytàng kinh các#W NPC lînh thß·ng. ")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
if GetNumText() == 3 then
		-- 
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
end
end

--======================
--
--======================
function x009999_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	return
end
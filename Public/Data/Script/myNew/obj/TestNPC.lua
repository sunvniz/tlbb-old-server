x970030_g_ScriptId = 970030

function x970030_OnDefaultEvent(sceneId, selfId, targetId)
 BeginEvent(sceneId)
  AddText(sceneId, "Chào m×ng quý b¢ng hæu tham gia Alpha Test máy chü Game4U, m÷i th¡c m¡c, góp ý, báo l²i vui lòng liên h® Fanpage ð¬ ðßþc giäi ðáp và kh¡c phøc. Chúc b¢ng hæu mµt ngày vui vë.")
  AddNumText(sceneId, selfId, "H°i phøc ð¥y huyªt và nµ khí", 6, 1)
  AddNumText(sceneId, selfId, "Nh§n kÛ nång s½ c¤p môn phái", 6, 6)
  AddNumText(sceneId, selfId, "Nh§n 500.000 kim nguyên bäo", 6, 2)
  AddNumText(sceneId, selfId, "Nh§n 500.000 ði¬m t£ng", 6, 3)
  AddNumText(sceneId, selfId, "Nh§n 5000 vàng", 6, 4)
  EndEvent(sceneId)
 DispatchEventList(sceneId, selfId)
end

function x970030_OnEventRequest(sceneId, selfId, targetId, eventId)
   if GetNumText() == 1 then
        RestoreRage( sceneId, selfId )
        CallScriptFunction( 000064, "Restore_hpmp",sceneId, selfId, targetId )
   elseif GetNumText() == 2 then
        YuanBao(sceneId,selfId,targetId,1,500000)
		 BeginEvent(sceneId)
	   AddText(sceneId, "Các hÕ nh§n ðßþc 500.000 Kim nguyên bäo.")
	   EndEvent(sceneId)
	   DispatchMissionTips(sceneId, selfId)
	   BeginUICommand(sceneId)
	    EndUICommand(sceneId)
	  DispatchUICommand(sceneId,selfId, 1000)
   elseif GetNumText() == 3 then
        ZengDian(sceneId,selfId,targetId,1,500000)
		 BeginEvent(sceneId)
	   AddText(sceneId, "Các hÕ nh§n ðßþc 500.000 Ði¬m t£ng.")
	   EndEvent(sceneId)
	   DispatchMissionTips(sceneId, selfId)
	   BeginUICommand(sceneId)
	    EndUICommand(sceneId)
	  DispatchUICommand(sceneId,selfId, 1000)
   elseif GetNumText() == 4 then
         AddMoney(sceneId,selfId,50000000)
		 BeginUICommand(sceneId)
	    EndUICommand(sceneId)
	  DispatchUICommand(sceneId,selfId, 1000)
   elseif GetNumText() == 5 then  
     BeginAddItem(sceneId)
     AddItem( sceneId,30505805,1)
     Result = EndAddItem(sceneId,selfId)
	 if Result < 1 then 
	   return
	   end
     AddItemListToHuman(sceneId,selfId)
	   BeginEvent(sceneId)
	   AddText(sceneId, "Các hÕ nh§n ðßþc 1 tân mãng th¥n phù c¤p 6.")
	   EndEvent(sceneId)
	   DispatchMissionTips(sceneId, selfId)
	 elseif GetNumText() == 6 then
	 for i =241, 249 do
        AddSkill(sceneId, selfId, i)
     end
	 BeginEvent(sceneId)
	   AddText(sceneId, "Chúc m×ng các hÕ nh§n ðßþc 9 kÛ nång s½ c¤p môn phái.")
	   EndEvent(sceneId)
	   DispatchMissionTips(sceneId, selfId)
		BeginUICommand(sceneId)
	    EndUICommand(sceneId)
	    DispatchUICommand(sceneId,selfId, 1000)
   end
end
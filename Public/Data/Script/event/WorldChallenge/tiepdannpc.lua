x970001_g_ScriptId = 970001
x970001_g_Default_Boss = 45209
x970001_g_Boss_Guard = 45224

function x970001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	    AddText(sceneId, "Chiªn trß¶ng BÕch Mã Lînh ðang trong tình thª vô cùng c¤p bách, tri«u ðình c¥n nhæng nhân sÛ giang h° võ công cao cß¶ng thâm nh§p liêu qu¯c ðÕi doanh, tiêu di®t tên c¥m ð¥u Gia Lu§t Ð¸ch Li®t. Các hÕ phäi chång mu¯n giúp ðÞ?")
		AddNumText(sceneId,selfId,"Ðªn BÕch Mã Lînh",10,1)
		AddNumText(sceneId,selfId,"TÕm bi®t...",8,2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x970001_OnEventRequest(sceneId,selfId,targetId,eventId)

   local DayTime = GetDayTime()
   local Lastime = GetMissionData( sceneId, selfId, MD_TIER1 )
   if GetNumText() == 1 then
    
    local teamMemberCount = GetTeamMemberCount(sceneId, selfId)
    local nearmembercount = GetNearTeamCount( sceneId, selfId )
	if teamMemberCount < 1 then
	 BeginEvent(sceneId)
	  AddText(sceneId, "N½i chiªn trß¶ng ð¥y rçy hi¬m nguy, hãy ðäm bäo ðµi ngû có t¯i thi¬u 3 ngß¶i trß¾c khi hành ðµng.")
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId, targetId)
	 return
	 end
	if LuaFnIsTeamLeader(sceneId, selfId) == 0 then
	 BeginEvent(sceneId)
	  AddText(sceneId, "Ngß½i không phäi là ðµi trß·ng, chï ðµi trß·ng m¾i có th¬ tiªn vào.")
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId, targetId)
	 return
	end
	if nearmembercount~=teamMemberCount then
	BeginEvent(sceneId)
	  AddText(sceneId, "T± ðµi ngß½i có nhóm viên không · g¥n ðây")
	 EndEvent(sceneId)
	 DispatchMissionTips(sceneId,selfId, targetId)
	 return
    end
	for i=0, nearmembercount-1 do
      member = GetNearTeamMember( sceneId, selfId, i )
      if DayTime == GetMissionData( sceneId, member, MD_TIER1) then
	    local textStr = "Trong ðµi ngû cüa các hÕ có thành viên "..GetName(sceneId, member).." ðã hoàn thành lßþt ði cüa ngày hôm nay."
        BeginEvent(sceneId)
	    AddText(sceneId, textStr)
	    EndEvent(sceneId)
	    DispatchEventList(sceneId,selfId, targetId)
		return
      end
    end
     x970001_MakeCopyScene(sceneId, selfId)
  end

  if GetNumText() == 2 then
      BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 1000)
  end
  
end

function x970001_MakeCopyScene(sceneId, selfId)
leaderguid=LuaFnObjId2Guid(sceneId,selfId)
LuaFnSetSceneLoad_Map(sceneId, "cangmang_1.nav")
LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
LuaFnSetCopySceneData_NoUserCloseTime(sceneId,5000)
LuaFnSetCopySceneData_Timer(sceneId, 5000)
LuaFnSetCopySceneData_Param(sceneId, 0,FUBEN_ZHULIN)
LuaFnSetCopySceneData_Param(sceneId, 1, x970001_g_ScriptId)
LuaFnSetCopySceneData_Param(sceneId, 2, 0)
LuaFnSetCopySceneData_Param(sceneId, 3, -1)
LuaFnSetCopySceneData_Param(sceneId, 4, 0)
LuaFnSetCopySceneData_Param(sceneId, 5, 0)
LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
LuaFnSetCopySceneData_Param(sceneId, 7, 0) 
LuaFnSetCopySceneData_Param(sceneId, 9, 0)
LuaFnSetCopySceneData_Param(sceneId, 10, 0)
LuaFnSetCopySceneData_PvpRuler( sceneId, 9 )

LuaFnSetSceneLoad_Monster( sceneId, "cangmang_event_monster.ini" )
local bRetSceneID = LuaFnCreateCopyScene(sceneId);
BeginEvent(sceneId)
if bRetSceneID>0 then
AddText(sceneId,"Tiªn vào phø bän thành công!")
else
AddText(sceneId,"S¯ lßþng phø bän ðã quá täi.")
end
EndEvent(sceneId)
DispatchMissionTips(sceneId,selfId)
end

function x970001_OnCopySceneReady( sceneId, destsceneId )
local DayTime = GetDayTime()
LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId)
leaderguid = LuaFnGetCopySceneData_TeamLeader(destsceneId) 
leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)

local nearmembercount = GetNearTeamCount( sceneId, leaderObjId )
local member
local misIndex
for i=0, nearmembercount-1 do
member = GetNearTeamMember( sceneId, leaderObjId, i )
SetMissionData(sceneId, member, MD_TIER1, DayTime)
if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then
NewWorld( sceneId, member, destsceneId,85,105)
end
end

end

function x970001_OnCopySceneTimer( sceneId, nowTime )
    local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						-- È¡ ði¬mÒÑ¾­Ö´ÐÐtoÕ ðµ ¶¨Ê±´ÎÊý
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount)
	if LuaFnGetCopySceneData_Param(sceneId, 10) == 0 and LuaFnGetCopySceneData_Param(sceneId, 9) >= 40 then
	  LuaFnSetCopySceneData_Param( sceneId, 10, TickCount + 18)
	end
    if LuaFnGetCopySceneData_Param(sceneId, 10) == TickCount then
	  x970001_DeleteAllMonster(sceneId)
	end
	if LuaFnGetCopySceneData_Param( sceneId, 10)~=0 and TickCount + 12 == (LuaFnGetCopySceneData_Param( sceneId, 10)) then
	
	for i=0, num-1 do
	local ServerID = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	  BeginEvent( sceneId )
		AddText( sceneId, "Các hÕ và ðµi ngû còn 60 giây!")
	  EndEvent( sceneId )
	  DispatchMissionTips( sceneId, ServerID)
	  end
	end
	if LuaFnGetCopySceneData_Param( sceneId, 10)~=0 and TickCount + 6 == (LuaFnGetCopySceneData_Param( sceneId, 10)) then
	for i=0, num-1 do
	local ServerID = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	  BeginEvent( sceneId )
		AddText( sceneId, "Các hÕ và ðµi ngû còn 30 giây!")
	  EndEvent( sceneId )
	  DispatchMissionTips( sceneId, ServerID)
	  end
	end
	if LuaFnGetCopySceneData_Param( sceneId, 10)~=0 and TickCount == (LuaFnGetCopySceneData_Param( sceneId, 10) + 1) then
	 for i=0, num-1 do
	 local ServerID = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	  BeginEvent( sceneId )
		AddText( sceneId, "BOSS s¨ xu¤t hi®n sau 5 giây!")
	  EndEvent( sceneId )
	  DispatchMissionTips( sceneId, ServerID)
	  end
	end
	if LuaFnGetCopySceneData_Param( sceneId, 10)~=0 and TickCount == (LuaFnGetCopySceneData_Param( sceneId, 10) + 2) then
      x970001_CreateBoss(sceneId)
    end
	if TickCount == 360 then
	   for i=0, num-1 do
	   local ServerID = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	  BeginEvent( sceneId )
		AddText( sceneId, "Th¶i gian cho nhi®m vø ðã hªt, r¶i cänh!")
	  EndEvent( sceneId )
	  DispatchMissionTips( sceneId, ServerID)
	  NewWorld( sceneId, ServerID, 0, 270, 270 )
	  end
	end
end

function x970001_WhenMonsterDie(sceneId,selfId)
    local killedbossnumber = LuaFnGetCopySceneData_Param( sceneId, 9 )
	killedbossnumber = killedbossnumber + 1
	LuaFnSetCopySceneData_Param( sceneId, 9, killedbossnumber )
	if killedbossnumber <=40 then
	KillStr = format( "Ðã tiêu di®t liêu qu¯c tinh anh võ sî: %d/40",killedbossnumber)
	else
	KillStr = format( "Ðã tiêu di®t Liêu qu¯c doanh trÕi hµ v®: %d/10",killedbossnumber - 40)
	end
	BeginEvent( sceneId )
		AddText( sceneId, KillStr )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	
	if killedbossnumber == 40 then
	  BeginEvent( sceneId )
		AddText( sceneId, "Ðã tiêu di®t toàn bµ võ sî tinh anh! Các hÕ có 90 giây  ð¬ tiêu di®t 10 tên hµ v® cüa tß¾ng Liêu")
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	x970001_WhenAllMonstersDead(sceneId)
	end 
end

function x970001_DeleteAllMonster(sceneId)

 local nMonsterNum = GetMonsterCount(sceneId)
 local Monsters = x970001_g_Boss_Guard
  for i=0, nMonsterNum-1 do
  local MonsterId = GetMonsterObjID(sceneId,i)
   if Monsters == GetMonsterDataID( sceneId, MonsterId ) then
   SetCharacterDieTime( sceneId, MonsterId, 100 )
end
end
   local num = LuaFnGetCopyScene_HumanCount( sceneId )
	for i=0, num-1 do
	local ServerID = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	  BeginEvent( sceneId )
		AddText( sceneId, "Th¶i gian ðã hªt! BOSS s¨ xu¤t hi®n sau 10 giây.")
	  EndEvent( sceneId )
	  DispatchMissionTips( sceneId, ServerID)
	  end
end

function x970001_WhenAllMonstersDead(sceneId)
   for i = 0, 9 do
   local MstId = LuaFnCreateMonster(sceneId,x970001_g_Boss_Guard,52+i*4,25,14,291,970000)
   LuaFnSendSpecificImpactToUnit(sceneId,MstId,MstId,MstId,18,0)
   SetCharacterName(sceneId,MstId,"Liêu Tß¾ng ÐÕi Doanh Hµ V®")
   end 
end

function x970001_CreateBoss(sceneId)
       local killedbossnumber = LuaFnGetCopySceneData_Param(sceneId, 9)
       x970001_g_Default_Boss = x970001_g_Default_Boss + killedbossnumber - 40
	   local MstId2 = LuaFnCreateMonster(sceneId,x970001_g_Default_Boss,70,25,14,290,970003)
       LuaFnSendSpecificImpactToUnit(sceneId,MstId2,MstId2,MstId2,18,0)
       SetCharacterName(sceneId,MstId2,"Gia Lu§t Ð¸ch Li®t")
	   SetCharacterTitle(sceneId,MstId2, "Liêu Qu¯c ÐÕi Tß¾ng Quân")
end


x970004_g_ScriptId = 970004

function x970004_OnDefaultEvent(sceneId, selfId, targetId)
   BeginEvent(sceneId)
    AddText(sceneId, "Chß v¸ anh hùng ðã l§p nên công l¾n, là vi®c ðáng chúc m×ng, ðáng chúc m×ng! ChÆng nhß lû trß·ng b¯i vô døng chúng ta...")
    AddNumText(sceneId, selfId, "Tr· v« LÕc Dß½ng",9, 1)
	AddNumText(sceneId, selfId, "Lão trßþng phäi chång có tâm sñ?", 4, 2)
   EndEvent(sceneId)
   DispatchEventList(sceneId, selfId, targetId)
end


function x970004_OnEventRequest(sceneId, selfId, targetId)
	 if GetNumText() == 1 then
	  NewWorld( sceneId, selfId, 0, 270, 270)
	 end
    if GetNumText() == 2 then
     BeginEvent(sceneId)
	  AddText(sceneId, "ChÆng gi¤u gì các v¸, chuy®n cûng th§t ðáng x¤u h±, nhßng chï vì quá ham mê c¥m kÏ thi h÷a, không lo rèn luy®n võ ngh®, nay n½i ¦n náu cüa b±n môn là núi Lôi C± b¸ nhi«u quái v§t lÕ ðµt ngµt t¤n công, sß phø ðang vô cùng phi«n não..")
	  AddNumText(sceneId, selfId, "Tiªn ðªn Lôi C± s½n",10, 3)
	  AddNumText(sceneId, selfId,"Hüy bö", 8, 4)
	 EndEvent(sceneId)
	 DispatchEventList(sceneId, selfId, targetId)
    end
	if GetNumText() == 3 then
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
	  x970004_MakeCopyScene(sceneId, selfId)
	end
	if GetNumText() == 4 then
	  BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	  EndUICommand( sceneId )
	  DispatchUICommand( sceneId, selfId, 1000)
	end
end

function x970004_MakeCopyScene(sceneId, selfId)
leaderguid=LuaFnObjId2Guid(sceneId,selfId)
LuaFnSetSceneLoad_Map(sceneId, "leigu.nav")
LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
LuaFnSetCopySceneData_NoUserCloseTime(sceneId,5000)
LuaFnSetCopySceneData_Timer(sceneId, 5000)
LuaFnSetCopySceneData_Param(sceneId, 0,FUBEN_ZHULIN)
LuaFnSetCopySceneData_Param(sceneId, 1, x970004_g_ScriptId)
LuaFnSetCopySceneData_Param(sceneId, 2, 0)
LuaFnSetCopySceneData_Param(sceneId, 3, -1)
LuaFnSetCopySceneData_Param(sceneId, 4, 0)
LuaFnSetCopySceneData_Param(sceneId, 5, 0)
LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
LuaFnSetCopySceneData_Param(sceneId, 7, 0) 
LuaFnSetCopySceneData_Param(sceneId, 9, 0)
LuaFnSetCopySceneData_Param(sceneId, 10, 0)
LuaFnSetCopySceneData_PvpRuler( sceneId, 9)

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

function x970004_OnCopySceneReady( sceneId, destsceneId )
LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId)
leaderguid = LuaFnGetCopySceneData_TeamLeader(destsceneId) 
leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)

local nearmembercount = GetNearTeamCount( sceneId, leaderObjId )
local member
local misIndex
for i=0, nearmembercount-1 do
member = GetNearTeamMember( sceneId, leaderObjId, i )
if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then
NewWorld( sceneId, member, destsceneId,56,106)
end
end

end
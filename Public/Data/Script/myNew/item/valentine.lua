--µÀ¾ß: ÉñÃØ²ÊÍà<ID:30504112>
--½Å±¾ºÅ 980000
--Author:zhangzhuang 2008-12-17

x980000_g_scriptId = 980000
x980000_g_SockPrize = {
	                                30008034,
									30900006,
	              } 

x980000_g_strGongGaoInfo = {
	"#c00FFFFÐang c¥m v§t ph¦m #G#{_ITEM30504112} #c00FFFF trên tay, #{_INFOUSR%s}#c00FFFF v×a thØ m· ra, b¤t ng¶ trông th¤y#{_INFOMSG%s}#c00FFFF.",
 	"#c00FFFFÐang c¥m món quà #G#{_ITEM30504112} #c00FFFF trên tay, #{_INFOUSR%s}#c00FFFF v×a m¾i m· ra, may m¡n nh§n ðßþc #{_INFOMSG%s}#c00FFFF.",
  "#c00FFFFÐang c¥m món quà #G#{_ITEM30504112}#c00FFFF trên tay, #{_INFOUSR%s}#c00FFFF v×a thØ m· ra, b¤t ng¶ trông th¤y #{_INFOMSG%s}#c00FFFF.",
}

function x980000_OnDefaultEvent( sceneId, selfId, bagIndex )

end


function x980000_IsSkillLikeScript( sceneId, selfId)
	return 1; 
end



function x980000_CancelImpacts( sceneId, selfId )
	return 0
end



function x980000_OnConditionCheck( sceneId, selfId )
	
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then 
	        local strNotice = "Ch² tr¯ng trong túi xách không ðü."
		      x980000_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
	
	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then 
	        local strNotice = "Ô nguyên li®u không gian không ðü."
		      x980000_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
			
	return 1;
end


function x980000_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end

	return 0;
end


function x980000_OnActivateOnce( sceneId, selfId )


	  LuaFnAuditZhuanDanUsed(sceneId, selfId, 19, 0)
		
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, 17)
    if( RandomBase > 0 ) then    
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, 17 )
        local PrizeNum = 0
        if (RandomID == x980000_g_SockPrize[2] or RandomID == x980000_g_SockPrize[1]) then
          PrizeNum = 5
        else
          PrizeNum = 1
        end
        
        if( RandomID > 0 ) then
           BeginAddItem(sceneId)
				   AddItem( sceneId, RandomID, PrizeNum )
			     local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			     if Ret > 0 then
			       	LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
			       	if 1 == Notice then
			       	   local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					       x980000_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				      end
				      
				      local ItemName = GetItemName(sceneId, RandomID)
				      local strNotice = "ÐÕt ðßþc "..ItemName
				      x980000_ShowNotice( sceneId, selfId, strNotice)
				      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				   else
				      local strNotice = "Ch² tr¯ng trong túi xách không ðü"
				      x980000_ShowNotice( sceneId, selfId, strNotice)
			     end
			
        end
        
    end
    
	return 1;
end


function x980000_OnActivateEachTick( sceneId, selfId)
	return 1; 
end

function x980000_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x980000_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x980000_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format( x980000_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x980000_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end

--ËùÓµÓĞtoÕ ğµ ÊÂ¼şIDÁĞ±í
x400943_g_Transport = 400900

--Íæ¼Ò½øÈëmµt cái area Ê±´¥·¢
function x400943_OnEnterArea( sceneId, selfId )
        if GetLevel( sceneId, selfId ) < 90 then
		BeginEvent( sceneId )
			AddText( sceneId, "Yêu c¥u ğÕt c¤p ğµ 90" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
	else
		CallScriptFunction((x400943_g_Transport), "TransferFunc",sceneId, selfId, 425, 31, 27, 90, 1000)
	end

end


--Íæ¼ÒTÕi mµt cái area ´ôÁËmµt ¶ÎÊ±¼äÃ»×ßÔò¶¨Ê±´¥·¢
function x400943_OnTimer( sceneId, selfId )
	-- ºÁ giây,¿´TÕi Cái này  area Í£Áô¶à¾ÃÁË
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 giâyºóÈÔÎ´´«ËÍ
	if StandingTime >= 5000 then
		x400943_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--Íæ¼ÒÀë¿ªmµt cái area Ê±´¥·¢
function x400943_OnLeaveArea( sceneId, selfId )
end

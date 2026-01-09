--ËùÓµÓĞtoÕ ğµ ÊÂ¼şIDÁĞ±í
x400942_g_Transport = 400900

--Íæ¼Ò½øÈëmµt cái area Ê±´¥·¢
function x400942_OnEnterArea( sceneId, selfId )
        if GetLevel( sceneId, selfId ) < 90 then
		BeginEvent( sceneId )
			AddText( sceneId, "Yêu c¥u ğÕt c¤p ğµ 90" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
	else
		CallScriptFunction((x400942_g_Transport), "TransferFunc",sceneId, selfId, 424, 27, 37, 90, 1000)
	end

end

--Íæ¼ÒTÕi mµt cái area ´ôÁËmµt ¶ÎÊ±¼äÃ»×ßÔò¶¨Ê±´¥·¢
function x400942_OnTimer( sceneId, selfId )
	-- ºÁ giây,¿´TÕi Cái này  area Í£Áô¶à¾ÃÁË
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 giâyºóÈÔÎ´´«ËÍ
	if StandingTime >= 5000 then
		x400942_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--Íæ¼ÒÀë¿ªmµt cái area Ê±´¥·¢
function x400942_OnLeaveArea( sceneId, selfId )
end

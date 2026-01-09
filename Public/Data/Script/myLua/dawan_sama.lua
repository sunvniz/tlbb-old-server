--Íæ¼Ò½øÈëmµt cái area Ê±´¥·¢
function x002934_OnEnterArea( sceneId, selfId )
	if GetLevel( sceneId, selfId)<10 then
		BeginEvent(sceneId)
			strText = "Yêu c¥u ðÆng c¤p 10"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 536,42,225, 10)
		BeginEvent(sceneId)
			strText = "Trß¶ng cänh tÕm th¶i b¸ khóa!"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--Íæ¼ÒTÕi mµt cái area ´ôÁËmµt ¶ÎÊ±¼äÃ»×ßÔò¶¨Ê±´¥·¢
function x002934_OnTimer( sceneId, selfId )
	-- ºÁ giây,¿´TÕi Cái này  area Í£Áô¶à¾ÃÁË
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 giâyºóÈÔÎ´´«ËÍ
	if StandingTime >= 5000 then
		x002934_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--Íæ¼ÒÀë¿ªmµt cái area Ê±´¥·¢
function x002934_OnLeaveArea( sceneId, selfId )
end

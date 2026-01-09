--=======================--
-- Dress Pain - Nhuµm màu th¶i trang
-- Author: Dark.Hades
--=======================--

x830001_g_scriptId = 830001

function x830001_OnDressPaint( sceneId, selfId, DRESS_POS )
	local ItemType = LuaFnGetBagEquipType(sceneId,selfId,DRESS_POS)
	if ItemType ~= 16 then
		x830001_NotifyTip( sceneId, selfId, "Chï có th¶i trang m¾i có th¬ nhßþm màu." )
		return
	end
	local HDT = LuaFnGetAvailableItemCount(sceneId,selfId,30503140)
	local HDTCD = LuaFnGetAvailableItemCount(sceneId,selfId,38000992)
	if HDT + HDTCD < 1 then
		x830001_NotifyTip( sceneId, selfId, "Không có H°ng Di®u ThÕch" )
		return
	end
	local ItemIDStart = LuaFnGetItemTableIndexByIndex(sceneId,selfId,DRESS_POS)
	local DescDress = {10224001, 10224004, 10224006, 10224009, 10224016, 10224025, 10224031, 10224032, 10224034, 10224057, 10224058, 10224059, 10224065, 10224071, 10224072, 10224076, 10224077, 10224079, 10224081, 10224082, 10224083, 10224085, 10224089, 10224091, 10224099}
	local DressGroup = {}
	DressGroup[1] = {10224400, 10224401, 10224402, 10224403, 10224404, 10224405, 10224406, 10224407, 10224408}
	DressGroup[2] = {10224410, 10224411, 10224412, 10224413, 10224414, 10224415, 10224416, 10224417, 10224418}
	DressGroup[3] = {10224420, 10224421, 10224422, 10224423, 10224424, 10224425, 10224426, 10224427, 10224428}
	DressGroup[4] = {10224430, 10224431, 10224432, 10224433, 10224434, 10224435, 10224436, 10224437, 10224438}
	DressGroup[5] = {10224440, 10224441, 10224442, 10224443, 10224444, 10224445, 10224446, 10224447, 10224448}
	DressGroup[6] = {10224450, 10224451, 10224452, 10224453, 10224454, 10224455, 10224456, 10224457, 10224458}
	DressGroup[7] = {10224460, 10224461, 10224462, 10224463, 10224464, 10224465, 10224466, 10224467, 10224468}
	DressGroup[8] = {10224470, 10224471, 10224472, 10224473, 10224474, 10224475, 10224476, 10224477, 10224478}
	DressGroup[9] = {10224480, 10224481, 10224482, 10224483, 10224484, 10224485, 10224486, 10224487, 10224488}
	DressGroup[10] = {10224490, 10224491, 10224492, 10224493, 10224494, 10224495, 10224496, 10224497, 10224498}
	DressGroup[11] = {10224500, 10224501, 10224502, 10224503, 10224504, 10224505, 10224506, 10224507, 10224508}
	DressGroup[12] = {10224510, 10224511, 10224512, 10224513, 10224514, 10224515, 10224516, 10224517, 10224518}
	DressGroup[13] = {10224520, 10224521, 10224522, 10224523, 10224524, 10224525, 10224526, 10224527, 10224528}
	DressGroup[14] = {10224530, 10224531, 10224532, 10224533, 10224534, 10224535, 10224536, 10224537, 10224538}
	DressGroup[15] = {10224540, 10224541, 10224542, 10224543, 10224544, 10224545, 10224546, 10224547, 10224548, 10224549}
	DressGroup[16] = {10224550, 10224551, 10224552, 10224553, 10224554, 10224555, 10224556, 10224557, 10224558, 10224559}
	DressGroup[17] = {10224560, 10224561, 10224562, 10224563, 10224564, 10224565, 10224566, 10224567, 10224568}
	DressGroup[18] = {10224570, 10224571, 10224572, 10224573, 10224574, 10224575, 10224576, 10224577, 10224578}
	DressGroup[19] = {10224580, 10224581, 10224582, 10224583, 10224584, 10224585, 10224586, 10224587, 10224588}
	DressGroup[20] = {10224590, 10224591, 10224592, 10224593, 10224594, 10224595, 10224596, 10224597, 10224598}
	DressGroup[21] = {10224600, 10224601, 10224602, 10224603, 10224604, 10224605, 10224606, 10224607, 10224608}
	DressGroup[22] = {10224610, 10224611, 10224612, 10224613, 10224614, 10224615, 10224616, 10224617, 10224618}
	DressGroup[23] = {10224620, 10224621, 10224622, 10224623, 10224624, 10224625, 10224626, 10224627, 10224628}
	DressGroup[24] = {10224630, 10224631, 10224632, 10224633, 10224634, 10224635, 10224636, 10224637, 10224638}
	DressGroup[25] = {10224640, 10224641, 10224642, 10224643, 10224644, 10224645, 10224646, 10224647, 10224648}

	local CheckID = 0
	local StickID = 0
	local a, b = 0
	for i = 1, getn(DescDress) do
		if ItemIDStart == DescDress[i] then
			a = i
			CheckID = 1
			StickID = 1
			break
		end
	end

	if CheckID == 0 then
		for i = 1, getn(DescDress) do
			for j = 1, getn(DressGroup[i]) do
				if ItemIDStart == DressGroup[i][j] then
					CheckID = 1
					b = i
					break
				end
			end
		end
	end

	-- if CheckID == 0 then
	-- 	x830001_NotifyTip( sceneId, selfId, "Th¶i trang này không th¬ nhßþm màu.")
	-- 	return
	-- end
	if 1==1 then
		LuaFnEquipLevelUp( sceneId, selfId, 1, DRESS_POS )
		x830001_NotifyTip( sceneId, selfId, "Nhßþm màu thành công!")
		return
	end
	if CostMoney(sceneId,selfId,50000) == -1 then
		x830001_NotifyTip( sceneId, selfId, "Không ðü ngân lßþng!")
		return
	end
	if StickID == 1 then
		for i = 2, random(2,getn(DressGroup[a])) do
			ret, arg0 = LuaFnEquipLevelUp( sceneId, selfId, DRESS_POS, DRESS_POS )
		end
	else
		for i = 1, random(1,getn(DressGroup[b])-1) do
			ret, arg0 = LuaFnEquipLevelUp( sceneId, selfId, DRESS_POS, DRESS_POS )
		end
	end

	if HDTCD >= 1 then
		LuaFnDelAvailableItem(sceneId,selfId,38000992,1)
		if LuaFnGetItemBindStatus(sceneId,selfId,DRESS_POS) == 0 then
			LuaFnItemBind(sceneId,selfId,DRESS_POS)
		end
	else
		LuaFnDelAvailableItem(sceneId,selfId,30503140,1)
	end

	x830001_NotifyTip( sceneId, selfId, "Nhßþm màu thành công!")
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
	return
end

function x830001_NotifyTip( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

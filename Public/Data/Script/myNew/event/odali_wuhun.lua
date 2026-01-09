-----------------------------
-- Script: For Item Võ H°n
-- Author: Dark.Hades
-----------------------------

x809270_g_ScriptId	= 809270

x809270_g_Wuhun_Pos = HEQUIP_WUHUN + 100 -- 118

--=====================================--
-- Use GetBagItemParam(sceneId, selfId, x809270_g_Wuhun_Pos, INT_1, INT_2) to get
-- Use SetBagItemParam(sceneId, selfId, ItemPos, INT_1, INT_2, INT_To_Set) to set
-- INT_1 = 0 and INT_2 = 0 :
--=====================================--


function x809270_Kfs_Op_Do(sceneId, selfId, Num, m_Equip_Idx, m_Equip_Item)
  --SetBagItemParam(sceneId, selfId, m_Equip_Idx, 2, 1, 10000)
  local WH = GetBagItemParam(sceneId, selfId, x809270_g_Wuhun_Pos, 2, 1)
  local Item100 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, x809270_g_Wuhun_Pos )
  if (Num == 3) then
    print(WH)
    print(Item100)
  end
end

function x809270_RunHun_Compound(sceneId, selfId, m_slotItem1, m_slotItem2, m_slotItem3)

end

function x809270_NotifyTips( sceneId, selfId, Tip )
  BeginEvent( sceneId )
  AddText( sceneId, Tip )
  EndEvent( sceneId )
  DispatchMissionTips( sceneId, selfId )
end

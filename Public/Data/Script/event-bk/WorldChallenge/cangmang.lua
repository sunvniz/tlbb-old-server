
x970000_g_ScriptId = 970000

function x970000_OnDie(sceneId, objId, killerId)
    local num = LuaFnGetCopyScene_HumanCount( sceneId )
	for i=0, num-1 do
	local ServerID = LuaFnGetCopyScene_HumanObjId( sceneId, i )
    CallScriptFunction( (970001), "WhenMonsterDie", sceneId,ServerID)
	end
end


local cm,m,o=GetID()
--共谋怪人 增添螳螂
function cm.initial_effect(c)
	vgd.VgCard(c)
	--【自】：这个单位登场到R时，选择你其他的1张后防者，这个回合中，力量+5000。
	vgd.EffectTypeTrigger(c,m,LOCATION_MZONE,EFFECT_TYPE_SINGLE,EVENT_SPSUMMON_SUCCESS,cm.op,nil,vgf.RSummonCondition)
end
function cm.op(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
    local g=vgf.SelectMatchingCard(HINTMSG_ATKUP,tp,vgf.RMonsterFilter,tp,LOCATION_MZONE,0,1,1,c)
    vgf.AtkUp(c,g,5000)
end

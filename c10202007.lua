--神秘手风琴师
local cm,m,o=GetID()
function cm.initial_effect(c)
	vgd.VgCard(c)
	--【自】：你的RIDE阶段中这张卡被从手牌舍弃时，你可以将这张卡放置到灵魂里。
	vgd.EffectTypeTrigger(c,m,loc,EFFECT_TYPE_SINGLE,EVENT_TO_GRAVE,cm.operation,vgf.True,cm.condition)
end
function cm.condition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetCurrentPhase()==PHASE_STANDBY and e:GetHandler():IsPreviousLocation(LOCATION_HAND)
end
function cm.operation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local rc=vgf.GetMatchingGroup(vgf.VMonsterFilter,tp,LOCATION_MZONE,0,nil):GetFirst()
	if c:IsRelateToEffect(e) then vgf.Sendto(LOCATION_OVERLAY,c,rc) end
end

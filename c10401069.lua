--自私雕刻师
local cm,m,o=GetID()
function cm.initial_effect(c)
	vgd.VgCard(c)
--	【自】【R】：这个单位的攻击击中时，灵魂填充1。
	vgd.EffectTypeTriggerWhenHitting(c,m,LOCATION_MZONE,EFFECT_TYPE_SINGLE,vgf.OverlayFill(1),nil,vgf.RMonsterCondition)
--	【自】【R】：这个单位攻击的战斗结束时，你的灵魂在10张以上的话，通过【费用】[将这个单位放置到灵魂里]，计数回充1
	vgd.EffectTypeTrigger(c,m,LOCATION_MZONE,EFFECT_TYPE_SINGLE,EVENT_BATTLED,vgf.DamageFill(1),cm.cost,cm.con)
end
function cm.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	if chk==0 then return c:IsRelateToEffect(e) end
	local rc=vgf.GetMatchingGroup(vgf.VMonsterFilter,tp,LOCATION_MZONE,0,nil):GetFirst()
	vgf.Sendto(LOCATION_OVERLAY,c,rc)
end
function cm.con(e,tp,eg,ep,ev,re,r,rp)
	return vgf.GetMatchingGroupCount(nil,tp,LOCATION_OVERLAY,0,nil)>=10 and vgf.RMonsterCondition(e)
end
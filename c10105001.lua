local cm,m,o=GetID()
function cm.initial_effect(c)
	vgf.VgCard(c)
	vgd.EffectTypeIgnition(c,m,LOCATION_MZONE,cm.op1,vgf.DamageCost(1),nil,nil,1)
	vgd.EffectTypeContinuousChangeAttack(c,EFFECT_TYPE_SINGLE,10000,cm.con)
	vgd.TriggerCountUp(c,1)
end
function cm.con(e,c)
	local tp=e:GetHandler()
	return Duel.GetTurnPlayer()==tp and vgf.VMonsterCondition(e) and Duel.IsExistingMatchingCard(cm.filter,tp,LOCATION_ORDER,0,1,nil)
end
function cm.filter(c)
	return c:GetFlagEffect(ImprisonFlag)>0
end
function cm.op1(e,tp,eg,ep,ev,re,r,rp)
	if not vgf.CheckPrison(tp) then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_IMPRISON)
	local g1=Duel.SelectMatchingCard(tp,vgf.RMonsterFilter,tp,0,LOCATION_MZONE,2,2,nil)
	vgf.SendtoPrison(g1,tp)
end
local cm,m,o=GetID()
function cm.initial_effect(c)
	vgd.VgCard(c)
	vgf.AddEffectWhenTrigger(c,m,cm.op)
end
function cm.op(e,tp,eg,ep,ev,re,r,rp)
	local g=vgf.SelectMatchingCard(HINTMSG_VMONSTER,e,tp,vgf.VMonsterFilter,tp,LOCATION_MZONE,0,1,1,nil)
	Duel.ChangePosition(g,POS_FACEUP_ATTACK)
end
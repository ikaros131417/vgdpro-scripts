local cm,m,o=GetID()
function cm.initial_effect(c)
	vgd.VgCard(c)
	vgd.SpellActivate(c,m,cm.op,vgf.CostAnd(vgf.DamageCost(1),vgf.OverlayCost(1)))
end
function cm.op(e,tp,eg,ep,ev,re,r,rp,chk)
	local g=vgf.SelectMatchingCard(HINTMSG_LEAVEFIELD,e,tp,vgf.RMonsterFilter,tp,LOCATION_MZONE,LOCATION_MZONE,1,1,nil)
	if g:GetCount()>0 then
		vgf.Sendto(LOCATION_DROP,g,REASON_EFFECT)
		local ct=bit.ReturnCount(vgf.GetAvailableLocation(tp))
		if chk>0 then if ct>2 then ct=2 end
		else if ct>1 then ct=1 end
		end
		local sg=vgf.SelectMatchingCard(HINTMSG_CALL,e,tp,cm.filter,tp,LOCATION_DROP,0,0,ct,nil,g:GetFirst():GetLevel(),e,tp)
		if sg:GetCount()>0 then
			vgf.Sendto(LOCATION_MZONE,sg,0,tp)
		end
	end
end
function cm.filter(c,lv,e,tp)
	return c:IsLevel(lv) and vgf.IsCanBeCalled(c,e,tp)
end
--友情交友 伊尔达
local cm,m,o=GetID()
function cm.initial_effect(c)
    vgd.VgCard(c)
    -- 【自】：这个单位被放置到G时，选择你的至多1张含有「诚意真心」的后防者，返回手牌。（即使被攻击的单位离场，发起攻击的单位的玩家也要正常进行驱动判定以及结算战斗结束时的能力。）
    vgd.EffectTypeTrigger(c,m,nil,EFFECT_TYPE_SINGLE,EVENT_MOVE,cm.op,nil,cm.con)

end
function cm.con(e,tp,eg,ep,ev,re,r,rp)
    local c = e:GetHandler()
    return c:IsLocation(LOCATION_GZONE)
end

function cm.op(e,tp,eg,ep,ev,re,r,rp)
    VgF.CardsFromTo(REASON_EFFECT,LOCATION_HAND,LOCATION_MZONE,cm.filter,0,1)(e,tp,eg,ep,ev,re,r,rp)
    -- local g = vgf.SelectMatchingCard(HINTMSG_ATOHAND,e,tp,cm.filter,tp,LOCATION_MZONE,0,0,1,nil)
    -- vgf.Sendto(LOCATION_HAND,g)
end

function cm.filter(c)
    return c:IsSetCard(0xb6) and vgf.RMonsterFilter(c)
end
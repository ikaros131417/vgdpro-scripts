--救命天使 库拉比耶尔
local cm,m,o=GetID()
function cm.initial_effect(c)
    vgf.VgCard(c)
    vgd.CardToG(c,m,vgf.DisCardCost(1))
end
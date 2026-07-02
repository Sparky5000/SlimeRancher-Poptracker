-- this is the file to put all your custom logic functions into.
-- if you dont want to use the json based logic you can switch to a graph-based logic method.
-- the needed functions for that are in `/scripts/logic/graph_logic/logic_main.lua`.

--- setting functions
function EasySkips()
    return has("EasySkips")
end
function PreciseMovement()
    return has("PreciseMovement")
end
function DangerousSkips()
    return has("DangerousSkips")
end
function ObscureLocations()
    return has("ObscureLocations")
end
function LargoJumps()
    return has("LargoJumps")
end
function JetpackBoosts()
    return has("JetpackBoosts")
end
function PostGameEnabled()
    return has("postgame")
end
function MarketLogic()
    return has("MarketLogic")
end

--Item functions
function hasJetpack()
    return has("progressivejetpack")
end

-- region functions
function hasGlassDesert()
    return has("regionunlock-glassdesert")
end
function hasSlimeulation()
    return has("regionunlock-theslimeulations")
end
function hasDocks()
    return has("regionunlock-thedocks")
end
function hasMossBlanket()
    return has("regionunlock-mossblanket")
end
function hasGrotto()
    return has("regionunlock-thegrotto")
end
function hasOgdensRetreat()
    return has("regionunlock-ogdensretreat")
end
function hasWilds()
    return has("regionunlock-thewilds")
end
function hasMochisManor()
    return has("regionunlock-mochismanor")
end
function hasDryReef()
    return has("regionunlock-dryreef")
end
function hasOverGrowth()
    return has("regionunlock-theovergrowth")
end
function hasAncientRuinsTransition()
    return has("regionunlock-ancientruinstransition")
end
function hasIndigoQuarry()
    return has("regionunlock-indigoquarry")
end
function hasViktorsWorkshop()
    return has("regionunlock-viktorsworkshop")
end
function hasNimbleValley()
    return has("regionunlock-nimblevalley")
end
function hasAncientRuins()
    return has("regionunlock-ancientruins")
end
function hasTheLab()
    return has("regionunlock-thelab")
end

-- Plort Logic functions
function hasPlort(plort)
--    if plort == "Pink" then
        return ACCESS_NORMAL
    end
--    if plort == "Tabby" then
--       local Tabby = {"DryReefMain","DryReefBeach","DryReefRingIsland","MossBlanketMain","MossBlanketMushroomIsland","AncientRuinsMain","GlassDesertFirstHalf","GlassDesertSecondHalf","TheWilds","DryReefOffshoot"}
--        for _, tabbyregion in ipairs(Tabby) do
--            if CanReach(tabbyregion) then
--                return ACCESS_NORMAL
--            end
--        end
--    end
--    if plort == "Rock" then
--        if MarketLogic() then
--            return ACCESS_NORMAL
--        end
--        local Rock = {"DryReefMain","DryReefBeach","DryReefRingIsland","IndigoQuarryBeforeFirstBridge","IndigoQuarryAfterTheBridge","IndigoQuarryAsheIsles","IndigoQuarryAncientRuinsTransitionOverlap","AncientRuinsMain","GlassDesertFirstHalf","GlassDesertSecondHalf","TheWilds","DryReefOffshoot"}
--        for i, rockregion in ipairs(Rock) do
--            if CanReach(rockregion) then
--                return ACCESS_NORMAL
--            end
--        end
--    end
--end

-- Slime Gate Logic Functions, abbreviated Startlocation to EndLocation

function slimeGateARTtoAR()
    return ACCESS_NORMAL
end
function slimeGateDRtoMB()
    return ACCESS_NORMAL
end
function slimeGateDRtoIQ()
    return ACCESS_NORMAL
end
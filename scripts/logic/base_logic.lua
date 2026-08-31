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

-- treasure cracker check visibilty function

function TreasureCrackerVis(amount)
    return Tracker:ProviderCountForCode("TreasureCrackerChecks") >= tonumber(amount)
end

-- Plort Logic functions
function hasPlort(plort)
    if plort == "Pink" then
        return ACCESS_NORMAL
    end
    if plort == "Tabby" then
        if MarketLogic() > 0 then
            return ACCESS_NORMAL
        else
            return ANY(
                CanReach("DryReefMain"),
                CanReach("DryReefBeach"),
                CanReach("DryReefRingIsland"),
                CanReach("MossBlanketMain"),
                CanReach("MossBlanketMushroomIsland"),
                CanReach("AncientRuinsMain"),
                CanReach("GlassDesertFirstHalf"),
                CanReach("GlassDesertSecondHalf"),
                CanReach("TheWilds"),
                CanReach("DryReefOffshoot")
            )
        end
    end
    if plort == "Rock" then
        if MarketLogic() > 0 then
            return ACCESS_NORMAL
        else
            return ANY(
                CanReach("DryReefMain"),
                CanReach("DryReefBeach"),
                CanReach("DryReefRingIsland"),
                CanReach("IndigoQuarryBeforeFirstBridge"),
                CanReach("IndigoQuarryAfterTheBridge"),
                CanReach("IndigoQuarryAsheIsles"),
                CanReach("IndigoQuarryAncientRuinsTransitionOverlap"),
                CanReach("AncientRuinsMain"),
                CanReach("GlassDesertFirstHalf"),
                CanReach("GlassDesertSecondHalf"),
                CanReach("TheWilds"),
                CanReach("DryReefOffshoot")
            )
        end
    end
    if plort == "Phosphor" then
        if MarketLogic() > 0 then
            return ACCESS_NORMAL
        else
            return ANY(
                CanReach("DryReefMain"),
                CanReach("DryReefBeach"),
                CanReach("DryReefRingIsland"),
                CanReach("SlimeSeaBetweenGrottoAndDryReedIsland2"),
                CanReach("IndigoQuarryBeforeFirstBridge"),
                CanReach("IndigoQuarryAfterTheBridge"),
                CanReach("IndigoQuarryAsheIsles"),
                CanReach("IndigoQuarryAncientRuinsTransitionOverlap"),
                CanReach("MossBlanketMain"),
                CanReach("MossBlanketMushroomIsland"),
                CanReach("AncientRuinsMain"),
                CanReach("SlimeSeaBetweenGrottoAndDryReedIsland1"),
                CanReach("MossBlanketHuntersDomain")
            )
        end
    end
    if plort == "Boom" then
        if MarketLogic() > 0 then
            return CanReach("DryReefMain")
        else
            return ANY(
                CanReach("IndigoQuarryBeforeFirstBridge"),
                CanReach("IndigoQuarryAfterTheBridge"),
                CanReach("IndigoQuarryAncientRuinsTransitionOverlap"),
                CanReach("MossBlanketMain"),
                CanReach("AncientRuinsMain")
            )
        end
    end
    if plort == "Rad" then
        if MarketLogic() > 0 then
            return CanReach("DryReefMain")
        else
            return ANY(
                CanReach("IndigoQuarryBeforeFirstBridge"),
                CanReach("IndigoQuarryAfterTheBridge"),
                CanReach("TheWilds")
            )
        end
    end
    if plort == "Crystal" then
        if MarketLogic() > 0 then
            return CanReach("DryReefMain")
        else
            return ANY(
                CanReach("IndigoQuarryBeforeFirstBridge"),
                CanReach("IndigoQuarryAsheIsles")
            )
        end
    end
    if plort == "Honey" then
        if MarketLogic() > 0 then
            return CanReach("DryReefMain")
        else
            return CanReach("MossBlanketMain")
        end
    end
    if plort == "Hunter" then
        if MarketLogic() > 0 then
            return CanReach("DryReefMain")
        else
            return CanReach("MossBlanketMain")
        end
    end
    if plort == "Puddle" then
        if MarketLogic() > 0 then
            return CanReach("DryReefMain")
        else
            return ANY(
                CanReach("IndigoQuarryBeforeFirstBridge"),
                CanReach("MossBlanketMain"),
                CanReach("AncientRuinsMain")
            )
        end
    end
    if plort == "Lucky" then
        return ANY(
            CanReach("DryReefMain"),
            CanReach("DryReefBeach"),
            CanReach("DryReefRingIsland"),
            CanReach("SlimeSeaBetweenGrottoAndDryReedIsland2"),
            CanReach("IndigoQuarryBeforeFirstBridge"),
            CanReach("IndigoQuarryAfterTheBridge"),
            CanReach("IndigoQuarryAsheIsles"),
            CanReach("IndigoQuarryAncientRuinsTransitionOverlap"),
            CanReach("MossBlanketMain"),
            CanReach("MossBlanketMushroomIsland"),
            CanReach("AncientRuinsMain"),
            CanReach("GlassDesertFirstHalf"),
            CanReach("GlassDesertSecondHalf"),
            CanReach("TheWilds"),
            CanReach("DryReefOffshoot"),
            CanReach("SlimeSeaBetweenGrottoAndDryReedIsland1"),
            CanReach("MossBlanketHuntersDomain"),
            CanReach("SlimeSeaMustacheShrine"),
            CanReach("AncientRuinsTransition"),
            CanReach("SlimeSeaOffMossBlanket")
        )
    end
    if plort == "Quantum" then
        return CanReach("AncientRuinsMain")
    end
    if plort == "Dervish" or "Tangle" or "Mosaic" or "Fire" then
        return ANY(
            CanReach("GlassDesertFirstHalf"),
            CanReach("GlassDesertSecondHalf")
        )
    end
    if plort == "Gold" then
        return CanReach("GlassDesertFirstHalf")
    end
end
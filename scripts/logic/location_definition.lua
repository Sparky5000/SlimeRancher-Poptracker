-- Regions
TheRanch = slime_rancher_location.new("TheRanch")
TheSlimeulations = slime_rancher_location.new("TheSlimeulations")
TheDocks = slime_rancher_location.new("TheDocks")
MossBlanketMain = slime_rancher_location.new("MossBlanketMain")
MossBlanketHuntersDomain = slime_rancher_location.new("MossBlanketHuntersDomain")
MossBlanketMushroomIsland = slime_rancher_location.new("MossBlanketMushroomIsland")
TheGrotto = slime_rancher_location.new("TheGrotto")
OgdensRetreat = slime_rancher_location.new("OgdensRetreat")
TheWilds = slime_rancher_location.new("TheWilds")
MochisManor = slime_rancher_location.new("MochisManor")
DryReefMain = slime_rancher_location.new("DryReefMain")
DryReefBeach = slime_rancher_location.new("DryReefBeach")
DryReefRingIsland = slime_rancher_location.new("DryReefRingIsland")
DryReefOffshoot = slime_rancher_location.new("DryReefOffshoot")
TheOverGrowth = slime_rancher_location.new("TheOverGrowth")
IndigoQuarryBeforeFirstBridge = slime_rancher_location.new("IndigoQuarryBeforeFirstBridge")
IndigoQuarryAfterTheBridge = slime_rancher_location.new("IndigoQuarryAfterTheBridge")
IndigoQuarryAsheIsles = slime_rancher_location.new("IndigoQuarryAsheIsles")
IndigoQuarryAncientRuinsTransitionOverlap = slime_rancher_location.new("IndigoQuarryAncientRuinsTransitionOverlap")
ViktorsWorkshop = slime_rancher_location.new("ViktorsWorkshop")
NimbleValley = slime_rancher_location.new("NimbleValley")
AncientRuinsMain = slime_rancher_location.new("AncientRuinsMain")
AncientRuinsTransition = slime_rancher_location.new("AncientRuinsTransition")
AncientRuinsTeleporterRoom = slime_rancher_location.new("AncientRuinsTeleporterRoom")
GlassDesertFirstHalf = slime_rancher_location.new("GlassDesertFirstHalf")
GlassDesertSecondHalf = slime_rancher_location.new("GlassDesertSecondHalf")
TheLab = slime_rancher_location.new("TheLab")
SlimeSeaMustacheShrine = slime_rancher_location.new("SlimeSeaMustacheShrine")
SlimeSeaOffMossBlanket = slime_rancher_location.new("SlimeSeaOffMossBlanket")
SlimeSeaBetweenGrottoAndDryReefIsland1 = slime_rancher_location.new("SlimeSeaBetweenGrottoAndDryReefIsland1")
SlimeSeaBetweenGrottoAndDryReefIsland2 = slime_rancher_location.new("SlimeSeaBetweenGrottoAndDryReefIsland2")
PostGame = slime_rancher_location.new("PostGame")
DryReefHVault = slime_rancher_location.new("DryReefHVault")
IndigoQuarryHVault = slime_rancher_location.new("IndigoQuarryHVault")
MossBlanketHVault = slime_rancher_location.new("MossBlanketHVault")

-- Connections
-- The ranch
Entry_Point:connect_one_way(TheRanch)
TheRanch:connect_one_way(TheLab,hasTheLab)
TheRanch:connect_one_way(DryReefMain,hasDryReef)
TheRanch:connect_one_way(DryReefBeach,function()
    return ALL(
        hasDryReef,
        ObscureLocations
    )
end)
TheRanch:connect_one_way(TheOverGrowth,hasOverGrowth)
TheRanch:connect_one_way(TheDocks,function()
    return ALL(
        hasDocks,
        ObscureLocations
    )
end)
TheRanch:connect_one_way(TheGrotto,hasGrotto)
-- The Lab and Viktors Workshop
TheLab:connect_one_way(ViktorsWorkshop,function()
    return ALL(
        hasViktorsWorkshop,
        hasPlort("Quantum"),
        CanReach("AncientRuinsMain")
    )
end)
ViktorsWorkshop:connect_one_way(TheSlimeulations,hasSlimeulation)
-- Dry Reef Main
DryReefMain:connect_one_way(MossBlanketMain,hasMossBlanket)
DryReefMain:connect_one_way(IndigoQuarryBeforeFirstBridge,hasIndigoQuarry)
DryReefMain:connect_one_way(DryReefOffshoot,function()
    return ALL(
        hasDryReef,
        PreciseMovement
    )
end)
DryReefMain:connect_one_way(SlimeSeaMustacheShrine, function()
    return ALL(
        hasJetpack,
        has("powercore3"),
        ObscureLocations
    )
end)
DryReefMain:connect_one_way(DryReefBeach,hasDryReef)
DryReefMain:connect_one_way(TheDocks,hasDocks)
-- The Overgrowth
TheOverGrowth:connect_one_way(DryReefBeach,hasDryReef)
TheOverGrowth:connect_one_way(OgdensRetreat,function()
    return ALL(
        hasOgdensRetreat,
        hasPlort("Boom"),
        hasPlort("Honey"),
        hasPlort("Hunter"),
        CanReach("MossBlanketMain")
    )
end)
TheOverGrowth:connect_one_way(TheDocks,hasDocks)
-- The Grotto
TheGrotto:connect_one_way(MochisManor,function()
    return ALL(
        hasMochisManor,
        hasPlort("Boom"),
        hasPlort("Rad"),
        hasPlort("Crystal"),
        CanReach("IndigoQuarryBeforeFirstBridge")
    )
end)
TheGrotto:connect_one_way(SlimeSeaBetweenGrottoAndDryReefIsland1,function()
    return ANY(
        ALL(
            PreciseMovement,
            ObscureLocations
        ),
        hasJetpack
    )
end)
-- Slime Sea Islands between grotto and dry reef
SlimeSeaBetweenGrottoAndDryReefIsland1:connect_two_ways_stuck(SlimeSeaBetweenGrottoAndDryReefIsland2,function()
    return ANY(
        hasJetpack(),
        ALL(
            PreciseMovement,
            DangerousSkips
        )
    )
end,
hasJetpack)
SlimeSeaBetweenGrottoAndDryReefIsland2:connect_two_ways_stuck(DryReefOffshoot,function()
    return ALL(
        hasDryReef,
        hasJetpack
    )
end,
hasJetpack)
-- Mochis Manor
MochisManor:connect_one_way(NimbleValley,hasNimbleValley)
-- Ogdens Retreat
OgdensRetreat:connect_one_way(TheWilds,hasWilds)
-- Dry Reef Beach
DryReefBeach:connect_one_way(DryReefRingIsland,function()
    return ALL(
        hasDryReef(),
        ANY(
            EasySkips,
            hasJetpack
        )
    )
end)
-- Indigo Quarry Bridges
IndigoQuarryBeforeFirstBridge:connect_two_ways(IndigoQuarryAfterTheBridge,function()
    return ALL(
    hasIndigoQuarry,
    hasJetpack
    )
end)
IndigoQuarryAfterTheBridge:connect_two_ways_stuck(IndigoQuarryAncientRuinsTransitionOverlap,function()
    return ALL(
        hasIndigoQuarry,
        hasAncientRuinsTransition
    )
end,
function() return hasIndigoQuarry() end)
IndigoQuarryAfterTheBridge:connect_one_way(IndigoQuarryAsheIsles,hasIndigoQuarry)
IndigoQuarryAncientRuinsTransitionOverlap:connect_two_ways_stuck(AncientRuinsTransition,hasAncientRuinsTransition,
function()
    return ALL(
        hasIndigoQuarry,
        hasAncientRuinsTransition
    )
end)
-- Moss Blanket Main and hunters domain
MossBlanketMain:connect_one_way(MossBlanketMushroomIsland,function()
    return ALL(
        hasMossBlanket,
        ANY(
            hasJetpack,
            ALL(
                PreciseMovement,
                ObscureLocations
            )
        )
    )
end)
MossBlanketMain:connect_one_way(AncientRuinsTransition,hasAncientRuinsTransition)
MossBlanketMain:connect_one_way(MossBlanketHuntersDomain,function()
    return ALL(
        hasMossBlanket,
        ANY(
            ALL(
                PreciseMovement,
                DangerousSkips
            ),
            hasJetpack
        )
    )
end)
MossBlanketHuntersDomain:connect_one_way(SlimeSeaOffMossBlanket,function()
    return ALL(
        hasMossBlanket,
        hasJetpack,
        ANY(
            has("powercore3"),
            ALL(
                has("powercore2"),
                ObscureLocations
            )
        )
    )
end)
-- Ancient Ruins
AncientRuinsTransition:connect_one_way(AncientRuinsMain,function()
    return ALL(
        hasAncientRuins,
        hasPlort("Tabby"),
        hasPlort("Rock"),
        hasPlort("Phosphor"),
        hasPlort("Boom"),
        hasPlort("Rad"),
        hasPlort("Honey")
    )
end)
AncientRuinsMain:connect_one_way(AncientRuinsTeleporterRoom,hasAncientRuins)
AncientRuinsTeleporterRoom:connect_one_way(GlassDesertFirstHalf,function()
    return ALL(
        hasGlassDesert,
        hasPlort("Quantum")
    )
end)
-- Glass Desert
GlassDesertFirstHalf:connect_one_way(GlassDesertSecondHalf,hasGlassDesert)
GlassDesertSecondHalf:connect_one_way(PostGame,PostGameEnabled)
-- Post Game
PostGame:connect_one_way(DryReefHVault,function()
    return ALL(
        hasDryReef,
        ANY(
            hasJetpack,
            EasySkips
        ),
        PostGameEnabled
    )
end)
PostGame:connect_one_way(IndigoQuarryHVault,function()
    return ALL(
        hasIndigoQuarry,
        ANY(
            hasJetpack,
            PreciseMovement
        ),
        PostGameEnabled
    )
end)
PostGame:connect_one_way(MossBlanketHVault, function()
    return ALL(
        hasMossBlanket,
        hasJetpack,
        PostGameEnabled
    )
end)
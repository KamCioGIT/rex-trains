Config = {}

Config.Debug = false

Config.TrainSetup = {

    -- trains
{
        trainname = 'Orient Express',
        trainid = 'train1',
        trainhash = -2006657222,
        startcoords = vector3(-504.0194, -432.0699, 82.54294),
        route = 'trainRouteOne',
    },
    {
        trainname = 'Flying Scotsman',
        trainid = 'train2',
        trainhash = -1719006020,
        startcoords = vector3(2729.5883, -1459.727, 45.903129),
        route = 'trainRouteTwo',
    },
    --[[
    {
        trainname = 'City Tram',
        trainid = 'train3',
        trainhash = -1083616881,
        startcoords = vector3(2608.539, -1171.967, 53.77959),
        route = 'tramRouteOne',
    },
    --]]
}

-- train route one switches
Config.RouteOneTrainSwitches = {

    { coords = vector3(-281.1323, -319.6579, 89.02458), trainTrack = -705539859,  junctionIndex = 2,  enabled = 1 },
    { coords = vector3(357.959, 596.374, 115.6759),     trainTrack = 1499637393,  junctionIndex = 4,  enabled = 0 },
    { coords = vector3(1481.54, 648.331, 92.30682),     trainTrack = 1499637393,  junctionIndex = 2,  enabled = 1 },
    { coords = vector3(2464.55, -1475.74, 46.15192),    trainTrack = -760570040,  junctionIndex = 5,  enabled = 1 },
    { coords = vector3(2654.026, -1477.149, 45.75834),  trainTrack = -1242669618, junctionIndex = 2,  enabled = 1 },
    { coords = vector3(2659.79, -435.7114, 43.38848),   trainTrack = -705539859,  junctionIndex = 13, enabled = 0 },
    
}

-- train route one (via valentine)
Config.RouteOneTrainStops = {

    { dst = 100.0, dst2 = 10.0, coords = vector3(-318.5835, -339.5699, 89.8374),   waittime = 15000, name = "Flatneck Station" },
    { dst = 100.0, dst2 = 10.0, coords = vector3(-154.6459, 639.7926, 113.52259),  waittime = 15000, name = "Valentine Station" },
    { dst = 100.0, dst2 = 10.0, coords = vector3(511.73336, 654.95397, 115.67657), waittime = 15000, name = "Heartland Oil Fields" },
    { dst = 100.0, dst2 = 10.0, coords = vector3(1529.366, 422.21853, 90.355613),  waittime = 15000, name = "Emerald Station" },
    { dst = 400.0, dst2 = 10.0, coords = vector3(2732.3334, -1445.62, 45.773746),  waittime = 15000, name = "Saint Denis Station" },
    { dst = 100.0, dst2 = 10.0, coords = vector3(2895.6479, 645.07153, 57.12009),  waittime = 15000, name = "Van Horn Trading Post" },
    { dst = 100.0, dst2 = 10.0, coords = vector3(2962.6826, 1293.7446, 43.906204), waittime = 15000, name = "Annesburg Station" },
    { dst = 100.0, dst2 = 10.0, coords = vector3(572.00677, 1713.8681, 187.75619), waittime = 15000, name = "Bacchus Station" },
    { dst = 100.0, dst2 = 10.0, coords = vector3(-1319.959, 388.2633, 95.492622),  waittime = 15000, name = "Wallace Station" },
    { dst = 100.0, dst2 = 10.0, coords = vector3(-1090.563, -588.4188, 81.372642), waittime = 15000, name = "Riggs Station" },

}

-- train route two switches
Config.RouteTwoTrainSwitches = {

    { coords = vector3(2659.79, -435.7114, 43.38848),   trainTrack = -705539859,  junctionIndex = 13, enabled = 0 },
    { coords = vector3(610.3571, 1661.904, 187.3867),   trainTrack = -705539859,  junctionIndex = 8,  enabled = 1 },
    { coords = vector3(556.65, 1725.99, 187.7966),      trainTrack = -705539859,  junctionIndex = 7,  enabled = 1 },
    { coords = vector3(-281.1323, -319.6579, 89.02458), trainTrack = -705539859,  junctionIndex = 2,  enabled = 0 },
    { coords = vector3(2588.54, -1482.19, 46.04693),    trainTrack = -705539859,  junctionIndex = 18, enabled = 1 },
    { coords = vector3(2654.026, -1477.149, 45.75834),  trainTrack = -1242669618, junctionIndex = 2,  enabled = 1 },
    
}

-- train route one (via valentine)
Config.RouteTwoTrainStops = {

    { dst = 100.0, dst2 = 10.0, coords = vector3(-318.5835, -339.5699, 89.8374),   waittime = 15000, name = "Flatneck Station" },
    { dst = 100.0, dst2 = 10.0, coords = vector3(1238.4562, -1322.457, 76.439476), waittime = 15000, name = "Rhodes Station" },
    { dst = 400.0, dst2 = 10.0, coords = vector3(2732.3334, -1445.62, 45.773746),  waittime = 15000, name = "Saint Denis Station" },
    { dst = 100.0, dst2 = 10.0, coords = vector3(2895.6479, 645.07153, 57.12009),  waittime = 15000, name = "Van Horn Trading Post" },
    { dst = 100.0, dst2 = 10.0, coords = vector3(2962.6826, 1293.7446, 43.906204), waittime = 15000, name = "Annesburg Station" },
    { dst = 100.0, dst2 = 10.0, coords = vector3(572.00677, 1713.8681, 187.75619), waittime = 15000, name = "Bacchus Station" },
    { dst = 100.0, dst2 = 10.0, coords = vector3(-1319.959, 388.2633, 95.492622),  waittime = 15000, name = "Wallace Station" },
    { dst = 100.0, dst2 = 10.0, coords = vector3(-1090.563, -588.4188, 81.372642), waittime = 15000, name = "Riggs Station" },

}

-- tram route switches
Config.RouteOneTramSwitches = {

    { coords = vector3(2615.05, -1281.2, 52.34358),  trainTrack = -1739625337,  junctionIndex = 6,  enabled = 0 },
    { coords = vector3(2608.49, -1254.66, 52.66566), trainTrack = -1739625337,  junctionIndex = 7,  enabled = 0 },
    { coords = vector3(2686.55, -1385.46, 46.36679), trainTrack = -1739625337,  junctionIndex = 3,  enabled = 1 },
    { coords = vector3(2624.4, -1139.85, 51.51707),  trainTrack = -1739625337,  junctionIndex = 11, enabled = 0 },
    
}

-- train route one (via valentine)
Config.RouteOneTramStops = {

    { dst = 5.0, dst2 = 2.0, coords = vector3(2608.4047, -1167.057, 52.820415), waittime = 15000, name = "Tram Stop One" },
    { dst = 5.0, dst2 = 2.0, coords = vector3(2611.6467, -1272.544, 52.68666),  waittime = 15000, name = "Tram Stop Two" },
    { dst = 5.0, dst2 = 2.0, coords = vector3(2662.8601, -1356.986, 48.655387), waittime = 15000, name = "Tram Stop Three" },
    { dst = 5.0, dst2 = 2.0, coords = vector3(2743.4992, -1412.629, 46.014671), waittime = 15000, name = "Tram Stop Four" },
    { dst = 5.0, dst2 = 2.0, coords = vector3(2803.9904, -1315.502, 46.508392), waittime = 15000, name = "Tram Stop Five" },
    { dst = 5.0, dst2 = 2.0, coords = vector3(2800.0747, -1243.424, 47.573413), waittime = 15000, name = "Tram Stop Seven" },
    { dst = 5.0, dst2 = 2.0, coords = vector3(2768.4904, -1167.407, 48.483325), waittime = 15000, name = "Tram Stop Eight" },
    { dst = 5.0, dst2 = 2.0, coords = vector3(2698.853, -1139.906, 50.469024),  waittime = 15000, name = "Tram Stop Nine" },

}

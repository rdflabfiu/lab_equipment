%tool_change

N005 #MCS ON

N010 V.E.TOOL_RADIUS   = V.G.WZ[V.G.T_AKT].R*10000
N020 V.E.TOOL_PARAM[0] = V.G.WZ[V.G.T_AKT].P[0]
N030 V.E.TOOL_PARAM[1] = V.G.WZ[V.G.T_AKT].P[1]
N040 V.E.TOOL_PARAM[2] = V.G.WZ[V.G.T_AKT].P[2]
N050 V.E.TOOL_PARAM[3] = V.G.WZ[V.G.T_AKT].P[3]
N060 V.E.TOOL_PARAM[4] = V.G.WZ[V.G.T_AKT].P[4]
N070 V.E.TOOL_PARAM[5] = V.G.WZ[V.G.T_AKT].P[5]
N080 V.E.TOOL_NR       = V.G.T_AKT

N090 M07

N100 #MCS OFF

N200 M29
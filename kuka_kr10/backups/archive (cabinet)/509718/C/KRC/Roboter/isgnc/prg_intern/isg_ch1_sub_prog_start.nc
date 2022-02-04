(----------------------------------------------------------------------------)
( FILE NAME: isg_ch1_sub_prog_start.nc                    DATE:  01-Dec-2015 )
( VERSION: 300.01.06                                           Copyright ISG )
(----------------------------------------------------------------------------)
( Internally used programm to start NC-Code at program start.                )
(----------------------------------------------------------------------------)
( HISTORY:                                                                   )
( Sep 01, 2010 Created                                                       )
( Nov 21, 2010 Number of HSC parameter reduced                               )
( Mar 21, 2011 #HSC ON removed                                               )
( Jul 08, 2011 Remove #SET SLOPE PROFIL, default in def. SDA-MDS is 3 now    )
( Oct 12, 2011 Feed axes defined                                             )
( Jan 24, 2012 G129, Exampel for weighting of G00 added                      )
( Mar 12, 2012 Set vector limit in T1                                        )
( Mar 28, 2012 G231/G233 for weighting of G00 acceleration and ramp time new )
( Apr 18, 2012 CRDB00052116, ER4987, do not enable trafo in teach mode       )
( Dec 01, 2015 Use MAX_ANGLE 179 for B-spline                                )
(=================== End of NC-program header ===============================)

%isg_sub_prog_start

N001 V.E.NC_LOG_PATH_NUMBER=2

( Set slope type )
( N010 #SLOPE[TYPE=HSC]

( Activate kinematic transformation if no teach mode is on )
N020 $IF V.E.HMI_OPERATION_MODE != 7
N021 #TRAFO ON
N022 $ENDIF

( G129: Weighting of G00 velocity in % )
( G231: Weighting of G00 acceleration in % )
( G233: Weighting of G00 ramp time in % )
( N025 G129 = 50
N026 G231=50
N027 G233=200

( G130: Axis specific weighting of acceleration in % )
( G131: Axis group specific weighting of acceleration in % )
( N030 G130 X90 Y90 Z90 A90 B90 C90
( N030 G131 = 90

( G132: Axis specific weighting of ramp time to reach max. acceleration in % )
( G133: Axis group specific weighting of ramp time to reach max. acceleration in % )
( N040 G132 X50 Y50 Z50 A50 B50 C50 Y1=1
( N040 G133 = 50

( Axis group specific weighting of geometric ramp time in % )
( N050 G134 = 50

( Set parameter for HSC mode )
N060 #HSC [BSPLINE PATH_DEV 0.2 TRACK_DEV 0.2 MAX_ANGLE 179]

( Set feed axes )
( Disable #FGROUP until #4327 is fixed )
; N070 #FGROUP [X,Y,Z,A,B,C]

( Set reduced speed limit in T1 )
( limit must be < 15000 mm/min = 250 mm/s )
N100 $IF V.E.REDUCED_SPEED_ACTIVE==TRUE
N110   #VECTOR LIMIT ON [VEL=12500]
N120 $ELSE
N130   #VECTOR LIMIT OFF [VEL]
N140 $ENDIF

N099 V.E.NC_LOG_PATH_NUMBER=1

N100 M29

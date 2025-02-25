(----------------------------------------------------------------------------)
( FILE NAME: isg_teach_point.nc                           DATE:  18-Apr-2012 )
( VERSION: 2.6.3                                          Copyright ISG      )
(----------------------------------------------------------------------------)
( Internally used programm to write a teached position                       )
(----------------------------------------------------------------------------)
( HISTORY:                                                                   )
( Apr 04, 2011 Created                                                       )
( Apr 18, 2012 CRDB00052116, ER4987, enable trafo for cartesian position only)
( Apr 03, 2013 #866, axis Y1 removed                                         )
(=================== End of NC-program header ===============================)
%teach_point

N010 #FILENAME [MSG=V.E.TEACH_FILE_NAME]
N020 #CHANNEL INIT [CMDPOS]

N100 $IF V.E.TEACH_ACS==1
       (Axis specific motion)
N120   #MSG SAVE EXCLUSIVE [ "#MCS ON" ]
N130   #MSG SAVE EXCLUSIVE [ "G01 G90 F1000 X=%f Y=%f Z=%f A=%f B=%f C=%f", V.A.ABS.X, V.A.ABS.Y, V.A.ABS.Z, V.A.ABS.A, V.A.ABS.B, V.A.ABS.C ]
N140   #MSG SAVE EXCLUSIVE [ "#MCS OFF" ]

N200 $ELSE
       (Cartesian motion)
N110   #TRAFO ON
N210   #MSG SAVE EXCLUSIVE [ "G01 G90 F5000 X=%f Y=%f Z=%f A=%f B=%f C=%f", V.A.ABS.X, V.A.ABS.Y, V.A.ABS.Z, V.A.ABS.A, V.A.ABS.B, V.A.ABS.C ]

N300 $ENDIF

N400 M30

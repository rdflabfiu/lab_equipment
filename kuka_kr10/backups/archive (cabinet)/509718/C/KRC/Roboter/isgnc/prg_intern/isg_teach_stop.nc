(----------------------------------------------------------------------------)
( FILE NAME: isg_teach_stop.nc                            DATE:  04-Apr-2011 )
( VERSION: 2.6.3                                          Copyright ISG      )
(----------------------------------------------------------------------------)
( Internally used programm to stop teach mode                                )
(----------------------------------------------------------------------------)
( HISTORY:                                                                   )
( Apr 04, 2011 Created                                                       )
(=================== End of NC-program header ===============================)
%teach_stop

N010 #FILENAME [MSG=V.E.TEACH_FILE_NAME]
N020 #MSG SAVE EXCLUSIVE [ "M29" ]

N030 M30

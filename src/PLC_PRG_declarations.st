PROGRAM PLC_PRG
VAR_INPUT
    Prox_Start : BOOL;
    Prox_End   : BOOL;
END_VAR
VAR
    Start_PB      : BOOL;
    Stop_PB       : BOOL;
    Reset_PB      : BOOL;
    Count_Reset   : BOOL;
    E_Stop_OK     : BOOL := TRUE;
    Motor         : BOOL;
    Alarm         : BOOL;
    Emergency     : BOOL;
    Jam_Detected  : BOOL;
    Jam_Fault     : BOOL;
    JamTimer      : TON;
    Item_Counter  : CTU;
END_VAR
// The ladder logic (6 rungs) is described in README.md.

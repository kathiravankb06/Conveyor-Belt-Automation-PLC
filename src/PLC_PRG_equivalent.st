(* Structured Text equivalent of the 6-rung ladder in PLC_PRG.
   Reference only; the project itself uses Ladder Logic.
   Declarations are the same as in PLC_PRG_declarations.st *)

// Rung 1: latched emergency stop
Emergency := (NOT E_Stop_OK) OR (Emergency AND NOT Reset_PB);

// Rung 2: jam timer
JamTimer(IN := Prox_Start AND Motor, PT := T#5S);
Jam_Detected := JamTimer.Q;

// Rung 3: latched jam fault
Jam_Fault := (Jam_Detected OR Jam_Fault) AND NOT Reset_PB;

// Rung 4: motor control with seal-in
Motor := (Start_PB OR Motor)
         AND NOT Stop_PB
         AND NOT Prox_End
         AND NOT Emergency
         AND NOT Jam_Fault;

// Rung 5: item counter
Item_Counter(CU := Prox_Start, RESET := Count_Reset, PV := 100);

// Rung 6: alarm
Alarm := Emergency OR Jam_Fault;

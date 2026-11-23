(* Conveyor simulator: imitates one item moving along the belt and drives
   the two proximity sensors, so the project runs without hardware.
   Add Conveyor_Sim to MainTask after PLC_PRG.
   Remove it on real hardware and map Prox_Start / Prox_End to real inputs.
   Use Prepare value in the watch list to set Spawn_PB, Remove_PB and Stuck. *)

// ---- Declaration (top pane) ----
PROGRAM Conveyor_Sim
VAR
    Position     : REAL := 0;
    Item_On_Belt : BOOL := FALSE;
    Spawn_PB     : BOOL;
    Remove_PB    : BOOL;
    Stuck        : BOOL;
END_VAR

// ---- Code (bottom pane) ----
IF Spawn_PB AND NOT Item_On_Belt THEN
    Item_On_Belt := TRUE;
    Position := 0;
END_IF

IF Item_On_Belt AND PLC_PRG.Motor AND NOT Stuck THEN
    Position := Position + 0.5;
END_IF

IF Remove_PB THEN
    Item_On_Belt := FALSE;
    Position := 0;
END_IF

PLC_PRG.Prox_Start := Item_On_Belt AND Position < 15;
PLC_PRG.Prox_End   := Item_On_Belt AND Position >= 90;

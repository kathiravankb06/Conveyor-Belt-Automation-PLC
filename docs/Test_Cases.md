# Test Cases

Set values in the watch list: double-click the **Prepare** cell, choose TRUE or FALSE, then press **Ctrl+F7**. To pulse a button, write TRUE, then write FALSE. Fill the Result column after testing.

| # | Test | Action | Expected | Result |
|---|---|---|---|---|
| 1 | Start | `Start_PB` pulse | `Motor` = TRUE and stays on | Pending |
| 2 | Stop | `Stop_PB` pulse | `Motor` = FALSE | Pending |
| 3 | Item travels | Start, then pulse `Conveyor_Sim.Spawn_PB` | `Prox_Start` on, `Item_Counter.CV` +1, item moves | Pending |
| 4 | End stop | Item reaches the end | `Prox_End` = TRUE, `Motor` = FALSE | Pending |
| 5 | Restart | Pulse `Conveyor_Sim.Remove_PB`, then Start | `Motor` = TRUE | Pending |
| 6 | Emergency | `E_Stop_OK` = FALSE | `Motor` off, `Alarm` on, Start does nothing | Pending |
| 7 | Reset blocked | `Reset_PB` pulse while `E_Stop_OK` is FALSE | `Alarm` stays on | Pending |
| 8 | Reset | `E_Stop_OK` = TRUE, then `Reset_PB` pulse | `Alarm` off, Start works | Pending |
| 9 | Jam | Start, `Conveyor_Sim.Stuck` = TRUE, pulse `Spawn_PB` | After 5 s, `Motor` off and `Alarm` on | Pending |

Notes:
- `Conveyor_Sim` overwrites `Prox_Start` and `Prox_End` every scan, so use the simulator variables for tests 3, 4 and 9, or remove `Conveyor_Sim` from MainTask to force the sensors by hand.
- The motor needs `Prox_End` to be FALSE to start, so remove the item first.
- After a jam, set `Stuck` back to FALSE and pulse `Reset_PB` to clear it.

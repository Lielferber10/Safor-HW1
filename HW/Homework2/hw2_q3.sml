datatype cell = alive | empty
local
	fun state (cell) = if (cell = alive) then 1 else 0;
	fun rowAliveNum (a, b, c) = state (a) + state (b)+ state (c);
	fun middleCell (a,b,c) = b;
	fun neighborsAliveNum (row1, row2, row3) = rowAliveNum (row1) + rowAliveNum (row2) + rowAliveNum (row3) - state (middleCell  (row2));
	fun isAlive (n, currentSampledCellState) = case n of 
													  2 => currentSampledCellState 
													| 3 => alive 
													| _ => empty;
													
in
fun is_alive (row1) = fn row2 => (fn row3 => (isAlive (neighborsAliveNum  (row1, row2, row3), (middleCell  row2))));
end;

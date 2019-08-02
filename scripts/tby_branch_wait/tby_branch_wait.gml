/// @desc Shorthand to add a TbyType.Wait to the active TbyBranch.
/// @param seconds
var seconds = argument0;

// Wrapper for branch_add that already specifies TbyType.Wait

tby_branch_add(TbyType.Wait, [seconds])
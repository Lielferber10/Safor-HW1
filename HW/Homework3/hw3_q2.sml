use "hw3_q2_def.sml";

functor Kernel1D (Mod : KERNEL1D_SIG) =
struct
local
    fun extendL l = [Mod.default (hd l)] @ l @ [Mod.default (hd l)];
    fun run (a::b::[]) = [] | run (l : Mod.source list) : Mod.target list = ( Mod.kernel (hd l) (hd (tl l)) (hd (tl (tl l))) )::(run (tl l))
in
    fun runKernel [] = [] | runKernel l = run (extendL l)
end
end;

exception SizeNotEqual ;
fun zip [] [] [] = [] | zip a b c = if (length a) = (length b) andalso (length b) = (length c) then ( (hd a), (hd b), (hd c) ) :: (zip (tl a) (tl b) (tl c)) else raise SizeNotEqual;

exception NegativeLength ;
fun fill value 0 = [] | fill value num = if num < 0 then raise NegativeLength else value :: (fill value (num - 1));

functor Kernel2D (Mod : KERNEL2D_SIG) =
struct
local
    fun extendL def l = [def] @ l @ [def]
    fun run f (a::b::[]) = [] | run f (l) = ( f (hd l) (hd (tl l)) (hd (tl (tl l))) )::(run f (tl l))
    fun runKernel1 f  def [] = [] | runKernel1 f def l = run f (extendL def l)
    fun firstStep l = runKernel1 zip [Mod.default (hd (hd l)),Mod.default (hd (hd l)),Mod.default (hd (hd l))] l
in
    fun runKernel [] = [] | runKernel l= runKernel1 Mod.kernel (Mod.default (hd (hd l)),Mod.default (hd (hd l)),Mod.default (hd (hd l))) (hd (firstStep l)) :: (runKernel (tl (l)))
end
end;

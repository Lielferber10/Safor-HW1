fun sig1 a b c =c(a, c (a, b));

fun sig2 (a, b) c = c(b/2.0) ^ "hello" = c(real(a div 2));

fun sig3 l m n r = l m n;

fun sig4 a b c d = c div d;

fun sig5 x y z = z(x(y), x(y));

fun sig6 a b = if (a = ()) then 1 else if (b = ()) then 2 else 3;

fun sig7 a = fn (b, c) => if true then b else if false then c else a; 

fun sig8 (a, b, c) = (a div a, b^"hello", c^"safot");

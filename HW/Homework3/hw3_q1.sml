use "hw3_q1_def.sml";

fun mapState f st = map (fn lst => map f lst) st;

fun toString lst = foldr (fn (chr, strg) => (str(chr) ^ strg)) "" lst;

fun frameToState strList = 
map
(
    fn strg =>
    (
        map 
        (
            fn chr =>
            (
                (chr = #"*")
            )
        )
        (explode strg)
    )
)
strList;


fun stateToFrame boolListList =
map
(
    fn boolList =>
    (
        toString
        (
            map
            (
                toChar
            )
            boolList
        )
    )
)
boolListList;


fun printFrame strList =
foldl (fn (strg, ()) => print(strg)) ()
(
    map
    (
        fn strg =>
        (
            strg ^ "\n"
        )
    )
    strList
);

fun printFrame strList =
    foldl (fn (strg, ()) => print(strg)) ()
    (
        map
        (
            fn strg =>
            (
                strg ^ "\n"
            )
        )
        strList
    );

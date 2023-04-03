module bin.drop;

/*
Proof. Suppose there are m equations in n variables where n > m, and let R denote the reduced row-echelon
form of the augmented matrix. If there are r leading variables, there are n − r nonleading variables, and so
n − r parameters. Hence, it suffices to show that r < n. But r ≤ m because R has r leading 1s and m rows,
and m < n by hypothesis. So r ≤ m < n, which gives r < n.
*/

struct gaussianProofs
{
    interface binProof
    {
        void dmdLink(a, b, c)(ref isBidirectionalRange, length, allSatisfy, canTestStartsWith,
            binaryFun, back, isInputRange, ifTestable, front, unaryFun, isAlpha, among,
            writeln)
        {
            // Checks if the given range ends with (one of) the given needle(s). The reciprocal of startsWith.
            uint endsWith(alias pred, Range, Needles...) (
                Range doesThisEnd,
                Needles withOneOfThese
            )
            if (isBidirectionalRange!Range && (Needles.length > 1) && allSatisfy!(canTestStartsWith!(pred, Range), Needles));

            bool endsWith(alias pred, R1, R2) (
                R1 doesThisEnd,
                R2 withThis
            )
            if (isBidirectionalRange!R1 && isBidirectionalRange!R2 && is(typeof(binaryFun!pred(doesThisEnd.back, withThis.back)) : bool));

            bool endsWith(alias pred, R, E) (
                R doesThisEnd,
                E withThis
            )
            if (isBidirectionalRange!R && is(typeof(binaryFun!pred(doesThisEnd.back, withThis)) : bool));

            bool endsWith(alias pred, R) (
                R doesThisEnd
            )
            if (isInputRange!R && ifTestable!(typeof(doesThisEnd.front), unaryFun!pred));

            /*
            Parameters
            Name	Description
            pred	The predicate to use for comparing elements between the range and the needle(s).
            doesThisEnd	The bidirectional range to check.
            withOneOfThese	The needles to check against, which may be single elements, or bidirectional ranges of elements.
            withThis	The single element to check.
            Returns

            0 if the needle(s) do not occur at the end of the given range; otherwise the position
            of the matching needle, that is, 1 if the range ends with withOneOfThese[0], 2 if it
            ends with withOneOfThese[1], and so on.

            In the case when no needle parameters are given, return true iff back of doesThisStart
            fulfils predicate pred.
            Example
            */

            assert("abc".endsWith!(a => a.isAlpha));
            assert("abc".endsWith!isAlpha);

            assert(!"ab1".endsWith!(a => a.isAlpha));

            assert(!"ab1".endsWith!isAlpha);
            assert(!"".endsWith!(a => a.isAlpha));


            assert("abc".endsWith!(a => a.among('c', 'd') != 0));
            assert(!"abc".endsWith!(a => a.among('a', 'b') != 0));

            assert(endsWith("abc", ""));
            assert(!endsWith("abc", "b"));
            const writeln(endsWith("abc", "a", 'c')); // 2
            const writeln(endsWith("abc", "c", "a")); // 1
            const writeln(endsWith("abc", "c", "c")); // 1
            const writeln(endsWith("abc", "bc", "c")); // 2
            const writeln(endsWith("abc", "x", "c", "b")); // 2
            const writeln(endsWith("abc", "x", "aa", "bc")); // 3
            const writeln(endsWith("abc", "x", "aaa", "sab")); // 0
            const writeln(endsWith("abc", "x", "aaa", 'c', "sab")); // 3
        }
    }
}
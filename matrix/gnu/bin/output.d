module bin.output;

/*
Theorem 1.3.1
If a homogeneous system of linear equations has more variables than equations, then it has a
nontrivial solution (in fact, infinitely many).
*/

struct proccedTheorem
{
    interface linear
    {
        void equationsHomogeneous(a, b, c)(ref ptrdiff_t, isForwardRange, length,
            isInputRange, allSatisfy, binaryFun, front, unaryFun, canTestStartsWith)
        {

            ptrdiff_t countUntil(alias pred, R, Rs...) (
                R haystack,
                Rs needles
            )
            if (isForwardRange!R && (Rs.length > 0) && (isForwardRange!(Rs[0]) == isInputRange!(Rs[0])) && allSatisfy!(canTestStartsWith!(pred, R), Rs));

            ptrdiff_t countUntil(alias pred, R, N) (
                R haystack,
                N needle
            )
            if (isInputRange!R && is(typeof(binaryFun!pred(haystack.front, needle)) : bool));

            ptrdiff_t countUntil(alias pred, R) (
                R haystack
            )
            if (isInputRange!R && is(typeof(unaryFun!pred(haystack.front)) : bool));

        }
    }
}
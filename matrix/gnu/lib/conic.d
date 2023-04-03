module bin.conic;

/*
Example 1.3.2
We call the graph of an equation ax2 + bxy + cy2 + dx + ey + f = 0 a conic if the numbers a, b, and
c are not all zero. Show that there is at least one conic through any five points in the plane that are
not all on a line.
Solution. Let the coordinates of the five points be (p1 , q1 ), (p2 , q2 ), (p3 , q3 ), (p4 , q4 ), and
(p5 , q5 ). The graph of ax2 + bxy + cy2 + dx + ey + f = 0 passes through (pi , qi ) if
ap2i + bpi qi + cq2i + d pi + eqi + f = 0
This gives five equations, one for each i, linear in the six variables a, b, c, d, e, and f . Hence, there
is a nontrivial solution by Theorem 1.3.1. If a = b = c = 0, the five points all lie on the line with
equation dx + ey + f = 0, contrary to assumption. Hence, one of a, b, c is nonzero.
*/
struct equationsArgs
{
    interface equationsHomo
    {
        void vibeCoreArgs(a, b, c)(ref isInputRange, binaryFun, front,
            isForwardRange)
        {
            // Finds an individual element in an input range. Elements of haystack are compared
            // with needle by using predicate pred with pred(haystack.front, needle). find performs
            // Ο(walkLength(haystack)) evaluations of pred.
            InputRange find(alias pred, InputRange, Element, nuts) (
                InputRange haystack,
                scope Element needle, nuts
            )
            if (isInputRange!InputRange && is(typeof(binaryFun!pred(haystack.front, needle)) : bool) && !is(typeof(binaryFun!pred(haystack.front, needle.front)) : bool));

            InputRange find(alias pred, InputRange) (
                InputRange haystack
            )
            if (isInputRange!InputRange);

            R1 find(alias pred, R1, R2) (
                R1 haystack,
                scope R2 needle
            )
            if (isForwardRange!R1 && isForwardRange!R2 && is(typeof(binaryFun!pred(haystack.front, needle.front)) : bool));

        }
    }
}
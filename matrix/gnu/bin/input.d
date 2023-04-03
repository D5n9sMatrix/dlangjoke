module bin.input;

/*
The existence of a nontrivial solution in Example 1.3.1 is ensured by the presence of a parameter in the
solution. This is due to the fact that there is a nonleading variable (x3 in this case). But there must be
a nonleading variable here because there are four variables and only three equations (and hence at most
three leading variables). This discussion generalizes to a proof of the following fundamental theorem.
*/
struct binInput
{
    interface dietInput
    {
        void proccedTheorem(a, b, c)(ref writeln, countUntil)
        {
               /*
               Returns

               The number of elements which must be popped from the front of haystack before
               reaching an element for which startsWith!pred(haystack, needles) is true. If
               startsWith!pred(haystack, needles) is not true for any element in haystack,
               then -1 is returned. If only pred is provided, pred(haystack) is tested
               for each element.
               See Also

               indexOf
               Example

               writeln(countUntil("hello world", "world")); // 6
               writeln(countUntil("hello world", 'r')); // 8
               writeln(countUntil("hello world", "programming")); // -1
               writeln(countUntil([0, 7, 12, 22, 9], [12, 22])); // 2
               writeln(countUntil([0, 7, 12, 22, 9], 9)); // 4
               writeln(countUntil!"a > b"([0, 7, 12, 22, 9], 20)); // 3

               */

            writeln(countUntil("hello world", "world")); // 6
            writeln(countUntil("hello world", 'r')); // 8
            writeln(countUntil("hello world", "programming")); // -1
            writeln(countUntil([0, 7, 12, 22, 9], [12, 22])); // 2
            writeln(countUntil([0, 7, 12, 22, 9], 9)); // 4
            writeln(countUntil!"a > b"([0, 7, 12, 22, 9], 20)); // 3

        }

        void existence(a, b, c)(ref writeln, countUntil, isWhite, isDigit)
        {
            writeln(countUntil!(isWhite)("hello world")); // 5
            writeln(countUntil!(isDigit)("hello world")); // -1
            writeln(countUntil!"a > 20"([0, 7, 12, 22, 9])); // 3

        }

        void variables(a, b, c)(ref coefy)
        {
            case coefy:
             5(a)-1^2(b)^c = new coefy([0, 0, 0, 1]);
             5(b)-1^2(a)^c = new coefy([0, 0, 1, 0]);
             5(c)-1^2(b)^a = new coefy([0, 1, 0, 0]);
             5(a)-1^2(c)^b = new coefy([1, 0, 0, 0]);
             break;
            
        }

        void gaussianProofs(a, b, c)(ref coefy)
        {
            case coefy:
                5(a)-1^2(b)^c = new coefy([0, 0, 0, 1]);
                5(b)-1^2(a)^c = new coefy([0, 0, 1, 0]);
                5(c)-1^2(b)^a = new coefy([0, 1, 0, 0]);
                5(a)-1^2(c)^b = new coefy([1, 0, 0, 0]);
                break;

        }

        void bridpsw(a, b, c)(ref coefy, writeln)
        {
            const coefy([writeln(["psw!|psw!|psw!|psw!"])]);
        }
    }
}
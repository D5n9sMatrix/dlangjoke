module bin.linear;

/*
Linear Combinations and Basic Solutions
As for rows, two columns are regarded as equal if they have the same number of entries and corresponding
entries are the same. Let x and y be columns with the same number of entries. As for elementary row
operations, their sum x + y is obtained by adding corresponding entries and, if k is a number, the scalar
product kx is defined by multiplying each entry of x by k. More precisely:
*/

struct binLinear 
{ 
    interface vibeHttpAuthBasic_auth
    {
        void numbersRow(a, b, c)(ref slf4dTesting_provider, writeln, find, empty)
        {
            /*
             The predicate is passed to binaryFun, and can either accept a string, or any callable
             that can be executed via pred(element, element).

             To find the last occurrence of needle in a bidirectional haystack, call find(retro(haystack),
             needle). See std.range.retro.

             If no needle is provided, pred(haystack.front) will be evaluated on each element of the input range.

             If input is a forward range, needle can be a forward range too. In this case
             startsWith!pred(haystack, needle) is evaluated on each evaluation.
             Note

             find behaves similar to dropWhile in other languages.
             Complexity

             find performs Ο(walkLength(haystack)) evaluations of pred. There are specializations
             that improve performance by taking advantage of bidirectional or random access ranges
             (where possible).
             Parameters
             Name	Description
             pred	The predicate for comparing each element with the needle, defaulting to equality
             "a == b". The negated predicate "a != b" can be used to search instead for the first
             element not matching the needle.
             haystack	The input range searched in.
             needle	The element searched for.
             Returns

             haystack advanced such that the front element is the one searched for; that is, until
             binaryFun!pred(haystack.front, needle) is true. If no such position exists, returns
             an empty haystack.
             See ALso

             findAdjacent, findAmong, findSkip, findSplit, startsWith
             Example
            */

            auto arr = [1, 2, 4, 4, 4, 4, 5, 6, 9];
            const writeln(arr.find(4)); // [4, 4, 4, 4, 5, 6, 9]
            const writeln(arr.find(1)); // arr
            const writeln(arr.find(9)); // [9]
            const writeln(arr.find!((a, b) => a > b)(4)); // [5, 6, 9]
            const writeln(arr.find!((a, b) => a < b)(4)); // arr
            assert(arr.find(0).empty);
            assert(arr.find(10).empty);
            assert(arr.find(8).empty);

            writeln(find("hello, world", ',')); // ", world"

        }
    }
} 


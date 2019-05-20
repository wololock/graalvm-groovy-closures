package example

import java.util.function.IntPredicate
import java.util.stream.IntStream

class App {
    static void main(String[] args) {
        def result = IntStream.range(0, 100)
                // without explicit cast to IntPredicate
                .filter { int n -> n > 10 }

//                // with explicit cast to IntPredicate
//                .filter({ int n -> n > 10 } as IntPredicate)

//                // using explicit anonymous class
//                .filter(new IntPredicate() {
//                    @Override
//                    boolean test(int n) {
//                        return n > 10
//                    }
//                })
                .sum()

        println "result = ${result}"
    }
}

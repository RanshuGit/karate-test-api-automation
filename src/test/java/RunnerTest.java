import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Test;

import static org.junit.Assert.*;

public class RunnerTest {

    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:feature")
                .tags("@Regression")   // ~@Regression it will ignore all @regression tags and run remaining
                .parallel(2);
        assertTrue("There are test failures: " + results.getErrorMessages(), results.getFailCount() == 0);
    }
}

package Authentication;

import com.intuit.karate.junit5.Karate;

class AuthenticationRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("Authenticacion").relativeTo(getClass());
    }    

}

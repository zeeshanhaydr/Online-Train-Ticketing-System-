package onlineTrainTicketingSystem;
/**
 *
 * @author zeeshanhaider
 */

import org.glassfish.jersey.server.ResourceConfig;
import jakarta.ws.rs.ApplicationPath;

@ApplicationPath("/api")
public class JerseyConfig extends ResourceConfig {
    public JerseyConfig() {
        packages("onlineTrainTicketingSystem");
    }
}

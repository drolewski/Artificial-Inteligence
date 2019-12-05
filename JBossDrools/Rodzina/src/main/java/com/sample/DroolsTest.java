package com.sample;

import org.kie.api.KieServices;
import org.kie.api.runtime.rule.QueryResults;
import org.kie.api.runtime.rule.QueryResultsRow;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;

/**
 * This is a sample class to launch a rule.
 */
public class DroolsTest {

    public static final void main(String[] args) {
        try {
            // load up the knowledge base
	        KieServices ks = KieServices.Factory.get();
    	    KieContainer kContainer = ks.getKieClasspathContainer();
        	KieSession kSession = kContainer.newKieSession("ksession-rules");

            // go !
            Message message = new Message();
            message.setMessage("Hello World");
            message.setStatus(Message.HELLO);
            kSession.insert(message);
            kSession.fireAllRules();
            
            QueryResults results = kSession.getQueryResults( "q_stryj" );
            System.out.println( "Mamy " + results.size() + " stryjów w naszej bazie" );

            for ( QueryResultsRow row : results ) {
                Relacja rel = ( Relacja ) row.get( "qs");
                System.out.println( rel.osoby[0].imie + " jest stryjem " + rel.osoby[1].imie) ;
            }
            
        	System.out.println();
            
            QueryResults results2 = kSession.getQueryResults( "q_wuj" );
            System.out.println( "Mamy " + results2.size() + " wujów w naszej bazie" );

            for ( QueryResultsRow row : results2 ) {
                Relacja rel = ( Relacja ) row.get( "qw");
                System.out.println( rel.osoby[0].imie + " jest wujem " + rel.osoby[1].imie) ;
            }
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

    public static class Message {

        public static final int HELLO = 0;
        public static final int GOODBYE = 1;

        private String message;

        private int status;

        public String getMessage() {
            return this.message;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        public int getStatus() {
            return this.status;
        }

        public void setStatus(int status) {
            this.status = status;
        }

    }

}

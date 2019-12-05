package com.sample;
 
import java.util.ArrayList;
import java.util.List;
 
import javax.swing.JOptionPane;
 
import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.kie.api.runtime.rule.FactHandle;
import org.kie.api.runtime.rule.QueryResults;
import org.kie.api.runtime.rule.QueryResultsRow;
 
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
 
            Pytanie pytanie = new Pytanie ();
            Komputer komputer = new Komputer();
            FactHandle fact = kSession.insert(komputer);
         
            
 
            kSession.insert(message);
           FactHandle fact2 = kSession.insert(pytanie);
 
           int end = 1;
           
         while (true) {
        	 System.out.println(pytanie.tresc);
 
            end = kSession.fireAllRules();
            
            if(end == 0) {
            	System.out.println(komputer);
            	break;
            }
            if(pytanie.tresc == "X")
            	continue;
            
            System.out.println(pytanie.tresc);
            int opt;
            opt = JOptionPane.showOptionDialog(null,   
                    pytanie.tresc,  "ShowInputDialog",   
                    JOptionPane.PLAIN_MESSAGE, 1,  null, (pytanie.odpowiedzi).toArray(), 0);
            System.out.println (pytanie.odpowiedzi.get(opt));
            
            System.out.println(pytanie.odpowiedzi.get(opt).getClass());
            
           
            if (pytanie.odpowiedzi.get(opt).getClass() == Procesor.class) {
            	
            	komputer.procesor = (Procesor) pytanie.odpowiedzi.get(opt);
            	System.out.println("K: " + komputer.procesor.typ + " " + komputer.procesor.gniazdo);
        		kSession.update(fact,komputer);
            } else if(pytanie.odpowiedzi.get(opt).getClass() == PlytaGlowna.class) {
            	komputer.plytaGlowna = (PlytaGlowna) pytanie.odpowiedzi.get(opt);
            	System.out.println("K: " + komputer.plytaGlowna.typ);
            	kSession.update(fact,komputer);
            } else if(pytanie.odpowiedzi.get(opt).getClass() == KartaGraficzna.class) {
            	komputer.kartaGraficzna = (KartaGraficzna) pytanie.odpowiedzi.get(opt);
            	System.out.println("K: " + komputer.kartaGraficzna.typ);
            	kSession.update(fact,komputer);
            } else if(pytanie.odpowiedzi.get(opt).getClass() == KartaDzwiekowa.class) {
            	komputer.kartaDzwiekowa = (KartaDzwiekowa) pytanie.odpowiedzi.get(opt);
            	System.out.println("K: " + komputer.kartaDzwiekowa.typ);
            	kSession.update(fact,komputer);
            } else if(pytanie.odpowiedzi.get(opt).getClass() == DyskTwardy.class) {
            	komputer.dysk = (DyskTwardy) pytanie.odpowiedzi.get(opt);
            	System.out.println("K: " + komputer.dysk.typ);
            	kSession.update(fact,komputer);
            }
            
          	pytanie.odpowiedzi.clear();
          	//kSession.update(komputer);
          	System.out.println(pytanie.odpowiedzi.size());
          	pytanie.tresc = "X";
          	kSession.update(fact2,pytanie);
            
            
            
        }//while
 
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
    public static class Gniazdo {
 
        public String typ;
 
        public Gniazdo(String typ) {
            this.typ=typ;
        }   
    }
    public static class KartaGraficzna {
 
        public String typ;
 
        public KartaGraficzna(String typ) {
            this.typ=typ;
        }
        public String toString() {
        	return typ;
        }
        
    }
    public static class KartaDzwiekowa {
 
        public String typ;
 
        public KartaDzwiekowa(String typ) {
            this.typ=typ;
        }   
        public String toString() {
        	return typ;
        }
    }
    public static class DyskTwardy {
 
        public String typ;
 
        public DyskTwardy(String typ) {
            this.typ=typ;
        }   
        
        public String toString() {
        	return typ;
        }
    }
 
    public static class Procesor {
 
        public String typ;
        public String gniazdo;
 
        public Procesor(String typ, String gniazdo) {
            this.typ=typ;
            this.gniazdo = gniazdo;
        }
        public String toString() {
        	return typ;
        }
    }
    public static class PlytaGlowna {
 
        public String typ;
        public String gniazdo;
        public Boolean zintegrowanaGrafika;
        public Boolean zintegrowanyDzwiek;
 
 
        public PlytaGlowna(String typ, String gniazdo, Boolean graf, Boolean dzwie) {
            this.typ=typ;
            this.gniazdo = gniazdo;
            this.zintegrowanaGrafika = graf;
            this.zintegrowanyDzwiek = dzwie;
        }   
        
        public String toString() {
        	return typ;
        }
    }
    public static class Komputer {
 
        public Procesor procesor;
        public PlytaGlowna plytaGlowna;
        public DyskTwardy dysk;
        public KartaGraficzna kartaGraficzna;
        public KartaDzwiekowa kartaDzwiekowa;
 
        public Komputer() {
            this.procesor = null;
            this.plytaGlowna = null;
            this.dysk = null;
            this.kartaGraficzna = null;
            this.kartaDzwiekowa = null;
        }
        public String toString() {
        	return "Procesor: " + procesor + "\nP³yta g³ówna: " + plytaGlowna + "\nKarta graficzna: "+ kartaGraficzna + "\nKarta dzwiêkowa: " + kartaDzwiekowa + "\nDysk: "+ dysk;
        	 
        }
    }
    public static class Pytanie {
 
        public String tresc;
       
        public List odpowiedzi;
 
        public Pytanie () {
            this.tresc = null;
            this.odpowiedzi = new ArrayList<>();
        }
        public Pytanie(String tresc, List odpowiedzi) {
            this.tresc = tresc;
            this.odpowiedzi = odpowiedzi;
        }   
    }
 
}
package com.sample;

import org.kie.api.KieServices;
import org.kie.api.logger.*;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;

/**
 * This is a sample file to launch a process.
 */
public class ProcessTest {

    public static final void main(String[] args) {
        try {
            // load up the knowledge base
	        KieServices ks = KieServices.Factory.get();
    	    KieContainer kContainer = ks.getKieClasspathContainer();
        	KieSession kSession = kContainer.newKieSession("ksession-process");
        	KieRuntimeLogger kLogger = ks.getLoggers().newFileLogger(kSession, "s");
            // start a new process instance
        	Pomiar pomiar = new Pomiar();
        	pomiar.dym = true;
        	pomiar.temperatura = 153.0f;
        	
        	kSession.insert(new Pomiar(10,true));
        	kSession.fireAllRules();
        	kSession.insert(new Straz());
        	kSession.fireAllRules();   
        	
        	kLogger.close();
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }
}

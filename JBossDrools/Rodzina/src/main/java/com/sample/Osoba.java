package com.sample;

import java.util.ArrayList;

public class Osoba {
    public String imie;
    public Plec plec;
    public ArrayList<Relacja> relacje = new ArrayList<>();

    public Osoba(String imie) {
            this.imie=imie;
            this.plec=Plec.NIEZNANA;
    }       

    public String toString() {
            return imie;
    }
}

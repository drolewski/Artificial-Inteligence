package com.sample;

public class Relacja {

    public Osoba[] osoby=new Osoba[2];
    public String relacja;

    public Relacja(Osoba o1, Osoba o2, String relacja) {
        this.osoby[0]=o1;
        this.osoby[1]=o2;
        this.relacja=relacja;
        this.osoby[0].relacje.add(this);
        this.osoby[1].relacje.add(this);
    }   

}
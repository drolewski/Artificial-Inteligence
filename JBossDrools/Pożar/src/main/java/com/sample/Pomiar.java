package com.sample;

public class Pomiar {
	public boolean dym = false;
	public float temperatura = 24.0f;
	
	public Pomiar() {
	}
	
	public Pomiar(float temperatura, boolean dym) {
		this.dym =dym;
		this.temperatura = temperatura;
	}
}

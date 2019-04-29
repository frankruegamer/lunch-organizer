package de.frankruegamer.lunchorganizer.business;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Person {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long Id;

	private String name;

	public Person(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

}

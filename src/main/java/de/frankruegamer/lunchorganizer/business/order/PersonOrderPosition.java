package de.frankruegamer.lunchorganizer.business.order;

import de.frankruegamer.lunchorganizer.business.food.Food;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
public class PersonOrderPosition {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	@JoinColumn(nullable = false)
	private Food food;

	@Column(nullable = true)
	private String custom;

	@ManyToOne
	@JoinColumn(nullable = false)
	private PersonOrder personOrder;

	protected PersonOrderPosition() {
	}

	public Long getId() {
		return id;
	}

	public BigDecimal getPrice() {
		return food.getPrice();
	}

	public Food getFood() {
		return food;
	}

	public String getCustom() {
		return custom;
	}

	public PersonOrder getPersonOrder() {
		return personOrder;
	}

}

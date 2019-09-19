package de.frankruegamer.lunchorganizer.business.food;

import de.frankruegamer.lunchorganizer.business.restaurant.Restaurant;

import java.math.BigDecimal;
import javax.persistence.*;

@Entity
public class Food {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String number;

	@Column(nullable = false)
	private String name;

	private String description;

	@Column(nullable = false)
	private BigDecimal price;

	@ManyToOne
	private Restaurant restaurant;

	protected Food() {
	}

	public Food(String number, String name, String description, BigDecimal price, Restaurant restaurant) {
		this.number = number;
		this.name = name;
		this.description = description;
		this.price = price;
		this.restaurant = restaurant;
	}

	public Long getId() {
		return id;
	}

	public String getNumber() {
		return number;
	}

	public String getName() {
		return name;
	}

	public String getDescription() {
		return description;
	}

	public BigDecimal getPrice() {
		return price;
	}

}

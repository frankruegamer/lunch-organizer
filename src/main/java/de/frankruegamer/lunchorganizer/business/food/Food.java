package de.frankruegamer.lunchorganizer.business.food;

import de.frankruegamer.lunchorganizer.business.restaurant.Restaurant;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
public class Food {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String number;

	@Column(nullable = false)
	private String name;

	private String description;

	private BigDecimal price;

	@ManyToOne
	private Restaurant restaurant;

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

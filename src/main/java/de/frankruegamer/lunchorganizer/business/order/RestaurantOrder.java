package de.frankruegamer.lunchorganizer.business.order;

import de.frankruegamer.lunchorganizer.business.restaurant.Restaurant;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
public class RestaurantOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false)
	private LocalDateTime timestamp = LocalDateTime.now();

	@ManyToOne
	@JoinColumn(nullable = false)
	private Restaurant restaurant;

	@OneToMany(mappedBy = "restaurantOrder")
	private List<PersonOrder> personOrders = new ArrayList<>();

	protected RestaurantOrder() {
	}

	public LocalDateTime getTimestamp() {
		return timestamp;
	}

	public BigDecimal getPrice() {
		return personOrders.stream().map(PersonOrder::getPrice).reduce(BigDecimal.ZERO, BigDecimal::add);
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

}

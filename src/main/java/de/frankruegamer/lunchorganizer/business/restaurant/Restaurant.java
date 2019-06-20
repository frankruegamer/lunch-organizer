package de.frankruegamer.lunchorganizer.business.restaurant;

import de.frankruegamer.lunchorganizer.business.address.Address;
import de.frankruegamer.lunchorganizer.business.food.Food;
import de.frankruegamer.lunchorganizer.business.order.RestaurantOrder;

import javax.persistence.*;
import java.util.List;

@Entity
public class Restaurant {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false)
	private String name;

	@OneToOne
	@JoinColumn
	private Address address;

	@OneToMany(mappedBy = "restaurant")
	private List<Food> foods;

	@OneToMany(mappedBy = "restaurant")
	private List<RestaurantOrder> orders;

	protected Restaurant() {
	}

	public String getName() {
		return name;
	}

	public Address getAddress() {
		return address;
	}

	public List<RestaurantOrder> getOrders() {
		return orders;
	}

}

package de.frankruegamer.lunchorganizer.business.order;

import de.frankruegamer.lunchorganizer.business.person.Person;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"person_id", "restaurant_order_id"}))
public class PersonOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	@JoinColumn(nullable = false)
	private Person person;

	@Column(nullable = false)
	private boolean paid = false;

	@OneToMany(mappedBy = "personOrder")
	private List<PersonOrderPosition> personOrderPositions = new ArrayList<>();

	@ManyToOne
	@JoinColumn(nullable = false)
	private RestaurantOrder restaurantOrder;

	protected PersonOrder() {
	}

	public Long getId() {
		return id;
	}

	public Person getPerson() {
		return person;
	}

	public BigDecimal getPrice() {
		return personOrderPositions.stream().map(PersonOrderPosition::getPrice).reduce(BigDecimal.ZERO, BigDecimal::add);
	}

	public List<PersonOrderPosition> getPersonOrderPositions() {
		return personOrderPositions;
	}

	public RestaurantOrder getRestaurantOrder() {
		return restaurantOrder;
	}

	public boolean isPaid() {
		return paid;
	}

}

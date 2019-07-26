package de.frankruegamer.lunchorganizer.business.order;

import de.frankruegamer.lunchorganizer.business.person.Person;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
public class PersonOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	@JoinColumn(nullable = false)
	private Person person;

	@OneToMany(mappedBy = "personOrder")
	private List<PersonOrderPosition> personOrderPositions;

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

}

package de.frankruegamer.lunchorganizer.business.order;

import de.frankruegamer.lunchorganizer.business.food.Food;
import org.hibernate.annotations.Check;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Check(constraints = "(food_id IS NULL) != (custom IS NULL)")
public class PersonOrderPosition {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	@JoinColumn(nullable = true)
	private Food food;

	@Column(nullable = true)
	private String custom;

	@ManyToOne
	@JoinColumn(nullable = false)
	private PersonOrder personOrder;

	protected PersonOrderPosition() {
	}

	public BigDecimal getPrice() {
		return food.getPrice();
	}

}

package de.frankruegamer.lunchorganizer.business.restaurant;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RestResource;

public interface RestaurantRepository extends JpaRepository<Restaurant, Long> {

	@RestResource(exported = false)
	Restaurant findByName(String name);

}

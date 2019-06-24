package de.frankruegamer.lunchorganizer.business.order;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;

import java.util.List;

@RepositoryRestResource(collectionResourceRel = "orders", path = "orders")
public interface RestaurantOrderRepository extends JpaRepository<RestaurantOrder, Long> {

	@RestResource(rel = "latest", path = "latest")
	RestaurantOrder findFirstByOrderByTimestampDesc();

	@RestResource(rel = "last10", path = "last10")
	List<RestaurantOrder> findTop10ByOrderByTimestampDesc();

}

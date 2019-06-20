package de.frankruegamer.lunchorganizer.business.order;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "orders", path = "orders")
public interface RestaurantOrderRepository extends JpaRepository<RestaurantOrder, Long> {

}

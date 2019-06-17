package de.frankruegamer.lunchorganizer.business.order;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<RestaurantOrder, Long> {

}

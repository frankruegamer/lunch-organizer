package de.frankruegamer.lunchorganizer.business.food;

import de.frankruegamer.lunchorganizer.business.restaurant.Restaurant;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface FoodRepository extends JpaRepository<Food, Long> {

	@Query(value = "SELECT * " +
	               "FROM food " +
	               "WHERE (food.name ~* :regex OR description ~* :regex)" +
	               "  AND restaurant_id = :restaurant", nativeQuery = true)
	Page<Food> findByNameRegex(@Param("regex") String regex, @Param("restaurant") Restaurant restaurant, Pageable page);

}

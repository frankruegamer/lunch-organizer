package de.frankruegamer.lunchorganizer.business.order;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PersonOrderRepository extends JpaRepository<PersonOrder, Long> {

}

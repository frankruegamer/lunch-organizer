package de.frankruegamer.lunchorganizer.business.order;

import de.frankruegamer.lunchorganizer.business.food.Food;
import org.springframework.data.rest.webmvc.RepositoryRestController;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.hateoas.EntityLinks;
import org.springframework.hateoas.Link;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.stream.Collectors;

@RepositoryRestController
public class PersonOrderController {

	private final RestaurantOrderRepository orderRepository;
	private final EntityLinks entityLinks;

	public PersonOrderController(RestaurantOrderRepository orderRepository, EntityLinks entityLinks) {
		this.orderRepository = orderRepository;
		this.entityLinks = entityLinks;
	}

	@GetMapping(value = "/orders/{id}/personOrders")
	public ResponseEntity<?> getPersonOrder(@PathVariable("id") long id, @RequestParam(required = false) String name) {
		System.out.println("name = " + name);
		RestaurantOrder restaurantOrder = orderRepository.findById(id).orElseThrow(ResourceNotFoundException::new);
		if (name == null) {
			return ResponseEntity.ok(new Resources<>(restaurantOrder.getPersonOrders()));
		} else {
			PersonOrder personOrder = restaurantOrder.getPersonOrders()
			                                         .stream()
			                                         .filter(o -> o.getPerson().getName().equals(name))
			                                         .findFirst()
			                                         .orElseThrow(() -> new ResourceNotFoundException("Resource for '" + name + "' not found."));
			List<Resource<PersonOrderPosition>> resources = personOrder.getPersonOrderPositions()
			                                                           .stream()
			                                                           .map(this::toResource)
			                                                           .collect(Collectors.toList());
			return ResponseEntity.ok(new Resources<>(resources));
		}
	}

	private Resource<PersonOrderPosition> toResource(PersonOrderPosition s) {
		Link foodLink = entityLinks.linkToSingleResource(Food.class, s.getFood().getId());
		Link personOrderLink = entityLinks.linkToSingleResource(PersonOrder.class, s.getPersonOrder().getId());
		return new Resource<>(s, List.of(foodLink, personOrderLink));
	}

}

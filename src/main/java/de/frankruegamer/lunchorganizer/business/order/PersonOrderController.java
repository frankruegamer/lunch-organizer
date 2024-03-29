package de.frankruegamer.lunchorganizer.business.order;

import org.springframework.data.rest.webmvc.RepositoryRestController;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.hateoas.*;
import org.springframework.hateoas.core.EmbeddedWrapper;
import org.springframework.hateoas.core.EmbeddedWrappers;
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
		RestaurantOrder restaurantOrder = orderRepository.findById(id).orElseThrow(ResourceNotFoundException::new);
		List<PersonOrder> personOrders = restaurantOrder.getPersonOrders();
		if (name == null) {
			List<Resource<PersonOrder>> resources = personOrders.stream()
			                                                  .map(this::toResource)
			                                                  .collect(Collectors.toList());
			EmbeddedWrappers wrappers = new EmbeddedWrappers(false);
			EmbeddedWrapper wrapper = wrappers.wrap(resources, "personOrders");
			return ResponseEntity.ok(new Resources<>(List.of(wrapper)));
		} else {
			PersonOrder personOrder = personOrders.stream()
			                                      .filter(o -> o.getPerson().getName().equals(name))
			                                      .findFirst()
			                                      .orElseThrow(() -> new ResourceNotFoundException("Resource for '" + name + "' not found."));
			return ResponseEntity.ok(toResource(personOrder));
		}
	}

	private Resource<PersonOrder> toResource(PersonOrder personOrder) {
		LinkBuilder rootLink = entityLinks.linkForSingleResource(PersonOrder.class, personOrder.getId());
		Link selfLink = rootLink.withSelfRel();
		Link personOrderLink = rootLink.withRel("personOrder");
		Link personLink = rootLink.slash("person").withRel("person");
		Link positionsLink = rootLink.slash("personOrderPositions").withRel("personOrderPositions");
		Link restaurantOrderLink = rootLink.slash("restaurantOrder").withRel("restaurantOrder");
		return new Resource<>(personOrder, List.of(selfLink, personOrderLink, personLink, positionsLink, restaurantOrderLink));
	}

}

package de.frankruegamer.lunchorganizer.business.restaurant;

import de.frankruegamer.lunchorganizer.business.address.Address;

import javax.persistence.*;

@Entity
public class Restaurant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @OneToOne
    @JoinColumn
    private Address address;

    protected Restaurant() {
    }

    public String getName() {
        return name;
    }

    public Address getAddress() {
        return address;
    }

}

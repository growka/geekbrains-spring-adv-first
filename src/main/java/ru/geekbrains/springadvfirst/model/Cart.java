package ru.geekbrains.springadvfirst.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@NoArgsConstructor
@Data
@Entity
@Table(name = "carts")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @OneToOne
    @JoinColumn(name = "owner_id")
    private User ownerId;

    @Column(name = "price")
    private int price;

    @OneToMany(mappedBy = "cart")
    List<CartItem> cartItems;
}

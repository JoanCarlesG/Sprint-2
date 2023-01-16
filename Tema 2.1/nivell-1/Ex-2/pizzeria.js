use pizzeria

db.createCollection("pizzeries")
db.createCollection("customers")
db.createCollection("orders")

db.pizzeries.insertOne(
    {
        pizzeria_id: 1,
        address:
        {
            street: "Fake-Street",
            num: 1,
            city: "Fake-Town",
            zipcode: 08022,
            province: "Fake-Province"
        },
        employees: [
            {
                id: 1,
                name: "John",
                lastName: "Smith",
                nif: "99999999X",
                phone: 999999999,
                job: "Deliverer"
            },

        ],
        products: [
            {
                burguers: [
                    {
                        id: 1,
                        name: "Chicken Burguer",
                        description: "List of ingredients: bread, chicken, mayonese, salad",
                        image: new File(),
                        price: 10.99
                    },
                    {
                        id: 2,
                        name: "Bacon Cheese Burger",
                        description: "List of ingredients: bread, beef, bacon, cheese",
                        image: new File(),
                        price: 12.99
                    },
                ],
                pizzaCategory: [
                    {
                        category_id: 1,
                        name: "BBQ",
                        pizzas: [
                            {
                                id: 1,
                                name: "American-BBQ",
                                description: "List of ingredients: tomato sauce, bbq sauce, chicken, minced beef, bacon",
                                image: new File(),
                                price: 11.99
                            }
                        ],
                        category_id: 2,
                        name: "Traditional",
                        pizzas: [
                            {
                                id: 2,
                                name: "Margherita",
                                description: "List of ingredients: tomato sauce, mozzarella cheese",
                                image: new File(),
                                price: 9.99
                            },
                            {
                                id: 3,
                                name: "Prosciuto",
                                description: "List of ingredients: tomato sauce, mozzarella cheese, ham",
                                image: new File(),
                                price: 10.99
                            }
                        ]

                    }

                ],
                drinks: [
                    {
                        id: 1,
                        name: "Coca-Cola",
                        description: "Refreshing beverage",
                        image: new File(),
                        price: 1.99
                    },
                    {
                        id: 2,
                        name: "Fanta: Orange",
                        description: "Refreshing beverage, orange flavour",
                        image: new File(),
                        price: 1.99
                    },
                    {
                        id: 3,
                        name: "Sparkling water",
                        description: "Refreshing beverage",
                        image: new File(),
                        price: 1.59
                    }
                ]
            }
        ]
    }
)

db.orders.insertOne(
    {
        order_id: 1,
        customer_id: 1,
        pizzeria_id: 1,
        employee_id: 1,
        order_date: new Date(),
        type: "Delivery",
        sum_price: 0.0,
        delivery_date: new Date(),
        products: {

            burguers: [
                {
                    id: 1,
                    quantity: 2
                }
            ],
            drinks: [
                {
                    id: 1,
                    quantity: 2
                }
            ],
            pizzas: [
                {
                    id: 1,
                    quantity: 1
                }
            ]
        }
    }
)

db.customers.insertOne(
    {
        customers: [
            {
                customer_id: 1,
                name: "Juan",
                lastName: "Herrero",
                phone: 888888888,
                address: [
                    {
                        street: "Fake-Street",
                        num: 1,
                        floor: 1,
                        door: "A",
                        city: "Fake-Town",
                        zipcode: 08022,
                        province: "Fake-Province"
                    }
                ],

            }
        ]
    }
)
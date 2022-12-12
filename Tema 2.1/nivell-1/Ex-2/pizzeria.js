use pizzeria

db.createCollection("pizzeries")
//Cada pizzeria de la colecció té una adreça, uns empleats i uns clients. 
//Cada client fa comandes incloent quantitat i tipus de producte.
db.pizzeries.insertOne(
    {
        
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
            }
        ],
        customers: [
            {
                id: 1,
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
                orders: [
                    {
                        id: 1,
                        order_date: new Date(),
                        type: "Delivery",
                        sum_pizza: 0,
                        sum_burguer: 0,
                        sum_drink: 0,
                        sum_price: 0.0,
                        employee_id: 1,
                        delivery_date: new Date(),
                        burguers: [
                            {
                                id: 1,
                                name: "Chicken-Burguer",
                                description: "List of ingredients: bread, chicken, mayonese, salad",
                                image: new File(),
                                price: 10.99
                            }
                        ],
                        drinks: [
                            {
                                id: 1,
                                name: "Coca-Cola",
                                description: "Refreshing beverage",
                                image: new File(),
                                price: 1.99
                            }
                        ],
                        pizzaCategory: [
                            {
                                id: 1,
                                name: "BBQ",
                                pizzas: [
                                    {
                                        id: 1,
                                        name: "American-BBQ",
                                        description: "List of ingredients: tomato sauce, bbq sauce, chicken, minced beef, bacon",
                                        image: new File(),
                                        price: 11.99
                                    }
                                ]
                            }

                        ]
                    }
                ]

            }
        ]
    }
)
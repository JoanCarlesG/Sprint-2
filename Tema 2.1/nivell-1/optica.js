use optica

db.createCollection("suppliers")
db.createCollection("customers")
db.createCollection("employees")

db.suppliers.insertOne(
    {
        id: 1,
        name: "Glasses-Supplier",
        phone: 999999999,
        fax: 333333333,
        nif: "X99999999",
        address: [
            {
                street: "Fake-Street",
                num: 1,
                floor: 1,
                door: "A",
                city: "Fake-Town",
                zipcode: 08022,
                country: "Fake-Country"
            }
        ],
        glasses: [
            {
                id: 1,
                brand: "Expensive-Glasses",
                power: [
                    {
                        left: 0.5,
                        right: 0.5
                    }
                ],
                frame: [
                    {
                        type: "Metal",
                        color: "Blue"
                    }
                ],
                glassColor: [
                    {
                        left: "Colorless",
                        right: "Colorless"
                    }
                ],
                price: 129.99,
                employee_id: [1, 2, 3]
            }
        ]
    }
)

db.customers.insertOne(
    {
        id: 2,
        name: "Joe",
        lastName: "MacMillan",
        address: [
            {
                street: "NotFake-Street",
                num: 1,
                floor: 1,
                door: "A",
                city: "Fake-Town",
                zipcode: 08022,
                country: "Fake-Country"
            }
        ],
        phone: 888888888,
        mail: "fakeaccount@fakemail.com",
        registerDate: new Date(),
        reccomendedBy: 1 //Id client que li ha recomanat l'establiment
    }
)
db.employees.insertOne(
    {
        id: 1,
        name: "John",
        lastName: "Smith",
        sold: [
            {
                glasses_id: 1,
                timestamp: new Date()
            }
        ],

    }
)
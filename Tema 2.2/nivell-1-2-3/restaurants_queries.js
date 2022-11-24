//1
db.restaurants.find();
//2
db.restaurants.find({}, {restaurant_id:1, name:1, borough:1, cuisine:1});
//3
db.restaurants.find({}, {restaurant_id:1, name:1, borough:1, cuisine:1, _id:0})
//4
db.restaurants.find( {}, {address: {zipcode: 1 },restaurant_id:1, name:1, borough:1, _id:0});
//5

//6

//7

//8

//9

//10

//11

//12

//13

//14

//15

//16

//17

//18

//19

//20

//21

//22

//23

//24

//25

//26

//27

//28

//29

//30

//31

//32

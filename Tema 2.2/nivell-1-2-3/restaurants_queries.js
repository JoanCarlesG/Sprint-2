//1
db.restaurants.find()
//2
db.restaurants.find({}, {restaurant_id:1, name:1, borough:1, cuisine:1})
//3
db.restaurants.find({}, {restaurant_id:1, name:1, borough:1, cuisine:1, _id:0})
//4
db.restaurants.find({}, {address: {zipcode: 1},restaurant_id:1, name:1, borough:1, _id:0})
//5
db.restaurants.find({borough:"Bronx"})
//6
db.restaurants.find({borough:"Bronx"}).limit(5)
//7
db.restaurants.find({borough:"Bronx"}).skip(5).limit(5)
//8
db.restaurants.find({"grades.score": {$gt: 90}})
//9
db.restaurants.find({"grades.score": {$gt: 80, $lt: 100}})
//10
db.restaurants.find({"address.coord.": {$lt: -95.754168}})
//11
db.restaurants.find({cuisine: {$ne: "American "}, "grades.score": {$gt: 90}, "address.coord": {$lt: -65.754168}})
//12
db.restaurants.find({cuisine: {$ne: "American "}, "grades.score": {$gt: 90}, "address.coord": {$lt: -65.754168}})
//13
db.restaurants.find({cuisine: {$ne: "American "}, "grades.grade": {$eq: "A"}, borough: {$ne: "Brooklyn"}}).sort({cuisine: -1})
//14
db.restaurants.find({name: /^Wil/}, {restaurant_id:1, name:1, borough:1, cuisine:1})
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

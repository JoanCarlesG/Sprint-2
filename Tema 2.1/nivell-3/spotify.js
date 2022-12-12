use spotify

db.createCollection("user")
db.createCollection("artist")

db.user.insertOne(
    {
        user_id: 1,
        mail: "thisisanemail@gmail.com",
        password: "qwerty1234",
        name: "Spoty-User",
        birthdate: new Date("12-05-1990"),
        sex: "male",
        country: "My-Country",
        zipcode: 99999,
        artists_followed: [
            {
                artist_id: 1
            }
        ],
        fav_albums:[
            {
                album_id: 1
            }
        ],
        fav_songs:[
            {
                song_id: 1
            }
        ],
        playlists:[
            {
                playlist_id: 1,
                name: "My-playlist",
                sum_songs: 1,
                created_at: new Date(),
                status:{
                    status: true,
                    timestamp: new Date()
                },
                songs:[
                    {
                        song_id: 1,
                        added_by_user_id: 1,
                        timestamp: new Date()
                    }
                ]
            }
        ],
        type: {
            free: {
                status: false
            },
            premium:{
                status: true,
                subscription:{
                    start_date: new Date("12-05-2022"),
                    renewal_date: new Date("12-12-2022"),
                    sum_payments: 6,
                    payment_data:{
                        timestamp: new Date("12-11-2022"),
                        order_id: 99999999,
                        order_total: 9.99
                    },
                    payment_method:{
                        paypal:{
                            pp_username: "Paypaler"
                        },
                        credit_card:{
                            card_num: 9999999999999999,
                            expire_mont: 6,
                            expire_year: 2026,
                            secure_code: 999
                        }
                    }
                }
            }
        }

    }
)
db.artist.insertOne(
    {
        artist_id: 1,
        name: "Volbeat",
        picture: File(),
        related_artists:[
            {
                artist_id: 2
            }
        ],
        albums:[
            {
                album_id: 1,
                title: "Servant Of The Mind",
                release_year: 2021,
                cover: File(),
                songs:[
                    {
                        song_id: 1,
                        title: "Shotgun Blues",
                        length: 267,
                        times_played: 9999999
                    }
                ]
            }
        ]

    }
)
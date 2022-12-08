use spotify

db.createCollection("user")
db.createCollection("artist")

db.user.insertOne(
    {
        user_id: INT,
        mail: STR,
        password: STR,
        name: STR,
        birthdate: new Date(),
        sex: STR,
        country: STR,
        zipcode: INT,
        artists_followed: [
            {
                artist_id: INT
            }
        ],
        fav_albums:[
            {
                album_id: INT
            }
        ],
        fav_songs:[
            {
                song_id: INT
            }
        ],
        playlists:[
            {
                playlist_id: INT,
                name: STR,
                sum_songs: INT,
                created_at: new Date(),
                status:{
                    status: BOOL,
                    timestamp: new Date()
                },
                songs:[
                    {
                        song_id: INT,
                        user_id: INT,
                        timestamp: new Date()
                    }
                ]
            }
        ],
        type: {
            free: {
                status: BOOL
            },
            premium:{
                status: BOOL,
                subscription:{
                    start_date: new Date(),
                    renewal_date: new Date(),
                    sum_payments: INT,
                    payment_data:{
                        timestamp: new Date(),
                        order_id: INT,
                        order_total: FLOAT
                    },
                    payment_method:{
                        paypal:{
                            pp_username: STR
                        },
                        credit_card:{
                            card_num: INT,
                            expire_mont: INT,
                            expire_year: INT,
                            secure_code: INT
                        }
                    }
                }
            }
        }

    }
)
db.artist.insertOne(
    {
        artist_id: INT,
        name: STR,
        picture: File(),
        related_artists:[
            {
                artist_id: INT
            }
        ],
        albums:[
            {
                album_id: INT,
                title: STR,
                release_year: INT,
                cover: File(),
                songs:[
                    {
                        song_id: INT,
                        title: STR,
                        length: INT,
                        times_played: INT
                    }
                ]
            }
        ]

    }
)
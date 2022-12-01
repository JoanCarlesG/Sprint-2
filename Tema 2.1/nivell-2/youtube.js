use youtube

db.createCollection("user")
db.createCollection("channel")

db.user.insertOne(
    {
        user_id: INT,
        mail: STR,
        password: STR,
        username: STR,
        birthdate: Date(),
        sex: STR,
        country: STR,
        zipcode: INT,
        subscribed_to: [
            {
                channel_id: INT
            }
        ],
        liked_videos: [
            {
                video_id: INT,
                timestamp: new Date()
            }
        ],
        disliked_videos: [
            {
                video_id: INT,
                timestamp: new Date()
            }
        ],
        playlists: [
            {
                playlist_id:INT,
                name: STR,
                created_at: new Date(),
                state: STR,
                videos: [
                    {
                        video_id: INT
                    }
                ]
            }
        ],
        comments: [
            {
                comment_id:INT,
                text: STR,
                timestamp: new Date(),
                video_id: INT,
                liked_by: [
                    {
                        user_id: INT,
                        timestamp: new Date()
                    }
                ],
                disliked_by: [
                    {
                        user_id: INT,
                        timestamp: new Date()
                    }
                ]
            }
        ]
    }
)
db.channel.insertOne(
    {
        channel_id: INT,
        user_id: INT,
        channel_name: STR,
        desc: STR,
        created_at: new Date(),
        video: [
            {
                video_id: INT,
                title: STR,
                desc: STR,
                size: FLOAT,
                file_name: STR,
                length: INT,
                thumbnail: new File(),
                times_played: INT,
                sum_likes: INT,
                sum_dislikes: INT,
                created_at: new Date(),
                likes: [
                    {
                        user_id: INT,
                        timestamp: Date()
                    }
                ],
                dislikes: [
                    {
                        user_id: INT,
                        timestamp: Date()
                    }
                ],
                tags: [
                    {
                        tag_id: INT,
                        name: STR
                    }
                ]
            }
        ]
    }
)
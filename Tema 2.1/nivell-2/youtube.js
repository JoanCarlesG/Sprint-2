use youtube

db.createCollection("user")
db.createCollection("channel")
db.createCollection("videos")

db.user.insertOne(
    {
        user_id: 1,
        mail: "thisisanemail@mail.com",
        password: "qwerty1234",
        username: "Content-Creator",
        birthdate: new Date("12-05-1990"),
        sex: "male",
        country: "My-Country",
        zipcode: 99999,
        subscribed_to: [
            {
                channel_id: 2
            }
        ],
        liked_videos: [
            {
                video_id: 1,
                timestamp: new Date()
            }
        ],
        disliked_videos: [
            {
                video_id: 2,
                timestamp: new Date()
            }
        ],
        playlists: [
            {
                playlist_id: 1,
                name: "A-Playlist",
                created_at: new Date(),
                state: "public",
                videos: [
                    {
                        video_id: 1
                    }
                ]
            }
        ],
        comments: [
            {
                comment_id: 1,
                text: "This is a very useful comment.",
                timestamp: new Date(),
                video_id: 1,
                liked_by: [
                    {
                        user_id: 2,
                        timestamp: new Date()
                    }
                ],
                disliked_by: [
                    {
                        user_id: 3,
                        timestamp: new Date()
                    }
                ]
            }
        ]
    }
)
db.channel.insertOne(
    {
        channel_id: 1,
        user_id: 1,
        channel_name: "My-Channel",
        desc: "This is a channel to upload my useful videos.",
        created_at: new Date(),
        videos: [
            {
                video_id: 1,
            }
        ]
    }
)

db.videos.insertOne(

    {
        video_id: 1,
        title: "Sample-Video",
        desc: "This is a video description",
        size: 300.56,
        file_name: "sample-video-1",
        length: 13,
        thumbnail: new File(),
        times_played: 45,
        created_at: new Date(),
        likes: [
            {
                user_id: 2,
                timestamp: Date()
            }
        ],
        dislikes: [
            {
                user_id: 3,
                timestamp: Date()
            }
        ],
        tags: [
            {
                tag_id: 1,
                name: "tutorial"
            }
        ]
    }

)
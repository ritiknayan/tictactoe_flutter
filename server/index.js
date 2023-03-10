//importing modules
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');


const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const Room = require("./models/room.js");

var io = require("socket.io")(server);

//client data ->middleware -> server
//middleware
app.use(express.json());

const DB = "mongodb+srv://ritiknayan:x5OwzcwnmjyMUTAN@cluster0.wa5tkal.mongodb.net/TicTacDB?retryWrites=true&w=majority";

io.on('connection', (socket) => {
    console.log("connected!");

    socket.on("createRoom", async ({ nickname }) => {
        console.log('In socket');
        console.log(nickname);
        //    console.log(socket.id);

        try {
            let room = new Room();
            let player = {
                socketID: socket.id,
                nickname: nickname,
                playerType: 'X',
            };
            room.players.push(player);
            room.turn = player;

            //saving to mongoDB
            room = await room.save();

            const roomId = room._id.toString();
            socket.join(roomId);

            //tell our client that rrom has been created go to the next page

            // io -> send dat to evryone
            // socket -> sending data to yourself
            io.to(roomId).emit("createRoomSuccess", room);
        } catch (e) {
            console.log(e);
        }

        //room is created




        //player is stored in the room

    });

    socket.on('joinRoom', async ({ nickname, roomId }) => {
        try {
         if(!roomId.match(/^[0-9a-fA-F]{24}$/)){
            socket.emit("errorOccurred", "Please enter a valid room ID.");
            return;
         }
         let room = await Room.findById(roomId);

         if(room.isJoin){
           let player = {
            nickname,
            socketID: socket.id,
            playerType: 'O'
           }
           socket.join(roomId);
           room.players.push(player);    
           room.isJoin  = false;    
           room = await room.save();
           io.to(roomId).emit("joinRoomSuccess", room);
           io.to(roomId).emit("updatePlayers", room.players);
           io.to(roomId).emit("updateRoom", room);
           

        }else{
            socket.emit('errorOccurred', "The game is in progress, try again later.");
         }
        } catch (e) {
            console.log(e);
        }
    });
});

mongoose.connect(DB).then(() => {                 // promise in js is = future in dart
    console.log("Connection successful!");
}).catch((e) => {
    console.log(e);
});


// mongoose
//   .set('strictQuery', false)
//   .connect(DB, { useNewUrlParser: true, useUnifiedTopology: true })
//   .then(() => {
//     // app.listen(port, () => console.log(`Server running on port ${port}`));
//   })
//   .catch((error) => console.log(`${error} did??not??connect`));

server.listen(port, '0.0.0.0', () => {
    console.log(`Server started and running on port ${port}`);
});


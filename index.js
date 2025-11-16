import express from 'express';
import userRoutes from './routes/userRoutes.js';
import cors from 'cors';
import mongoose from 'mongoose';

const app = express();


const port = 6000;


mongoose.connect('mongodb+srv://hiteshpant50:alright@cluster0.fbhzw9j.mongodb.net/Chess_game').then((val) => {
  app.listen(port, () => {
    console.log(`connected and server is running  ${port}`);
  });
}).catch((err) => {
  console.log(err);
});

app.get('/', (req, res) => {
    res.send('Welcome to the Chess App Backend');

});


app.use(express.json());


app.use(cors());
app.use(userRoutes);

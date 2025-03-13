import express from 'express';
import cors from 'cors';
import mongoose from 'mongoose';
import authRouter from './routes/auth.js';
import adminRouter from './routes/admin.js';
import productRouter from './routes/product.js';
import userRouter from './routes/user.js';
const MONGODB_URI="mongodb+srv://bseyoum003:5sE1MDWfUL2SIsY0@cluster0.o3nbm.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
const app=express();
app.use(cors());
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);
mongoose.connect(MONGODB_URI).then(()=>{
    console.log('Mongodb atlas connected');
}).catch((e)=>{
    console.log(e);
})
app.get('/hu', (req, res)=>{
    res.send('Hi bitch');
})
app.use(express.json());
app.listen(3000, ()=>{
    console.log('Server running on port 3000');
})

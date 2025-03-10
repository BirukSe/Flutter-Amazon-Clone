import express from 'express';
import Uuser from '../models/user.js';
import bcryptjs from 'bcryptjs';
import jwt from 'jsonwebtoken';
import auth from '../middlewares/auth.js';
const router=express.Router();
router.post('/api/signup', async (req, res)=>{
    const {name, email, password}=req.body;
    const existingUser=await Uuser.findOne({email});
    if(existingUser){
        return res.status(400).json({msg: "User with same email already exists"});
    }
    const hashedPassword=await bcryptjs.hash(password, 10);
    let user=new Uuser({
        email,
        password: hashedPassword,
        name

    })
    user=await user.save();
    res.json(user);


})
router.post('/api/signin', async(req, res)=>{
    try{
        const {email, password}=req.body;
        const user=await Uuser.findOne({email});
        if(!user){
            return res.status(400).json({msg: 'User with this email doesnt exist'});
        }
        const isMatch=await bcryptjs.compare(password, user.password);
        if(!isMatch){
            return res.status(400).json({msg: 'Incorrect password'});
        }
       const token=await jwt.sign({id: user._id}, 'believeworkprayandachieve')
       res.json({token, ...user._doc})
        

    }catch(er){
        res.status(500).json({error: er.message});
    }
})
router.post("/tokenIsValid", async (req, res) => {
    try {
      const token = req.header("x-auth-token");
      if (!token) return res.json(false);
      const verified = jwt.verify(token, "passwordKey");
      if (!verified) return res.json(false);
  
      const user = await Uuser.findById(verified.id);
      if (!user) return res.json(false);
      res.json(true);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
router.get("/", auth, async (req, res) => {
    const user = await Uuser.findById(req.user);
    res.json({ ...user._doc, token: req.token });
  });




export default router;
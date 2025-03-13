import express from 'express';
import auth from '../middlewares/auth.js';
import Pproduct from '../models/product.js';
import Uuser from '../models/user.js';
const router=express.Router();
router.post('/api/add-to-cart', auth, async(req,res)=>{
    try {
       const {id}=req.body;
       const product=await Pproduct.findById(id);
        let user=await Uuser.findById(req.user);
        if(user.cart.length==0){
            user.cart.push({product, quantity: 1});
        }
        else{
            let isProductFound=false;
            for(let i=0; i<user.cart.length; i++){
                if(user.cart[i].product._id.equals(product._id)){
                    isProductFound=true;

                }
            }
            if(isProductFound){
                let producttt=user.cart.find((productt)=> productt.product._id.equals(product._id))
                producttt.quantity+=1;
            }else{
                user.cart.push({product, quantity: 1});
            }
        }
        user=await user.save();
        res.json(user);
    } catch (error) {
        res.status(500).json({error: e.message});
        
    }
})
router.delete('/api/remove-from-cart/:id', auth, async(req,res)=>{
    try {
       const {id}=req.params;
       const product=await Pproduct.findById(id);
        let user=await Uuser.findById(req.user);
 
            for(let i=0; i<user.cart.length; i++){
                if(user.cart[i].product._id.equals(product._id)){
                    if(user.cart[i].quantity==1){
                        user.cart.splice(i,1);
                    }
                    else{
                        user.cart[i].quantity-=1;
                    }

                }
            }
          
        
        user=await user.save();
        res.json(user);
    } catch (error) {
        res.status(500).json({error: e.message});
        
    }
})
export default router;
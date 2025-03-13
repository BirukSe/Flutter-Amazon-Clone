import express from 'express';
import admin from '../middlewares/admin.js';
import Pproduct from '../models/product.js';
const router=express.Router();
router.post('/admin/add-product', admin, async(req,res)=>{
    try {
        const {name, description, images, quantity, price, category}=req.body;
        let product=new Pproduct({
            name,
            description,
            images,
            quantity,
            price,
            category
        })
        product=await product.save();
        res.json(product);

        
    } catch (error) {
        res.status(500).json({error: e.message});
        
    }
})
router.get('/admin/get-products', admin, async (req, res)=>{
    try {
        const products=await Pproduct.find();
        res.json(products);
        
    } catch (error) {
        res.status(500).json(e.toString());
        
    }
})
router.post('/delete-product', admin, async(req, res)=>{
    try {
       const {id}=req.body;
       let product=await Pproduct.findByIdAndDelete(id);
      
       res.json(product);
        
    } catch (error) {
        res.status(500).json(e.toString());
    }
})

export default router;
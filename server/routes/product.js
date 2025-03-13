import express from 'express';
import auth from '../middlewares/auth.js';
import Pproduct from '../models/product.js';
const router=express.Router();
router.get("/api/products", auth, async(req,res)=>{
    try {
        console.log(req.query.category);
        const products=await Pproduct.find({category: req.query.category});
        res.json(products);
        
    } catch (error) {
        res.status(500).json({error: error.message})
        
    }
})
router.get("/api/products/search/:name", auth, async(req,res)=>{
    try {
        console.log(req.query.category);
        const products=await Pproduct.find({name: {$regex: req.params.name, $options: 'i'}})

        res.json(products);
        
    } catch (error) {
        res.status(500).json({error: error.message})
        
    }
})
router.post('/api/rate-product', auth, async (req, res)=>{
    try {
        const {id, rating}=req.body;
        let product=await Pproduct.findById(id);
        for(let i=0; i<product.ratings.length; i++){
            if(product.ratings[i].userId==req.user){
                product.ratings.splice(i, 1);
                break;
            }
        }
        const ratingSchema={
            userId: req.user,
            rating: rating
        };
        product.ratings.push(ratingSchema);
        product=await product.save();
        res.json(product);
        
    } catch (error) {
        res.status(500).json({error: error.message})
        
    }
})
router.get('/api/deal-of-day', auth, async(req, res)=>{
    try {
        let products=await Pproduct.find();
        products= products.sort((a,b)=>{
            let aSum=0;
            let bSum=0;
            for(let i=0; i<a.ratings.length; i++){
                aSum+=a.ratings[i].rating;
            }
            for(let i=0; i<b.ratings.length; i++){
                bSum+=b.ratings[i].rating;
            }
            return aSum<bSum?1:-1;
            
         })
         res.json(products[0]);
        
    } catch (error) {
        res.status(500).json({error:error.message})
        
    }
})



export default router;
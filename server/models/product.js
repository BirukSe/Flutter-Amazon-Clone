import mongoose from 'mongoose';
import ratingSchema from './rating.js';
// const { productSchema } = require("./product");

export const pproductSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    description: {
        type: String,
        required: true,
        trim: true
    },
    images: [
        {
            type: String,
            required: true
        }
    ],
    quantity: {
        type: Number,
        required: true
    },
    price: {
        type: Number,
        required: true
    },
    category: {
        type: String,
        required: true
    },
    ratings: [ratingSchema]
    
    
})
const Pproduct=mongoose.model("Pproduct", pproductSchema);
export default Pproduct;
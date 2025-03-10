import mongoose from 'mongoose';
// const { productSchema } = require("./product");

const uuserSchema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Please enter a valid email address",
    },
  },
  password: {
    required: true,
    type: String,
  },
  address: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    default: "user",
  },
 
});

const Uuser = mongoose.model("Uuser", uuserSchema);
export default Uuser;
 // cart: [
  //   {
  //     product: productSchema,
  //     quantity: {
  //       type: Number,
  //       required: true,
  //     },
  //   },
  // ], 
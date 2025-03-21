import jwt from 'jsonwebtoken';
import Uuser from '../models/user.js';
const admin=async(req, res, next)=>{
    try {
       const token = req.header("x-auth-token");
       if (!token)
         return res.status(401).json({ msg: "No auth token, access denied" });
   
       const verified = jwt.verify(token, "believeworkprayandachieve");
       if (!verified)
         return res
           .status(401)
           .json({ msg: "Token verification failed, authorization denied." });
      const user=await Uuser.findById(verified.id);
      if(user.type=='user' || user.type=='seller'){
        return res.status(401).json({msg: "You are not an admin"})
      }
       req.user = verified.id;
       req.token = token;
       next();
     } catch (err) {
       res.status(500).json({ error: err.message });
     }
}
export default admin;
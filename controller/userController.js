import User from "../model/user.js";
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';

export const  getUser =(req, res) => {

    res.status(200).json({
        status: 'success',
        data: 'user info'
    })
};


export const registerUser = async (req, res)=>{

   const { email,password} = req.body ?? {} ;

   try {
    const hashedPassword = bcrypt.hashSync(password,10)
      await User.create({

         email,
         password: hashedPassword
      });
      return res.status(201).json({
         status: 'success',
         data: 'user register successfully'
      });
      
   } catch (err) {
      return res.status(400).json({
         status: 'Error',
         data: err.message
      });
      
      
   }
}

export const loginUser = async (req, res) => {
  const { email, password } = req.body ?? {};
  try {
    const isExist = await User.findOne({ email });
    if (!isExist) return res.status(404).json({
      status: 'error',
      data: 'user doesn\'t exist'
    });

    const pass = bcrypt.compareSync(password, isExist.password);

    if (!pass) return res.status(400).json({
      status: 'error',
      data: 'invalid credential'
    });
    const token = jwt.sign({
      id: isExist.id,
    }, 'secret');
    return res.status(200).json({
      status: 'success',
      data: {
        token,
        role: isExist.role
      }
    });


  } catch (err) {
    return res.status(500).json({
      status: 'error',
      data: err.message
    });
  }
}
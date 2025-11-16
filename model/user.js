import mongoose from "mongoose";

const userSchema = new mongoose.Schema({
  email: {
    type: String,
    unique: true,
     validate: {
      validator: function (v) {
        return /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(v);
      },
      message: (props) => `${props.value} is not a valid email address!`
    },
    required: true
  },
  password: {
    type: String,
    required: true
  },
}, { timestamps: true });


const User = mongoose.model('User', userSchema);

export default User;
import express from 'express';
import { getUser, loginUser, registerUser } from '../controller/userController.js';

const router = express.Router();

router.get('/api/users', getUser);
router.post('/api/register', registerUser);
router.post('/api/login', loginUser);

export default router;
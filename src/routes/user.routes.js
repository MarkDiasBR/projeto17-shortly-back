import { Router } from 'express';
import { schemaValidation } from '../middlewares/schemaValidation.middleware.js';
import { signupSchema, signinSchema } from '../schemas/user.schemas.js';
import signupConflictValidation from '../middlewares/signup.middleware.js';
import signinValidation from '../middlewares/signin.middleware.js';
import { signup, signin, getUrlById, searchAndIncrement } from '../controllers/user.controller.js';




const userRouter = Router();

userRouter.post('/signup', schemaValidation(signupSchema), signupConflictValidation, signup);
userRouter.post('/signin', schemaValidation(signinSchema), signinValidation, signin);
userRouter.get('/urls/:id', getUrlById);
userRouter.get('/urls/open/:id', searchAndIncrement);
userRouter.get('/ranking');

export default userRouter;
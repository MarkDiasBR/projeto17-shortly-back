import { Router } from 'express';
import { schemaValidation } from '../middlewares/schemaValidation.middleware.js';
import { signupSchema, signinSchema } from '../schemas/user.schemas.js';
import signupConflictValidation from '../middlewares/signup.middleware.js';
import signinValidation from '../middlewares/signin.middleware.js';
import { signup, signin, getUrlById, searchIncrementRedirect, redirectTraffic, getRanking } from '../controllers/user.controller.js';




const userRouter = Router();

userRouter.post('/signup', schemaValidation(signupSchema), signupConflictValidation, signup);
userRouter.post('/signin', schemaValidation(signinSchema), signinValidation, signin);
userRouter.get('/urls/:id', getUrlById);
userRouter.get('/urls/open/:shorturl', searchIncrementRedirect, );
userRouter.get('/u/:shortUrl', redirectTraffic);
userRouter.get('/ranking', getRanking);

export default userRouter;
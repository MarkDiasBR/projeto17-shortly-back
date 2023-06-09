import { Router } from 'express'
import { authValidation } from '../middlewares/auth.middleware.js';
import { schemaValidation } from '../middlewares/schemaValidation.middleware.js';
import { urlSchema } from '../schemas/auth.schemas.js';
import { shortenUrl, deleteLink, getUser, getUserData, getUserName } from '../controllers/auth.controller.js';

const authRouter = Router();

authRouter.use(authValidation);
authRouter.post('/urls/shorten', schemaValidation(urlSchema), shortenUrl);
authRouter.delete('/urls/:id', deleteLink);
authRouter.get('/users/me', getUser);
authRouter.get('/users/data', getUserData);
authRouter.get('/users/name', getUserName);

export default authRouter;
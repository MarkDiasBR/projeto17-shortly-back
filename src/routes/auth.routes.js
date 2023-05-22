import { Router } from 'express'
import { authValidation } from '../middlewares/auth.middleware.js';
import { schemaValidation } from '../middlewares/schemaValidation.middleware.js';
import { urlSchema } from '../schemas/auth.schemas.js';
import { shortenUrl, deleteLink, getUser } from '../controllers/auth.controller.js';

const authRouter = Router();

authRouter.use(authValidation);
authRouter.post('/urls/shorten', schemaValidation(urlSchema), shortenUrl);
authRouter.delete('/urls/:id', deleteLink);
authRouter.get('/users/me', getUser);

export default authRouter;
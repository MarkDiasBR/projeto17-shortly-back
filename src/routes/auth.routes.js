import { Router } from 'express'
import { authValidation } from '../middlewares/auth.middleware.js';
import { schemaValidation } from '../middlewares/schemaValidation.middleware.js';
import { urlSchema } from '../schemas/auth.schemas.js';
import { shortenUrl } from '../controllers/auth.controller.js';
// import { schemaParamsTypeValidation, schemaValidation } from '../middlewares/schema.middleware.js';
// import { transactionParamsSchema, transactionSchema, editTransactionSchema } from '../schemas/transactions.schemas.js';
// import { postTransaction, getTransactions, deleteTransaction, editTransaction } from '../controllers/auth.controller.js';

const authRouter = Router();

authRouter.use(authValidation);
authRouter.post('/urls/shorten', schemaValidation(urlSchema), shortenUrl);
authRouter.delete('/urls/:id' );
authRouter.get('/users/me' );

export default authRouter;
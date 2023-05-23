import express, { json } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import chalk from 'chalk';
import connectToDatabase from './database/databaseConnection.js';
import router from './routes/index.routes.js'
dotenv.config();

const app = express();
app.use(json());
app.use(cors());

export const db = await connectToDatabase();

app.use(router);

const PORT = 5000;
app.listen(process.env.PORT, () => {
    console.log(chalk.bgMagenta('\n [Node.js/Express] Server connected SUCCESSFULLY! '), '🖥️⚙️✨');
    console.log(chalk.white(' Server URL:'), chalk.blue.italic.underline(`http://localhost:${PORT}`));
});
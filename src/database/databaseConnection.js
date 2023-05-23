import chalk from 'chalk';
import pg from "pg";
import dotenv from "dotenv";
dotenv.config();

export default async function connectToDatabase() {

    const { Pool } = pg;

    const configDatabase = {   
        max: 120, 
        connectionString: process.env.DATABASE_URL
    };

    // if (process.env.MODE === "prod") configDatabase.ssl = true;
    configDatabase.ssl = true;

    let db = new Pool(configDatabase);

    try {
        await db.connect();
        console.log(chalk.black.bgGreen('\n [🐘 PostgreSQL] DataBase connected SUCCESSFULLY! '), '🗄️📨✨')
        console.log(chalk.white(" DB URL:"), chalk.underline.italic.blue(process.env.DATABASE_URL));
    } catch (err) {
        console.log(chalk.white.bgRed('\n [🐘 PostgreSQL] DataBase connection failed! '), '🗄️📨🚫');
        console.error(err.message);
    }


    return db;
}
import { db } from '../app.js';
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';

export async function signup(req, res) {
    const { name, email, password, confirmPassword } = req.body;
    const hash = bcrypt.hashSync(password, 10);

    try {
        await db.query(`
            INSERT INTO shortly.users (name, email, password) 
            VALUES ($1, $2, $3)
        `, [name, email, hash]);

        return res.status(201).send('✅ User created SUCESSFULLY!');
    } catch (err) {
        return res.status(500).send(`🚫 Unexpected server error!\n\n${err.message}`);
    }
}

export async function signin(req, res) {
    const user = res.locals.user;

    try {
        const token = uuid();

        await db.query(`
            INSERT
            INTO shortly.sessions ("userId", token)
            VALUES ($1, $2);
        `, [user.id, token])
        return res.send({ name: user.name, token });
    } catch (err) {
        res.status(500).send(`🚫 Unexpected server error!\n\n${err.message}`);
    }
}

export async function getUrlById(req, res){
    const { id } = req.params;

    try {
        const promise = await db.query(`
            SELECT id, "shortUrl", url
            FROM shortly.links
            WHERE id=$1
            LIMIT 1;
        `, [id])

        if (promise.rowCount === 0) return res.status(404).send(`🚫 Link doesn't exist!`);

        return res.send(promise.rows[0]);
    } catch (err) {
        res.status(500).send(`🚫 Unexpected server error!\n\n${err.message}`);
    }
}

export async function searchAndIncrement(req, res, next) {
    const { shorturl } = req.params;

    try {
        const promise = await db.query(`
            UPDATE shortly.links
            SET "visitCount" = "visitCount" + 1
            WHERE "shortUrl" = $1;
        `, [shorturl]);

        if (promise.rowCount === 0) {
            return res.status(404).send(`🚫 Link doesn't exist!`);
        }

        return res.sendStatus(200);
    } catch (err) {
        res.status(500).send(`🚫 Unexpected server error!\n\n${err.message}`);
    }
}
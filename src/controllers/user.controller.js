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

export async function searchIncrementRedirect(req, res) {
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

        const promise2 = await db.query(`
            SELECT url
            FROM shortly.links
            WHERE "shortUrl" = $1
            LIMIT 1;
        `, [shorturl]);

        const { url } = promise2.rows[0];
        
        return res.redirect(url);
    } catch (err) {
        res.status(500).send(`🚫 Unexpected server error!\n\n${err.message}`);
    }
}

export async function redirectTraffic(req, res) {
    const { shortUrl } = req.params;
    res.redirect(`/urls/open/${shortUrl}`);
}

export async function getRanking(req, res) {
    try {
        const promise = await db.query(`
            SELECT 
                shortly.users.id AS id,
                shortly.users.name,
                COUNT (shortly.links."userId") AS "linksCount",
                SUM (shortly.links."visitCount") AS "visitCount"
            FROM shortly.users
            JOIN shortly.links ON shortly.links."userId"=shortly.users.id
            GROUP BY shortly.users.id
            ORDER BY "visitCount" DESC
            LIMIT 10;
        `)

        res.send(promise.rows);
    } catch (err) {
        res.status(500).send(`🚫 Unexpected server error!\n\n${err.message}`);
    }
}
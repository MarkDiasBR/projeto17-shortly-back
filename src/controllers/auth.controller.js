import { db } from '../app.js';
import { v4 as uuid } from 'uuid';

export async function shortenUrl(req, res) {
    const { url } = req.body;
    const { userId } = res.locals.session;
    let id;
    
    const shortUrl = uuid()
        .replace(/-/g, '')
        .substring(0, 8)
        .split('')
        .map((char) => {
          const randomCase = Math.random() < 0.5 ? 'toUpperCase' : 'toLowerCase';
          return char[randomCase]();
        })
        .join('');

    try {
        const promise = await db.query(`
            INSERT
            INTO shortly.links (url, "shortUrl", "userId", "visitCount")
            VALUES ($1, $2, $3, 0)
        `, [url, shortUrl, userId])

        const result = await db.query(`
            SELECT id
            FROM shortly.links
            WHERE "shortUrl" = $1
        `, [shortUrl])

        id = result.rows[0].id;
    } catch (err) {
        res.status(500).send(`🚫 Unexpected server error!\n\n${err.message}`);
    }

    const response = {
        id,
        shortUrl
    }

    res.status(201).send(response);
}
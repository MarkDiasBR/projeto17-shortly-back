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

export async function deleteLink(req, res) {
    const { id: shortUrl } = req.params;

    const urlSearch = await db.query(`
        SELECT *
        FROM shortly.links
        WHERE "shortUrl"=$1;
    `, [shortUrl]);

    if (urlSearch.rowCount===0) return res.status(404).send(`🚫 Link doesn't exist!`);

    const urlDelete = await db.query(`
        DELETE
        FROM shortly.links
        WHERE "shortUrl"=$1 AND "userId"=$2;
    `, [shortUrl, res.locals.session.userId]);

    if (urlDelete.rowCount===0) return res.status(401).send(`🚫 Link doesn't belong to you!`);

    return res.status(204);
}

export async function getUser(req, res) {
    const { userId } = res.locals.session;

    const resume = await db.query(`
        SELECT
            u.id AS id,
            u.name AS name,
            SUM(l."visitCount") AS "visitCount",
            json_agg(json_build_object(
            'id', l.id,
            'shortUrl', l."shortUrl",
            'url', l.url,
            'visitCount', l."visitCount"
            )) AS "shortenedUrls"
        FROM shortly.users AS u
        JOIN shortly.links AS l ON u.id = l."userId"
        WHERE u.id=$1
        GROUP BY u.id;
    `, [userId])

    console.log(resume.rows[0])
}
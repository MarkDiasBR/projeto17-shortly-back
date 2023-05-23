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
            INTO public.links (url, "shortUrl", "userId", "visitCount")
            VALUES ($1, $2, $3, 0)
        `, [url, shortUrl, userId])

        const result = await db.query(`
            SELECT id
            FROM public.links
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
    const { id } = req.params;

    try {
        const urlSearch = await db.query(`
            SELECT *
            FROM public.links
            WHERE "id"=$1;
        `, [id]);
        
        if (urlSearch.rowCount===0) return res.status(404).send("🚫 Link doesnt exist!");

        const urlDelete = await db.query(`
            DELETE
            FROM public.links
            WHERE "id"=$1 AND "userId"=$2;
        `, [id, res.locals.session.userId]);

        //, res.locals.session.userId

        if (urlDelete.rowCount===0) return res.status(401).send("🚫 Link doesnt belong to you!");

        res.sendStatus(204);
    } catch (err) {
        res.status(500).send(`🚫 Unexpected server error!\n\n${err.message}`);
    }
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
            )ORDER BY l."visitCount" DESC, l.id ASC) AS "shortenedUrls"
        FROM public.users AS u
        JOIN public.links AS l ON u.id = l."userId"
        WHERE u.id=$1
        GROUP BY u.id;
    `, [userId])

    res.send(resume.rows[0])
}

export async function getUserData(req, res) {
    try {
        const { userId } = res.locals.session;
    
        const userDataRequisition = await db.query(`
            SELECT *
            FROM public.users AS u
            WHERE u.id=$1;
        `, [userId]);
    
        const userData = userDataRequisition.rows[0];
        res.send(userData);
    } catch (error) {
        res.status(500).send(`🚫 Unexpected server error!\n\n${err.message}`);
    }
}

export async function getUserName(req, res) {
    try {
        const { userId } = res.locals.session;
    
        const userDataRequisition = await db.query(`
            SELECT name
            FROM public.users AS u
            WHERE u.id=$1;
        `, [userId]);
    
        const userData = userDataRequisition.rows[0];
        res.send(userData);
    } catch (error) {
        res.status(500).send(`🚫 Unexpected server error!\n\n${err.message}`);
    }
}
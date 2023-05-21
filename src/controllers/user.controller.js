import { db } from '../app.js';
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';

export async function signup(req, res) {
    const { name, email, password, confirmPassword } = req.body;

    //password encryption
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
    // const {}

    // const user = res.locals.user;

    try {
        const token = uuid()
        await db.collection('sessions').insertOne({ token, userId: user._id })
        res.send({ name: user.name, token });
    } catch (err) {
        res.status(500).send(`🚫 Unexpected server error!\n\n${err.message}`);
    }
}
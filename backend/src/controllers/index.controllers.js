const { Pool } = require("pg");

const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password: '311002',
    database: 'firstapi',
    port: '5432'
});

/**
 * Get a user by ID
 * @param {Object} req - Express request object
 * @param {Object} res - Express response object
 */
const getUserById = async (req, res) => {
    const id = req.params.id;
    const response = await pool.query('SELECT * FROM users WHERE user_id = $1', [id]);
    res.json(response.rows);
};

/**
 * Get all users
 * @param {Object} req - Express request object
 * @param {Object} res - Express response object
 */
const getUsers = async (req, res) => {
    const response = await pool.query('SELECT * FROM users');
    res.status(200).json(response.rows);
};

/**
 * Create a new user
 * @param {Object} req - Express request object
 * @param {Object} res - Express response object
 */
const createUser = async (req, res) => {
    try {
        const { name } = req.body;
        const response = await pool.query('INSERT INTO users (user_name, user_puntos) VALUES ($1, $2)', [name, 0]);
        console.log(response);
        res.send('User created successfully');
    } catch (error) {
        console.error('Error creating user:', error);
        res.status(500).send('Internal Server Error');
    }
};

/**
 * Get words by length
 * @param {Object} req - Express request object
 * @param {Object} res - Express response object
 */
const getWordsByLength = async (req, res) => {
    const length = req.params.length;
    const response = await pool.query("SELECT * FROM banco_palabras WHERE bapa_tamanopalabra = $1", [length]);
    res.json(response.rows);
};

/**
 * Get all words
 * @param {Object} req - Express request object
 * @param {Object} res - Express response object
 */
const getWords = async (req, res) => {
    const response = await pool.query('SELECT * FROM banco_palabras');
    res.status(200).json(response.rows);
};

/**
 * Delete a user
 * @param {Object} req - Express request object
 * @param {Object} res - Express response object
 */
const deleteUser = async (req, res) => {
    const id = req.params.id;
    const response = await pool.query("DELETE FROM users WHERE user_id = $1", [id]);
    console.log(response);
    res.json('User ID: ' + id + ' deleted successfully');
};

/**
 * Update a user's points
 * @param {Object} req - Express request object
 * @param {Object} res - Express response object
 */
const updateUser = async (req, res) => {
    const id = req.params.id;
    const { puntos } = req.body;
    const response = await pool.query("UPDATE users SET user_puntos = $1 WHERE user_id=$2", [puntos, id]);
    console.log(response);
    res.send('User Updated Successfully');
};

/**
 * Get words by level
 * @param {Object} req - Express request object
 * @param {Object} res - Express response object
 */
const getWordByLevel = async (req, res) => {
    const id = req.params.id;
    const response = await pool.query("SELECT * FROM banco_palabras WHERE bapa_nivel = $1", [id]);
    if (response.rows.length > 0) {
        res.status(200).json(response.rows);
    } else {
        res.send("Word not found");
    }
};

module.exports = {
    getUsers,
    createUser,
    getWords,
    getUserById,
    getWordsByLength,
    deleteUser,
    updateUser,
    getWordByLevel
};

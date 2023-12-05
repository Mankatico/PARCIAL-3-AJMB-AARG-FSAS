const { Router } = require('express');
const router = Router();

const {
    updateUser,
    deleteUser,
    getWordsByLength,
    getUserById,
    getWords,
    getUsers,
    createUser,
    getWordByLevel
} = require("../controllers/index.controllers");

/**
 * Route to add a new user
 */
router.post('/addUser', createUser);

/**
 * Route to get all users
 */
router.get('/users', getUsers);

/**
 * Route to get a user by ID
 */
router.get('/user/:id', getUserById);

/**
 * Route to get all words
 */
router.get('/words', getWords);

/**
 * Route to get words by length
 */
router.get('/word/:length', getWordsByLength);

/**
 * Route to get words by level
 */
router.get('/words/:id', getWordByLevel);

/**
 * Route to delete a user by ID
 */
router.delete('/deleteUser/:id', deleteUser);

/**
 * Route to update user points by ID
 */
router.put('/updateUser/:id', updateUser);

module.exports = router;

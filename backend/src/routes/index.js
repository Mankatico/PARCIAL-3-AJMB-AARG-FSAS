const {Router} = require('express');
const router = Router();

const {updateUser,deleteUser,getPalabrasByLenght,getUserById,getPalabras,getUsers,createUsers} = require("../controllers/index.controllers")

router.post('/addUser',createUsers);
router.get('/Users',getUsers);
router.get('/user/:id',getUserById);
router.get('/palabras',getPalabras);
router.get('/palabra/:lenght',getPalabrasByLenght);
router.delete('/deleteUser/:id',deleteUser);
router.put('/updateUser/:id',updateUser);

module.exports = router;
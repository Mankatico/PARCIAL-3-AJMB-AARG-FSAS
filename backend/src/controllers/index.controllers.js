const { Pool } = require("pg");

const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password: '311002',
    database: 'firstapi',
    port: '5432'
});

const getUserById = async(req, res) =>{
    const id = req.params.id;
    const response = await pool.query('select * from users where user_id = $1',[id]);
    res.json(response.rows);
};

const getUsers = async (req, res) => {
    const response = await pool.query('SELECT * FROM users');
    res.status(200).json(response.rows);
};

const createUsers = async (req, res) => {
    try {
        const { name } = req.body;
        const response = await pool.query('INSERT INTO users (user_name, user_puntos) VALUES ($1, $2)', [name, 0]);
        console.log(response);
        res.send('User created Succesfully');
    } catch (error) {
        console.error('Error creating user:', error);
        res.status(500).send('Internal Server Error');
    }
};

const getPalabrasByLenght = async(req,res)=>{
    const lenght = req.params.lenght;
    const response = await pool.query("select * from banco_palabras where bapa_tamanopalabra = $1",[lenght]);
    res.json(response.rows);
}

const getPalabras = async (req, res) => {
    const response = await pool.query('SELECT * FROM banco_palabras');
    res.status(200).json(response.rows);
};

const deleteUser = async (req,res) =>{
    const id = req.params.id;
    const response = await pool.query("delete from users where user_id = $1",[id]);
    res.json('User ID: '+id+' deleted successfully');
};

const updateUser = async (req,res)=>{
    const id = req.params.id;
    const {puntos} = req.body;
    const response = await pool.query("update users set user_puntos = $1 where user_id=$2",[puntos,id])
    console.log(response);
    res.send('User Updated Successfully');
};

module.exports = {
    getUsers,
    createUsers,
    getPalabras,
    getUserById,
    getPalabrasByLenght,
    deleteUser,
    updateUser
};

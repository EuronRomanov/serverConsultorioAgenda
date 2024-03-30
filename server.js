const  express= require("express");
const cors = require("cors");
const app = express();

var corsOptions={
    origin:['http://localhost:8081','http://localhost:8080'],
    methods:['POST','OPTIONS','GET'],

};

app.use(cors());

app.use(express.json());

app.use(express.urlencoded({extended:true}));



app.use((req, res, next) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Access-Control-Allow-Methods", "OPTIONS,POST, GET, PUT");
    res.header(
      "Access-Control-Allow-Headers",
      "Origin, X-Requested-With, Content-Type, Accept"
    );
    next();
  });
  

app.get("/",(req,res)=>{
    res.json({message:"Welcome to the serer of farmacy"});
});

require("./app/routes/evento.routes.js")(app);
require("./app/routes/paciente.routes.js")(app);

const PORT =process.env.PORT || 8080;

app.listen(PORT,()=>{
    console.log(`Server is running on port ${PORT}.`);
});
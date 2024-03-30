const sql=require("./db.js");

const Evento=function(evento) {
    this.codPaciente=evento.codPaciente;
    this.start=evento.start;
    this.end=evento.end;
    this.description=evento.description;
};

Evento.create=(newEvento, result)=>{
   // console.log(newEvento);
    sql.query("CALL proc_agregarNuevoEvento(?,?,?,?,@respuesta); SELECT @respuesta as outParam",[newEvento.codPaciente,newEvento.start,newEvento.end,newEvento.description],(err,res)=>{
        if (err) {
           console.log("error : ",err);
           result(err, null);
           return;
        }
        console.log("created event");
        result(null,res[1][0].outParam);
    });
};

Evento.getAll=(title, result)=>{
    let query="Select * from view_eventos";

    if (title) {
        query+=` WHERE title LIKE '%${title}%'`;
    }

    sql.query(query,(err,res)=>{
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
       
        result(null,res);
    });
};
//actualizar

Evento.updateById =(id, newEvento, result)=>{
    
    sql.query("CALL proc_actualizarEvento(?,?,?,?,?,@respuesta); SELECT @respuesta as outParam",[id,newEvento.codPaciente,newEvento.start,newEvento.end,newEvento.description],(err,res)=>{
        if (err) {
           console.log("error : ",err);
           result(err, null);
           return;
        }
        console.log("updated event");
        result(null,res[1][0].outParam);
    });
};



//eliminar
Evento.remove =(id, result)=>{
    
    sql.query("CALL proc_eliminarEvento(?,@respuesta); SELECT @respuesta as outParam",[id],(err,res)=>{
        if (err) {
           console.log("error : ",err);
           result(err, null);
           return;
        }
        console.log("removed event");
        result(null,res[1][0].outParam);
    });
};
     
//buscar por id
Evento.findById=(id,result)=>{
    sql.query(`SELECT * FROM view_eventos WHERE id = ${id}`,(err,res)=>{
        if(err){
            console.log("error: ", err);
            result(err, null);
            return;
        }

        if (res.length) {
            result(null,res[0]);
            return;
        }

        result({kind:"not_found"},null);
    });
};

module.exports=Evento;
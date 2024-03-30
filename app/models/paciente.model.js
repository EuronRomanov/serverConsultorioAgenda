const sql=require("./db.js");

const Paciente=function(paciente) {
        this.nombre=paciente.nombre;
        this.cedula=paciente.cedula;
        this.celular=paciente.celular;
        this.direccion=paciente.direccion;
        this.fechaNacimiento=paciente.fechaNacimiento;
        this.lugarNacimiento=paciente.lugarNacimiento;
        this.lugarResidencia=paciente.lugarResidencia;
        this.nacionalidad=paciente.nacionalidad;
        this.grupCultural=paciente.grupCultural;
        this.genero=paciente.genero;
        this.estadoCivil=paciente.estadoCivi;
        this.ocupacion=paciente.ocupacion;
        this.empresa=paciente.empresa;
        this.seguro=paciente.seguro;
        this.referido=paciente.referido;
        this.nombreContactoE=paciente.nombreContactoE;
        this.afinidadContactoE=paciente.afinidadContactoE;
        this.correoContactoE=paciente.correoContactoE;
        this.direccionContactoE=paciente.direccionContactoE;
        this.telefonoContactoE=paciente.telefonoContactoE;
        this.zona=paciente.zona;
        this.edad=paciente.edad;
        this.ultimoAno=paciente.ultimoAno;
};

Paciente.create=(newPaciente, result)=>{
    sql.query("CALL proc_agregarNuevoPaciente(?,?,?,?,?,?,?,@respuesta); SELECT @respuesta as outParam",[newPaciente.nombre,
        newPaciente.cedula,
        newPaciente.celular,
        newPaciente.direccion,
        newPaciente.fechaNacimiento,
        newPaciente.lugarNacimiento,
        newPaciente.lugarResidencia],(err,res)=>{
        if (err) {
           console.log("error : ",err);
           result(err, null);
           return;
        }
        console.log("created event");
        result(null,res[1][0].outParam);
    });
};

Paciente.getAll=(cedula, result)=>{
    let query="Select * from paciente";

    if (cedula) {
        query+=` WHERE cedula LIKE '%${cedula}%'`;
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


Paciente.getAllCombo=( result)=>{
    let query="Select nombre as label,idPaciente as value from paciente";

    

    sql.query(query,(err,res)=>{
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null,res);
    });
};


//buscar por id
Paciente.findById=(id,result)=>{
    sql.query(`SELECT * FROM paciente WHERE idPaciente = ${id}`,(err,res)=>{
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

module.exports=Paciente;
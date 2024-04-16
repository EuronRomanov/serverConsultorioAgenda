const Paciente=require("../models/paciente.model.js");

exports.create=(req,res)=>{
    if (!req.body) {
        res.status(400).send({
            message:"Content cant empty!"
        });
    }


   
    const paciente=new Paciente({
        nombre:req.body.nombre.toUpperCase(),
        cedula:req.body.cedula,
        celular:req.body.celular,
        direccion:req.body.direccion,
        fechaNacimiento:req.body.fechaNacimiento.split("T")[0],
        lugarNacimiento:req.body.lugarNacimiento,
        lugarResidencia:req.body.provinciaResidencia+"_"+req.body.cantonResidencia+"_"+req.body.parroquiaResidencia,
        nacionalidad:req.body.nacionalidad,
        grupCultural:req.body.grupCultural,
        genero:req.body.genero,
        estadoCivil:req.body.estadoCivi,
        ocupacion:req.body.ocupacion,
        empresa:req.body.empresa,
        seguro:req.body.seguro,
        referido:req.body.referido,
        nombreContactoE:req.body.nombreContactoE,
        afinidadContactoE:req.body.afinidadContactoE,
        correoContactoE:req.body.correoContactoE,
        direccionContactoE:req.body.direccionContactoE,
        telefonoContactoE:req.body.telefonoContactoE,
        zona:req.body.zona,
        edad:req.body.edad,
        ultimoAno:req.body.ultimoAno
    });

    Paciente.create(paciente,(err,data)=>{
        if (err) {
            res.status(500).send({
                message: err.message || "Some error occurred while creating the Evento."
            });
        } else {
            res.send(data);
        }
    });
};

exports.findAll=(req,res)=>{

    const title=req.query.cedula;

    Paciente.getAll(title,(err,data)=>{
        if (err) {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving events."
            });
        } else {
            res.send(data);
        }
    });
};



exports.findAllCombo=(req,res)=>{

   

    Paciente.getAllCombo((err,data)=>{
        if (err) {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving events."
            });
        } else {
            res.send(data);
        }
    });
};


exports.delete = (req, res) => {
    Paciente.remove(req.params.id, (err, data) => {
        if (err) {
          if (err.kind === "not_found") {
            res.status(404).send({
              message: `Not found Patient with id ${req.params.id}.`
            });
          } else {
            res.status(500).send({
              message: "Could not delete Patient with id " + req.params.id
            });
          }
        } else res.send(data);
      });
};

exports.findOne=(req,res)=>{
    Paciente.findById(req.params.id,(err,data)=>{
        if (err) {
            if (err.kind=="not_found") {
                res.status().send({
                    message: `Not found Tutorial with id ${req.params.id}.`
                });
            } else {
                res.status(500).send({
                    message:"Erro retrieving Evento with id "+req.params.id
                });
            }
        } else {
            res.send(data);
        }
    });
};
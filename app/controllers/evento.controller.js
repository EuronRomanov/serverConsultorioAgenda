const Evento=require("../models/evento.model.js");

exports.create=(req,res)=>{
    if (!req.body) {
        res.status(400).send({
            message:"Content cant empty!"
        });
    }


   
    let fecha=req.body.fecha.split('T')[0];
    let inicio=fecha+"T"+req.body.horaInicio+":00";
    let fin=fecha+"T"+req.body.horaFin+":00";

    
    const evento=new Evento({
      codPaciente:req.body.codPaciente.value,
       start:inicio,
      end:fin,
      description:req.body.description
    });


   // console.log(evento);

   /* const evento=new Evento({
        codPaciente:req.body.codPaciente,
        start:req.body.inicio,
        end: req.body.fin,
        description: req.body.descripcion
    });*/

   
    Evento.create(evento,(err,data)=>{
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

    const title=req.query.title;

    Evento.getAll(title,(err,data)=>{
        if (err) {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving events."
            });
        } else {
            res.send(data);
        }
    });
};

function removeDaysToDate(date) {
  var res = new Date(date);
  res.setDate(res.getDate() - 1);
  return res;
}

exports.update = (req, res) => {
  
   // let fecha=req.body.fecha.split('T')[0];
     // let fecha=fechaObjeto.getFullYear()+"-"+(fechaObjeto.getMonth() + 1)+"-"+fechaObjeto.getUTCDate();

   let fechaObjeto=removeDaysToDate(req.body.fecha.split('T')[0]);
   let fecha=fechaObjeto.toISOString().split('T')[0];
  let inicio=fecha+"T"+req.body.horaInicio+":00";
    let fin=fecha+"T"+req.body.horaFin+":00";
    
   
    const evento=new Evento({
      codPaciente:req.body.codPaciente.value,
       start:inicio,
      end:fin,
      description:req.body.description
    });
  
  Evento.updateById(
    req.params.id,
    evento,
    (err, data) => {
      if (err) {
        if (err.kind === "not_found") {
          res.status(404).send({
            message: `Not found Evento with id ${req.params.id}.`
          });
        } else {
          res.status(500).send({
            message: "Error updating Evento with id " + req.params.id
          });
        }
      } else res.send(data);
    }
  );
  


};


exports.delete = (req, res) => {
    Evento.remove(req.params.id, (err, data) => {
        if (err) {
          if (err.kind === "not_found") {
            res.status(404).send({
              message: `Not found Evento with id ${req.params.id}.`
            });
          } else {
            res.status(500).send({
              message: "Could not delete Evento with id " + req.params.id
            });
          }
        } else res.send(data);
      });
};

exports.findOne=(req,res)=>{
    Evento.findById(req.params.id,(err,data)=>{
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
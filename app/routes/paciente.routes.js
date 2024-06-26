module.exports=app=>{
    const pacientes=require("../controllers/paciente.controller.js");
    var router=require("express").Router();

    router.post("/",pacientes.create);

    router.get("/",pacientes.findAll);
    router.get("/comboPacientes",pacientes.findAllCombo);

    router.get("/:id", pacientes.findOne);
    router.delete("/:id", pacientes.delete);
    app.use('/api/pacientes',router);
};
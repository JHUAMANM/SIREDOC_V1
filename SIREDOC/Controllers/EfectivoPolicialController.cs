using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SIREDOC.DB;
using SIREDOC.Models;
using SIREDOC.Repositories;

namespace SIREDOC.Controllers;

[Authorize]
public class EfectivoPolicialController : Controller
{
    private readonly IEfectivoPolicialRepositorio _efectivoPolicialRepositorio;
    private readonly IUnidadPolicialRepositorio _unidadPolicialRepositorio;
    private DbEntities _dbEntities;

    public EfectivoPolicialController(IEfectivoPolicialRepositorio efectivoPolicialRepositorio, IUnidadPolicialRepositorio unidadPolicialRepositorio, DbEntities dbEntities)
    {
        _efectivoPolicialRepositorio = efectivoPolicialRepositorio;
        _unidadPolicialRepositorio = unidadPolicialRepositorio;
        _dbEntities = dbEntities;
    }
    [HttpGet]
    public IActionResult Index()
    {

        
        //var items = _dbEntities.EfectivoPolicials.Where(o => o.Id == o.Id).ToList();
        
        //var items = _efectivoPolicialRepositorio.ObtenerTodos();
        var unidades = _efectivoPolicialRepositorio.ObtenerEfectivosTodos();
        
        return View(unidades);
    }
    
    [HttpGet]
    public IActionResult Create()
    {
        ViewBag.Unidad = _unidadPolicialRepositorio.ObtenerTodos();
        return View(new EfectivoPolicial());
    }
    
    [HttpPost]
    public IActionResult Create(EfectivoPolicial efectivos)
    {

         
        // _dbEntities.EfectivoPolicials.Add(efectivos);
        // _dbEntities.SaveChanges();
        
        if (efectivos.UnidadId > 6 || efectivos.UnidadId < 1)
        {
            ModelState.AddModelError("UnidadId", "La unidad policial no existe");
        }

        if (!ModelState.IsValid)
        {
            // ViewBag.Policia = _dbEntities.EfectivoPolicials.ToList();
            ViewBag.Unidad = _unidadPolicialRepositorio.ObtenerTodos();
            return View("Create", efectivos);
        }

        _efectivoPolicialRepositorio.GuardarEfectivo(efectivos);
        
        return RedirectToAction("Index");
    }
    
    [HttpGet]
    public IActionResult Edit(int id)
    {
        // var efectivo = _dbEntities.EfectivoPolicials.First(o => o.Id == id); 
        // ViewBag.Policia = _dbEntities.EfectivoPolicials.ToList();

        var efectivo = _efectivoPolicialRepositorio.ObtenerEfectivoPorId(id);
        ViewBag.Unidad = _unidadPolicialRepositorio.ObtenerTodos();
        return View(efectivo);
    }
    
    [HttpPost]
    public IActionResult Edit(int id, EfectivoPolicial efectivos)
    {
        if (!ModelState.IsValid) {
            ViewBag.Persona = _dbEntities.UnidadPolicials.ToList();
            return View("Edit", efectivos);
        }
        // var efectivoDB = _dbEntities.EfectivoPolicials.First(o => o.Id == id);
        // efectivoDB.Nombre = efectivos.Nombre;
        // efectivoDB.Telefono = efectivos.Telefono;
        // efectivoDB.Correo = efectivos.Correo;
        // _dbEntities.SaveChanges();
        
        _efectivoPolicialRepositorio.EditarEfectivoPorId(id, efectivos);
        
        return RedirectToAction("Index");
    }
    
    [HttpGet]
    public IActionResult Delete(int id)
    {
        // var efectivoDB = _dbEntities.EfectivoPolicials.First(o => o.Id == id);
        // _dbEntities.EfectivoPolicials.Remove(efectivoDB);
        // _dbEntities.SaveChanges();
        
        _efectivoPolicialRepositorio.DeleteEfectivo(id);

        return RedirectToAction("Index");
    }
    
}
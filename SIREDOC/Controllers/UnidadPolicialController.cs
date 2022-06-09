using Microsoft.AspNetCore.Mvc;
using SIREDOC.DB;
using SIREDOC.Models;
using SIREDOC.Repositories;

namespace SIREDOC.Controllers;

public class UnidadPolicialController : Controller
{
    private readonly IUnidadPolicialRepositorio _unidadPolicialRepositorio;
    private DbEntities _dbEntities;

    public UnidadPolicialController(IUnidadPolicialRepositorio unidadPolicialRepositorio, DbEntities dbEntities)
    {
        _unidadPolicialRepositorio = unidadPolicialRepositorio;
        _dbEntities = dbEntities;
    }
    [HttpGet]
    public IActionResult Index()
    {
        //var items = _dbEntities.UnidadPolicials.Where(o => o.IdUnidad == o.IdUnidad).ToList();
        var items = _unidadPolicialRepositorio.ObtenerTodos();
        
        return View(items);
    }
    
    [HttpGet]
    public IActionResult Create()
    {
        //ViewBag.Unidad = _dbEntities.UnidadPolicials;
        ViewBag.Unidad = _unidadPolicialRepositorio.ObtenerTodos();
        return View(new UnidadPolicial());
    }
    
    [HttpPost]
    public IActionResult Create(UnidadPolicial unidades)
    {
        if (!ModelState.IsValid)
        {
            ViewBag.Unidad = _unidadPolicialRepositorio.ObtenerTodos();
            return View("Create", unidades);
        }

        // unidades.IdUnidad = unidades.IdUnidad;
        //
        // _dbEntities.UnidadPolicials.Add(unidades);
        // _dbEntities.SaveChanges();
        
        _unidadPolicialRepositorio.GuardarUnidad(unidades);

        return RedirectToAction("Index");
    }
    
    [HttpGet]
    public IActionResult Edit(int id)
    {
        //var unidad = _dbEntities.UnidadPolicials.First(o => o.IdUnidad == id); 
        //ViewBag.Unidad = _dbEntities.UnidadPolicials.ToList();

        var unidad = _unidadPolicialRepositorio.ObtenerUnidadPorId(id);
        ViewBag.Unidad = _unidadPolicialRepositorio.ObtenerTodos();
        
        return View(unidad);
    }
    
    [HttpPost]
    public IActionResult Edit(int id, UnidadPolicial unidad)
    {
        if (!ModelState.IsValid) {
            ViewBag.Unidad = _dbEntities.UnidadPolicials.ToList();
            return View("Edit", unidad);
        }
        // var unidadDB = _dbEntities.UnidadPolicials.First(o => o.IdUnidad == id);
        // unidadDB.Nombre = unidad.Nombre;
        // unidadDB.Tipo = unidad.Tipo;
        
        //_dbEntities.SaveChanges();

        _unidadPolicialRepositorio.EditarUnidadPorId(id, unidad);
        
        return RedirectToAction("Index");
    }
    
    [HttpGet]
    public IActionResult Delete(int id)
    {
        // var unidadDB = _dbEntities.UnidadPolicials.First(o => o.IdUnidad == id);
        // _dbEntities.UnidadPolicials.Remove(unidadDB);
        // _dbEntities.SaveChanges();
        
        _unidadPolicialRepositorio.DeleteUnidad(id);

        return RedirectToAction("Index");
    }
}
using Microsoft.AspNetCore.Mvc;
using SIREDOC.DB;
using SIREDOC.Models;

namespace SIREDOC.Controllers;

public class UnidadPolicialController : Controller
{
    private DbEntities _dbEntities;

    public UnidadPolicialController(DbEntities dbEntities)
    {
        _dbEntities = dbEntities;
    }
    [HttpGet]
    public IActionResult Index()
    {
        var items = _dbEntities.UnidadPolicials
            .Where(o => o.IdUnidad == o.IdUnidad).ToList();
        
        return View(items);
    }
    
    [HttpGet]
    public IActionResult Create()
    {
        ViewBag.Unidad = _dbEntities.UnidadPolicials;
        return View(new UnidadPolicial());
    }
    
    [HttpPost]
    public IActionResult Create(UnidadPolicial unidades)
    {

        unidades.IdUnidad = unidades.IdUnidad;
        
        _dbEntities.UnidadPolicials.Add(unidades);
        _dbEntities.SaveChanges();

        return RedirectToAction("Index");
    }
    
    [HttpGet]
    public IActionResult Edit(int id)
    {
        var unidad = _dbEntities.UnidadPolicials.First(o => o.IdUnidad == id); 
        ViewBag.Unidad = _dbEntities.UnidadPolicials.ToList();
        return View(unidad);
    }
    
    [HttpPost]
    public IActionResult Edit(int id, UnidadPolicial unidad)
    {
        if (!ModelState.IsValid) {
            ViewBag.Unidad = _dbEntities.UnidadPolicials.ToList();
            return View("Edit", unidad);
        }
        var unidadDB = _dbEntities.UnidadPolicials.First(o => o.IdUnidad == id);
        unidadDB.Nombre = unidad.Nombre;
        unidadDB.Tipo = unidad.Tipo;
        
        _dbEntities.SaveChanges();
        
        return RedirectToAction("Index");
    }
    
    [HttpGet]
    public IActionResult Delete(int id)
    {
        var unidadDB = _dbEntities.UnidadPolicials.First(o => o.IdUnidad == id);
        _dbEntities.UnidadPolicials.Remove(unidadDB);
        _dbEntities.SaveChanges();

        return RedirectToAction("Index");
    }
}
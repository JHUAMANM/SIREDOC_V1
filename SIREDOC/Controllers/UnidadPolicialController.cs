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
        
        var items = _unidadPolicialRepositorio.ObtenerTodos();
        
        return View(items);
    }
    
    [HttpGet]
    public IActionResult Create()
    {
        ViewBag.Unidad = _unidadPolicialRepositorio.ObtenerTodos();
        return View(new UnidadPolicial());
    }
    
    [HttpPost]
    public IActionResult Create(UnidadPolicial unidades)
    {
        var cuentas = _dbEntities.UnidadPolicials.Where(o => o.Nombre == unidades.Nombre).Count();

        if (cuentas > 0)
        {
            ModelState.AddModelError("Nombre", "Nombre de la unidad ya existe");
        }
        
        if (!ModelState.IsValid)
        {
            ViewBag.Unidad = _unidadPolicialRepositorio.ObtenerTodos();
            return View("Create", unidades);
        }
        if (!ModelState.IsValid)
        {
           ViewBag.TipoDeCuentas = _unidadPolicialRepositorio.ObtenerTodos();
            return View("Create", unidades);
        }

        _unidadPolicialRepositorio.GuardarUnidad(unidades);
        TempData["SuccessMessage"] = "Unidad agregada correctamente";
        return RedirectToAction("Index");
    }
    
    [HttpGet]
    public IActionResult Edit(int id)
    {
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
       
        _unidadPolicialRepositorio.EditarUnidadPorId(id, unidad);
        TempData["SuccessMessage"] = "Unidad editada correctamente";
        return RedirectToAction("Index");
    }
    
    [HttpGet]
    public IActionResult Delete(int id)
    {
       
        _unidadPolicialRepositorio.DeleteUnidad(id);
        TempData["SuccessMessage"] = "Unidad eliminada correctamente";
        return RedirectToAction("Index");
    }
}
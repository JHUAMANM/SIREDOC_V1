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

        if (efectivos.UnidadId > 6 || efectivos.UnidadId < 1)
        {
            ModelState.AddModelError("UnidadId", "La unidad policial no existe");
        }

        if (!ModelState.IsValid)
        {
            ViewBag.Unidad = _unidadPolicialRepositorio.ObtenerTodos();
            return View("Create", efectivos);
        }

        _efectivoPolicialRepositorio.GuardarEfectivo(efectivos);
        TempData["SuccessMessage"] = "Efectivo guardado correctamente";
        return RedirectToAction("Index");
    }
    
    [HttpGet]
    public IActionResult Edit(int id)
    {
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
        
        _efectivoPolicialRepositorio.EditarEfectivoPorId(id, efectivos);
        TempData["SuccessMessage"] = "Efectivo editado correctamente";
        return RedirectToAction("Index");
    }
    
    [HttpGet]
    public IActionResult Delete(int id)
    {
        _efectivoPolicialRepositorio.DeleteEfectivo(id);
        TempData["SuccessMessage"] = "Efectivo eliminado correctamente";
        return RedirectToAction("Index");
    }
    
}
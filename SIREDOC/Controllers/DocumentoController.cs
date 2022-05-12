using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SIREDOC.DB;
using SIREDOC.Models;
using SIREDOC.Repositories;

namespace SIREDOC.Controllers;

[Authorize]
public class DocumentoController: Controller
{
    private readonly IEfectivoPolicialRepositorio _efectivoPolicialRepositorio;
    private readonly IDocumentoRepositorio _documentoRepositorio;
    private readonly IUsuarioRepositorio _usuarioRepositorio;
    private DbEntities _dbEntities;

    public DocumentoController(IEfectivoPolicialRepositorio efectivoPolicialRepositorio, IDocumentoRepositorio documentoRepositorio, IUsuarioRepositorio usuarioRepositorio,
       DbEntities dbEntities)
    {
        _efectivoPolicialRepositorio = efectivoPolicialRepositorio;
        _documentoRepositorio = documentoRepositorio;
        _usuarioRepositorio = usuarioRepositorio;
        _dbEntities = dbEntities;
    }
    
    [HttpGet]
    public IActionResult Index()
    {
        var usuario = GetLoggedUser();
        //var documentos = _dbEntities.Documentos
        var documentos = _documentoRepositorio.ObtenerDocumentosDeUsuario(usuario.Id);
        ViewBag.Total = documentos.Any() ? documentos.Sum(o => o.UsuarioId) : 0; 
        
        return View(documentos);
    }
    
    [HttpGet]
    public IActionResult Create()
    {
        ViewBag.Policia = _efectivoPolicialRepositorio.ObtenerTodos();
        return View(new Documento());
    }

    [HttpPost]
    public IActionResult Create(Documento documento)
    {
        documento.UsuarioId = GetLoggedUser().Id;
        
        if (documento.EfectivoId > 11 || documento.EfectivoId < 1)
        {
            ModelState.AddModelError("EfectivoId", "El efectivo policial no existe");
        }

        if (!ModelState.IsValid)
        {
            ViewBag.Policia = _dbEntities.EfectivoPolicials.ToList();
            //ViewBag.Policia = _efectivoPolicialRepositorio.ObtenerTodos();
            return View("Create", documento);
        }
        
        _dbEntities.Documentos.Add(documento);
        _dbEntities.SaveChanges();
        //_documentoRepositorio.GuardarDocumento(documento);
        
        return RedirectToAction("Index");

    }
    
    
    [HttpGet]
    public IActionResult Edit(int id)
    {
        var documento = _documentoRepositorio.GetEditarDocumentoPorId(id);
        ViewBag.Policia = _efectivoPolicialRepositorio.ObtenerTodos();
        return View(documento);
    }
    
    [HttpPost]
    public IActionResult Edit(int id, Documento documento)
    {
        if (!ModelState.IsValid) {
            ViewBag.Policia = _dbEntities.EfectivoPolicials.ToList();
            return View("Edit", documento);
        }
        
        // var documentoDB = _dbEntities.Documentos.First(o => o.Id == id);
        // documentoDB.Tipo = documento.Tipo;
        // documentoDB.Observaciones = documento.Observaciones;
        
        _documentoRepositorio.PostEditarCuentaPorId(id,documento);
        
        return RedirectToAction("Index");
    }
    
    [HttpGet]
    public IActionResult Delete(int id)
    {
        // var documentoDB = _dbEntities.Documentos.First(o => o.Id == id);
        // _dbEntities.Documentos.Remove(documentoDB);
        // _dbEntities.SaveChanges();
        
        _documentoRepositorio.DeleteDocPorId(id);

        return RedirectToAction("Index");
    }
    
   private Usuario GetLoggedUser()
    {
        var claim = HttpContext.User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Name);
        var username = claim.Value;
        //return _dbEntities.Usuarios.First(o => o.Username == username);
       return _usuarioRepositorio.ObtenerLoggedUser(username);

    }
}
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SIREDOC.Constantes;
using SIREDOC.DB;
using SIREDOC.DB.Mapping;
using SIREDOC.Models;
using SIREDOC.Repositories;

namespace SIREDOC.Controllers;

[Authorize]
public class DocumentoController: Controller
{
    private readonly IWebHostEnvironment _environment;
    private readonly IEfectivoPolicialRepositorio _efectivoPolicialRepositorio;
    private readonly IDocumentoRepositorio _documentoRepositorio;
    private readonly IUsuarioRepositorio _usuarioRepositorio;
    private DbEntities _dbEntities;

    public DocumentoController(IEfectivoPolicialRepositorio efectivoPolicialRepositorio, IDocumentoRepositorio documentoRepositorio, IUsuarioRepositorio usuarioRepositorio,
        IWebHostEnvironment environment, DbEntities dbEntities)
    {
        _efectivoPolicialRepositorio = efectivoPolicialRepositorio;
        _documentoRepositorio = documentoRepositorio;
        _usuarioRepositorio = usuarioRepositorio;
        _environment = environment;
        _dbEntities = dbEntities;
    }
    
    [HttpGet]
    public IActionResult Index(string buscar)
    {

        var usuario = GetLoggedUser();
        var documentos = _documentoRepositorio.ObtenerDocumentosDeUsuario(usuario.Id, buscar);
        
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
        Upload(documento.Archivo);
        documento.UsuarioId = GetLoggedUser().Id;
        
        if (documento.EfectivoId > 11 || documento.EfectivoId < 1)
        {
            ModelState.AddModelError("EfectivoId", "El efectivo policial no existe");
        }

        if (!ModelState.IsValid)
        {
            ViewBag.Policia = _efectivoPolicialRepositorio.ObtenerTodos();
            return View("Create", documento);
        }

        documento.Estado = ESTADO.POR_ATENDER;
        _documentoRepositorio.GuardarDocumento(documento);

        TempData["SuccessMessage"] = "Documento guardado correctamente";
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
        
        
        _documentoRepositorio.PostEditarDocumentoPorId(id,documento);
        TempData["SuccessMessage"] = "Documento editado correctamente";
        return RedirectToAction("Index");
    }
    
    [HttpGet]
    public IActionResult Delete(int id)
    {
        
        _documentoRepositorio.DeleteDocPorId(id);
        TempData["SuccessMessage"] = "Documento eliminado correctamente";
        return RedirectToAction("Index");
    }
    
    
    [HttpGet]
    public ActionResult MarcarEnProceso(int documentoId)
    {
        Usuario user = GetLoggedUser();

        _documentoRepositorio.ActualizarEstadoDeDocumento(documentoId, user.Id);

        TempData["SuccessMessage"] = "Documento en proceso";

        return RedirectToAction("Index");
    }

    [HttpGet]
    public ActionResult MarcarComoAtendido(int documentoId)
    {
        Usuario user = GetLoggedUser();

        _documentoRepositorio.MarcarAtendidoEstado(documentoId, user.Id);

        TempData["SuccessMessage"] = "Documento Atendido";


        return RedirectToAction("Index");
    }
   private Usuario GetLoggedUser()
    {
        
        var claim = HttpContext.User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Name);
        var username = claim.Value;
        
       return _usuarioRepositorio.ObtenerLoggedUser(username);

    }
   
  public async Task<IActionResult> Upload(string path)
   {
      
       string sourceFile = System.IO.Path.Combine("C:\\Users\\YoelitoHM\\Documents\\Archivos Escaneados", path);

       string destinationFile = System.IO.Path.Combine(_environment.ContentRootPath, "Uploads", path);

       if (!System.IO.Directory.Exists("Uploads"))
       {
           System.IO.Directory.CreateDirectory("Uploads");
       }
       System.IO.File.Copy(sourceFile, destinationFile);

       Console.WriteLine(sourceFile);
       return RedirectToAction("Index");
   }

}
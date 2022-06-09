using System.Collections.Generic;
using System.Security.Claims;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Moq;
using NUnit.Framework;
using SIREDOC.Controllers;
using SIREDOC.Models;
using SIREDOC.Repositories;

namespace SIREDOCTest.Controllers;

public class DocumentoControllerTest
{
    [Test]
    public void IndexControllerCaso01()
    {
       var mockClaimsPrincipal = new Mock<ClaimsPrincipal>();
        mockClaimsPrincipal.Setup(o => o.Claims).Returns(new List<Claim> { new Claim(ClaimTypes.Name, "admin") });
        
        var mockContex = new Mock<HttpContext>();
        mockContex.Setup(o => o.User).Returns(mockClaimsPrincipal.Object);
        
        var mockUsuarioRepo = new Mock<IUsuarioRepositorio>();
        mockUsuarioRepo.Setup(o => o.ObtenerLoggedUser("admin")).Returns(new Usuario());

        var mockDocumentoRepo = new Mock<IDocumentoRepositorio>();
        
        var controller = new DocumentoController(null, mockDocumentoRepo.Object, mockUsuarioRepo.Object, null, null);

        controller.ControllerContext = new ControllerContext()
        {
            HttpContext = mockContex.Object
        };

        var view = controller.Index();
        
        Assert.IsNotNull(view);
        
    }

    

    [Test]
    public void GetCrearViewCaso01()
    {
        var mockEfectivoRepositorio = new Mock<IEfectivoPolicialRepositorio>();
        mockEfectivoRepositorio.Setup(o => o.ObtenerTodos()).Returns(new List<EfectivoPolicial>());
            
        var controller = new DocumentoController(mockEfectivoRepositorio.Object, null, null, null, null);

        var view = controller.Create();
        
        Assert.IsNotNull(view);
    }
    

    [Test]
    public void PostCrearViewCaso01()
    {
       var mockClaimsPrincipal = new Mock<ClaimsPrincipal>();
        mockClaimsPrincipal.Setup(o => o.Claims).Returns(new List<Claim> { new Claim(ClaimTypes.Name, "admin") });
        
        var mockContex = new Mock<HttpContext>();
        mockContex.Setup(o => o.User).Returns(mockClaimsPrincipal.Object);
        
        var mockUsuarioRepo = new Mock<IUsuarioRepositorio>();
        mockUsuarioRepo.Setup(o => o.ObtenerLoggedUser("admin")).Returns(new Usuario());

        var mockDocumentoRepositorio = new Mock<IDocumentoRepositorio>();
        
        var controller = new DocumentoController(null, mockDocumentoRepositorio.Object, mockUsuarioRepo.Object, null, null);

        controller.ControllerContext = new ControllerContext()
        {
            HttpContext = mockContex.Object
        };
        
        var view = controller.Create((new Documento() { EfectivoId = 2 }));
        
        Assert.IsNotNull(view);
        
        Assert.IsInstanceOf<RedirectToActionResult>(view);
    } 
    
    
    [Test]
    public void EditGetCaso01()
    {
        var mockEfectivoRepositorio = new Mock<IEfectivoPolicialRepositorio>();
        var mockDocumentoRepositorio = new Mock<IDocumentoRepositorio>();
        mockDocumentoRepositorio.Setup(o => o.GetEditarDocumentoPorId(2)).Returns(new Documento
        {
            Id = 1, Tipo = "Oficio", Numero = "283-2022", Asunto = "HOLA",
            Asignado = "Teran", Observaciones = "SIN NOVEDAD"
        });
        var controller = new DocumentoController(mockEfectivoRepositorio.Object, mockDocumentoRepositorio.Object, null, null, null);

        var view = controller.Edit(2);
    }
    
    
    [Test]
    public void postEditControllercaso01()
    {
        var mockEfectivoRepositorio = new Mock<IEfectivoPolicialRepositorio>();
        var mockDocumentoRepositorio = new Mock<IDocumentoRepositorio>();
        
        var controller = new DocumentoController(mockEfectivoRepositorio.Object, mockDocumentoRepositorio.Object, null, null, null);

        var view = controller.Edit(2, new Documento());
        
        Assert.IsNotNull(view);
    }

    [Test]
    public void DeleteDocumentoCaso()
    {
        var mockEfectivoRepositorio = new Mock<IEfectivoPolicialRepositorio>();
        var mockDocumentoRepositorio = new Mock<IDocumentoRepositorio>();
        
        var controller = new DocumentoController(mockEfectivoRepositorio.Object, mockDocumentoRepositorio.Object,null, null, null);

        var view = controller.Delete(2);
        
        Assert.IsNotNull(view);
    }
    
    
    
}
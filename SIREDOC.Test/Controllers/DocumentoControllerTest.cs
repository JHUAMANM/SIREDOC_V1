using System.Collections.Generic;
using System.Security.Claims;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Moq;
using NUnit.Framework;
using SIREDOC.Controllers;
using SIREDOC.Models;
using SIREDOC.Repositories;

namespace SIREDOC.Test.Controllers;

public class DocumentoControllerTest
{
    [Test]
    public void IndexControllerCaso01()
    {
       /* var mockClaimsPrinvcipal = new Mock<ClaimsPrincipal>();
        mockClaimsPrinvcipal.Setup(o => o.Claims).Returns(new List<Claim> { new Claim(ClaimTypes.Name, "admin") });
        
        var mockContex = new Mock<HttpContext>();
        mockContex.Setup(o => o.User).Returns(mockClaimsPrinvcipal.Object);

        var mockDocumentoRepositorio = new Mock<IDocumentoRepositorio>();
        mockDocumentoRepositorio.Setup(o => o.ObtenerDocumentosDeUsuario(1)).Returns(new List<Documento>
        {
            new Documento()
        });
            
        var controller = new DocumentoController(null, mockDocumentoRepositorio.Object, null, null);

        controller.ControllerContext = new ControllerContext()
        {
            HttpContext = mockContex.Object
        };

        var view = (ViewResult)controller.Index();
        
        Assert.IsNotNull(view);
        Assert.AreEqual(1, ((List<Documento>) view.Model).Count);*/
    }

    

    [Test]
    public void GetCrearViewCaso01()
    {
        var mockEfectivoRepositorio = new Mock<IEfectivoPolicialRepositorio>();
        mockEfectivoRepositorio.Setup(o => o.ObtenerTodos()).Returns(new List<EfectivoPolicial>());
            
        var controller = new DocumentoController(mockEfectivoRepositorio.Object, null, null);

        var view = controller.Create();
        
        Assert.IsNotNull(view);
    }
    

    [Test]
    public void PostCrearViewCaso01()
    {
       /* var mockClaimsPrincipal = new Mock<ClaimsPrincipal>();
        mockClaimsPrincipal.Setup(o => o.Claims).Returns(new List<Claim> { new Claim(ClaimTypes.Name, "admin") });
        
        var mockContex = new Mock<HttpContext>();
        mockContex.Setup(o => o.User).Returns(mockClaimsPrincipal.Object);

        var mockDocumentoRepositorio = new Mock<IDocumentoRepositorio>();
        
        var controller = new DocumentoController(null, mockDocumentoRepositorio.Object, null);

        controller.ControllerContext = new ControllerContext()
        {
            HttpContext = mockContex.Object
        };
        
        var view = controller.Create((new Documento() { EfectivoId = 2 }));
        
        Assert.IsNotNull(view);
        
        Assert.IsInstanceOf<RedirectToActionResult>(view);*/
    }  
    
    
    [Test]
    public void EditGetCaso01()
    {
        var mockEfectivoRepositorio = new Mock<IEfectivoPolicialRepositorio>();
        var mockDocumentoRepositorio = new Mock<IDocumentoRepositorio>();
        mockDocumentoRepositorio.Setup(o => o.GetEditarDocumentoPorId(2)).Returns(new Documento
        {
            Id = 1, Tipo = "Oficio", Numero = "283-2022", Asunto = "HOLA",
            Entregado = "31421205", Asignado = "31521206", Observaciones = "ATENDIDO"
        });
        var controller = new DocumentoController(mockEfectivoRepositorio.Object, mockDocumentoRepositorio.Object, null);

        var view = controller.Edit(2);
    }
    
    
    [Test]
    public void postEditControllercaso01()
    {
        var mockEfectivoRepositorio = new Mock<IEfectivoPolicialRepositorio>();
        var mockDocumentoRepositorio = new Mock<IDocumentoRepositorio>();
        
        var controller = new DocumentoController(mockEfectivoRepositorio.Object, mockDocumentoRepositorio.Object, null);

        var view = controller.Edit(2, new Documento());
        
        Assert.IsNotNull(view);
    }

    [Test]
    public void DeleteDocumentoCaso()
    {
        var mockEfectivoRepositorio = new Mock<IEfectivoPolicialRepositorio>();
        var mockDocumentoRepositorio = new Mock<IDocumentoRepositorio>();
        
        var controller = new DocumentoController(mockEfectivoRepositorio.Object, mockDocumentoRepositorio.Object,null);

        var view = controller.Delete(2);
        
        Assert.IsNotNull(view);
    }
    
    
    
}
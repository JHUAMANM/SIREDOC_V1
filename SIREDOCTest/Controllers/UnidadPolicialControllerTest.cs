using System.Collections.Generic;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Moq;
using NUnit.Framework;
using SIREDOC.Controllers;
using SIREDOC.Models;
using SIREDOC.Repositories;

namespace SIREDOCTest.Controllers;

public class UnidadPolicialControllerTest
{
    [Test]

    public void TestIndexUnidadCaso01()
    {
        var mockUnidadRepositorio = new Mock<IUnidadPolicialRepositorio>();
        var controller = new UnidadPolicialController(mockUnidadRepositorio.Object, null);

        var view = controller.Index();
        
        Assert.IsNotNull(view);
    }
    [Test]
    public void TestGetCreateUnidadCaso01()
    {
        var mockUnidadRepositorio = new Mock<IUnidadPolicialRepositorio>();
        mockUnidadRepositorio.Setup(o => o.ObtenerTodos()).Returns(new List<UnidadPolicial>());
        var controller = new UnidadPolicialController(mockUnidadRepositorio.Object, null);

        var view = controller.Create();
        
        Assert.IsNotNull(view);
    }
    
    [Test]
    public void PostTestCreateUnidadCaso01()
    {
        var mockUnidadRepositorio = new Mock<IUnidadPolicialRepositorio>();
        mockUnidadRepositorio.Setup(o => o.GuardarUnidad(new UnidadPolicial()));
        mockUnidadRepositorio.Setup(o => o.ContarPorNombre(new UnidadPolicial())).Returns(1);
        
        var httpContext = new DefaultHttpContext();
        var tempData = new TempDataDictionary(httpContext, Mock.Of<ITempDataProvider>());
        tempData["SuccessMessage"] = "correcto";
        
        var controller = new UnidadPolicialController(mockUnidadRepositorio.Object, null)
        {
            TempData = tempData
        };
        
        
        var view = controller.Create(new UnidadPolicial()
            {Nombre = "UNICII", Tipo = "OPERATIVA", Direccion = "Jr. 13 Julio", Correo = "pnp@gmail.com",Telefono = "957456321"});

        Assert.IsNotNull(view);
        Assert.IsInstanceOf<RedirectToActionResult>(view);
    }
    
    
    
    
    
    [Test]
    public void TestGetEditUnidadCaso01()
    {
        var mockUnidadRepositorio = new Mock<IUnidadPolicialRepositorio>();
        
        mockUnidadRepositorio.Setup(o => o.ObtenerUnidadPorId(2)).Returns(new UnidadPolicial());
        var controller = new UnidadPolicialController(mockUnidadRepositorio.Object, null);

        var view = (ViewResult) controller.Edit(2);
        
        Assert.IsNotNull(view.Model);
        Assert.IsNotNull(view);
    }

    [Test]
    public void PostEditEfectivoCaso01()
    {
        
        var mockUnidadRepositorio = new Mock<IUnidadPolicialRepositorio>();
        
        mockUnidadRepositorio.Setup(o => o.ObtenerUnidadPorId(2)).Returns(new UnidadPolicial
        {
            Nombre = "UNICII", Tipo = "OPERATIVA", Direccion = "Jr 13 Julio", Correo = "pnp@gmail.com",Telefono = "957456321"
        });
      
        var controller = new UnidadPolicialController(mockUnidadRepositorio.Object, null);

        var view = (ViewResult) controller.Edit(2);
        
        Assert.IsNotNull(view.Model);
        Assert.IsNotNull(view);
    }

    [Test]
    public void DeleteEfectivoCaso01()
    {
        var mockUnidadRepositorio = new Mock<IUnidadPolicialRepositorio>();
        mockUnidadRepositorio.Setup(o => o.DeleteUnidad(2));
        
        var httpContext = new DefaultHttpContext();
        var tempData = new TempDataDictionary(httpContext, Mock.Of<ITempDataProvider>());
        tempData["SuccessMessage"] = "correcto";
        
        var controller = new UnidadPolicialController(mockUnidadRepositorio.Object, null)
        {
            TempData = tempData
        };

        var view = controller.Delete(2);

        Assert.IsNotNull(view);
        
    }
    
}
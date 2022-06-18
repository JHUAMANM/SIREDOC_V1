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

public class EfectivoPolicialControllerTest
{
    [Test]
    public void TestIndexEfectivoCaso01()
    {
        var mockEfectivoRepositorio = new Mock<IEfectivoPolicialRepositorio>();
        var mockUnidadRepositorio = new Mock<IUnidadPolicialRepositorio>();
       
        var httpContext = new DefaultHttpContext();
        var tempData = new TempDataDictionary(httpContext, Mock.Of<ITempDataProvider>());
        tempData["SuccessMessage"] = "correcto";
        var controller = new EfectivoPolicialController(mockEfectivoRepositorio.Object, mockUnidadRepositorio.Object, null)
        {
            TempData = tempData
        };

        var view = controller.Index();
        
        Assert.IsNotNull(view);
    }

    [Test]
    public void TestCreateEfectivoCaso01()
    {
        var mockEfectivoRepositorio = new Mock<IEfectivoPolicialRepositorio>();
        mockEfectivoRepositorio.Setup(o => o.ObtenerTodos()).Returns(new List<EfectivoPolicial>());
        var mockUnidadRepositorio = new Mock<IUnidadPolicialRepositorio>();
        
        var controller = new EfectivoPolicialController(mockEfectivoRepositorio.Object, mockUnidadRepositorio.Object, null);

        var view = controller.Create();
        
        Assert.IsNotNull(view);
    }

    [Test]
    public void PostTestCreateCaso01()
    {
        
        var mockEfectivoRepositorio = new Mock<IEfectivoPolicialRepositorio>();
        var mockUnidadRepositorio = new Mock<IUnidadPolicialRepositorio>();
        var controller = new EfectivoPolicialController(mockEfectivoRepositorio.Object, mockUnidadRepositorio.Object, null);
        
        
        var view = controller.Create(new EfectivoPolicial()
            {Nombre = "Luis", Apellidos = "Perez Alvarez", Cip = "32323232", Correo = "mail@gmail.com",Telefono = "987456321"});

        Assert.IsNotNull(view);
    }

    [Test]
    public void TestEditEfectivoCaso01()
    {
        var mockEfectivoRepositorio = new Mock<IEfectivoPolicialRepositorio>();
        mockEfectivoRepositorio.Setup(o => o.ObtenerEfectivoPorId(2)).Returns(new EfectivoPolicial());
        
        var mockUnidadRepositorio = new Mock<IUnidadPolicialRepositorio>();
        var controller = new EfectivoPolicialController(mockEfectivoRepositorio.Object, mockUnidadRepositorio.Object, null);

        var view = (ViewResult) controller.Edit(2);
        
        Assert.IsNotNull(view.Model);
        Assert.IsNotNull(view);
    }

    [Test]
    public void PostEditEfectivoCaso01()
    {
        var mockEfectivoRepositorio = new Mock<IEfectivoPolicialRepositorio>();
        var mockUnidadRepositorio = new Mock<IUnidadPolicialRepositorio>();
        
        var httpContext = new DefaultHttpContext();
        var tempData = new TempDataDictionary(httpContext, Mock.Of<ITempDataProvider>());
        tempData["SuccessMessage"] = "correcto";
        
        var controller = new EfectivoPolicialController(mockEfectivoRepositorio.Object, mockUnidadRepositorio.Object, null)
        {
            TempData = tempData
        };

        var view = controller.Edit(2, new EfectivoPolicial{
            
            Nombre = "Maloni", Apellidos = "Infante Estela", Cip = "30303030", Correo = "ali@gmail.com",
            Telefono = "900800200"
        });
        
        Assert.IsNotNull(view);
    }

    [Test]
    public void DeleteEfectivoCaso01()
    {
        var mockEfectivoRepositorio = new Mock<IEfectivoPolicialRepositorio>();
        mockEfectivoRepositorio.Setup(o => o.DeleteEfectivo(2));
        var mockUnidadRepositorio = new Mock<IUnidadPolicialRepositorio>();
        
        var httpContext = new DefaultHttpContext();
        var tempData = new TempDataDictionary(httpContext, Mock.Of<ITempDataProvider>());
        tempData["SuccessMessage"] = "correcto";
        
        var controller = new EfectivoPolicialController(mockEfectivoRepositorio.Object, mockUnidadRepositorio.Object, null)
        {
            TempData = tempData
        };

        var view = controller.Delete(2);
        
        Assert.IsNotNull(view);
    }
}
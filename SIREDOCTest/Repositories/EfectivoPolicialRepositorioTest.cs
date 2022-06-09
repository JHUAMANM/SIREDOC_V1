using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Components.Forms;
using Moq;
using NUnit.Framework;
using SIREDOC.DB;
using SIREDOC.Models;
using SIREDOC.Repositories;
using SIREDOCTest.Helpers;

namespace SIREDOCTest.Repositories;

public class EfectivoPolicialTest
{
    private IQueryable<EfectivoPolicial> data;
    private Mock<DbEntities> mockDB;
  
    [SetUp]
    public void SetUp()
    {
        data = new List<EfectivoPolicial>()
        {
            new(){ Id = 1, Nombre = "Juan", Apellidos = "Diaz", Telefono = "987456321", Correo = "juan@gmai.com"},
            new(){ Id = 2, Nombre = "Jose", Apellidos = "Lopez", Telefono = "963258741", Correo = "jose@gmai.com"},
            new(){ Id = 3, Nombre = "Alexander", Apellidos = "Cruz", Telefono = "985632541", Correo = "alex@gmai.com"},
            new(){ Id = 4, Nombre = "Jhon", Apellidos = "Diaz", Telefono = "957852321", Correo = "jhon@gmai.com"}
        }.AsQueryable();
        
        var mockDbsetEfectivoPolicial = new MockDBSet<EfectivoPolicial>(data);
        mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.EfectivoPolicials).Returns(mockDbsetEfectivoPolicial.Object);

    }

    [Test]
    public void IndexEfectivoRepoCaso01()
    {
        var repositorio = new EfectiPolicialRepositorio(mockDB.Object);
        var result = repositorio.ObtenerTodos();
        
        Assert.AreEqual(4, result.Count);

    }
    
    [Test]
    public void ObtenerPorNombreTestCaso01()
    {
        var repositorio = new EfectiPolicialRepositorio(mockDB.Object);
        var result = repositorio.ObtenerPorNombre("Juan");

        Assert.AreEqual(1, result.Count);
    }
    
    [Test]
    public void ObtenerPorNombreTestCaso02()
    {
        var repositorio = new EfectiPolicialRepositorio(mockDB.Object);
        var result = repositorio.ObtenerPorNombre("Alexander");

        Assert.AreEqual(1, result.Count);
    }
    
    [Test]
    public void ObtenerPorNombreTestCaso03()
    {
        var repositorio = new EfectiPolicialRepositorio(mockDB.Object);
        var result = repositorio.ObtenerPorNombre("Jhon");

        Assert.AreEqual(1, result.Count);
    }
    [Test]
    public void GuardarGetEfectivoPolicialTestCaso01()
    {
        var mockDbsetEfectivoPolicial = new MockDBSet<EfectivoPolicial>(data);
        var mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.EfectivoPolicials).Returns(mockDbsetEfectivoPolicial.Object);
        
        var repositorio = new EfectiPolicialRepositorio(mockDB.Object);
        var result = repositorio.ObtenerTodos();

        Assert.AreEqual(4,result.Count);
        Assert.IsNotNull(result);
    }
    
    [Test]
    public void GuardarPostEfectivoPolicialTestCaso01()
    {
        var mockDbsetEfectivoPolicial = new MockDBSet<EfectivoPolicial>(data);
        var mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.EfectivoPolicials).Returns(mockDbsetEfectivoPolicial.Object);
        
        var repositorio = new EfectiPolicialRepositorio(mockDB.Object);
        
        repositorio.GuardarEfectivo(new EfectivoPolicial(){Id = 1, Nombre = "Maloni", Apellidos = "Infante"});

        Assert.IsNotNull(repositorio);
    }
    
    [Test]
    public void EditarGetEfectivoPolicialTestCaso01()
    {
        var repositorio = new EfectiPolicialRepositorio(mockDB.Object);
        var result = repositorio.ObtenerTodos();

        Assert.AreEqual(4,result.Count);
        Assert.IsNotNull(result);
    }
    
    [Test]
    public void EditarPostEfectivoPolicialTestCaso01()
    {
        var mockDbsetEfectivoPolicial = new MockDBSet<EfectivoPolicial>(data);
        var mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.EfectivoPolicials).Returns(mockDbsetEfectivoPolicial.Object);
        
        var repositorio = new EfectiPolicialRepositorio(mockDB.Object);
        
        repositorio.EditarEfectivoPorId(2, new EfectivoPolicial(){Id = 1, Nombre = "Maloni", Apellidos = "Infante"});

        Assert.IsNotNull(repositorio);

    }
    
     
    [Test]
    public void EliminarEfectivoPolicialCaso01()
    {
        var mockDbsetEfectivoPolicial = new MockDBSet<EfectivoPolicial>(data);
        var mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.EfectivoPolicials).Returns(mockDbsetEfectivoPolicial.Object);
        
        var repo = new EfectiPolicialRepositorio(mockDB.Object);

        repo.DeleteEfectivo(1);
        var dataMockEliminar = data.First(o => o.Id == 1);
        mockDbsetEfectivoPolicial.Verify(o => o.Remove(dataMockEliminar), Times.Once());
    }

   
}
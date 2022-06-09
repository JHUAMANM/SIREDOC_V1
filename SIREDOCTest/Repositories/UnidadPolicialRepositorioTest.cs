using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Moq;
using NUnit.Framework;
using SIREDOC.DB;
using SIREDOC.Models;
using SIREDOC.Repositories;
using SIREDOCTest.Helpers;

namespace SIREDOCTest.Repositories;

public class UnidadPolicialRepositorioTest
{
    private IQueryable<UnidadPolicial> data;
    private Mock<DbEntities> mockDB;
  
    [SetUp]
    public void SetUp()
    {
        data = new List<UnidadPolicial>()
        {
            new(){ IdUnidad = 1, Nombre = "UNICII", Tipo = "ADMI", Direccion = "Jr. Amalia Puga", Telefono = "987456321", Correo = "unicii@gmai.com"},
            new(){ IdUnidad = 2, Nombre = "USE", Tipo = "OPE", Direccion = "Jr. Amalia Puga", Telefono = "963258741", Correo = "use@gmai.com"},
            new(){ IdUnidad = 3, Nombre = "UNITIC", Tipo = "ADMI", Direccion = "Jr. Amalia Puga", Telefono = "985632541", Correo = "unitic@gmai.com"},
            new(){ IdUnidad = 4, Nombre = "SUAT", Tipo = "OPE", Direccion = "Jr. Amalia Puga", Telefono = "957852321", Correo = "suat@gmai.com"}
        }.AsQueryable();
        
        var mockDbsetUnidad = new MockDBSet<UnidadPolicial>(data);
        mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.UnidadPolicials).Returns(mockDbsetUnidad.Object);

    }
    
    [Test]
    public void ObtenerTodosTestCase01()
    {
        
        var repositorio = new UnidadPolicialRepositorio(mockDB.Object);

        var result = repositorio.ObtenerTodos();
        
        Assert.AreEqual(4, result.Count);
    }
    
    [Test]
    public void ObtenerPorNombreTestCaso01()
    {
        var repositorio = new UnidadPolicialRepositorio(mockDB.Object);
        var result = repositorio.ObtenerPorNombre("USE");

        Assert.AreEqual(1, result.Count);
    }
    
    [Test]
    public void ObtenerPorNombreTestCaso02()
    {
        var repositorio = new UnidadPolicialRepositorio(mockDB.Object);
        var result = repositorio.ObtenerPorNombre("SUAT");

        Assert.AreEqual(1, result.Count);
    }
    
    [Test]
    public void GuardarGetUnidadCaso01()
    {
        var mockDbsetUnidad = (new MockDBSet<UnidadPolicial>(data));
        var mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.UnidadPolicials).Returns(mockDbsetUnidad.Object);
        var repositorio = new UnidadPolicialRepositorio(mockDB.Object);
        
        var result = repositorio.ObtenerTodos();
       
        Assert.IsNotNull(result);
    }
    
    [Test]
    public void GuardarPostUnidadCaso01()
    {
        var mockDbsetUnidad = (new MockDBSet<UnidadPolicial>(data));
        var mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.UnidadPolicials).Returns(mockDbsetUnidad.Object);
        var repositorio = new UnidadPolicialRepositorio(mockDB.Object);
        
        repositorio.GuardarUnidad(new UnidadPolicial() {IdUnidad = 1, Nombre = "UNITIC"});
       
        mockDbsetUnidad.Verify(o => o.Add(It.IsAny<UnidadPolicial>()), Times.Once);
    }
    
    [Test]
    public void EditarGetUnidadRepoCaso01()
    {
        var mockDbsetUnidad = (new MockDBSet<UnidadPolicial>(data));
        var mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.UnidadPolicials).Returns(mockDbsetUnidad.Object);
        
        var repositorio = new UnidadPolicialRepositorio(mockDB.Object);
        var result = repositorio.ObtenerTodos();
        
        Assert.IsNotNull(result);
    }

    [Test]
    public void EditarPostUnidadRepoCaso01()
    {
        var mockDbsetUnidad = (new MockDBSet<UnidadPolicial>(data));
        var mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.UnidadPolicials).Returns(mockDbsetUnidad.Object);
        
        var repositorio = new UnidadPolicialRepositorio(mockDB.Object);
        repositorio.EditarUnidadPorId(2,new UnidadPolicial(){IdUnidad = 2, Nombre = "UNICII"});
        
        Assert.IsNotNull(repositorio);
    }
    
    
    [Test]
    public void EliminarUnidadCaso01()
    {
        var mockDbsetUnidad = new MockDBSet<UnidadPolicial>(data);
        var mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.UnidadPolicials).Returns(mockDbsetUnidad.Object);
        
        var repo = new UnidadPolicialRepositorio(mockDB.Object);

        repo.DeleteUnidad(1);
        var dataMockEliminar = data.First(o => o.IdUnidad == 1);
        mockDbsetUnidad.Verify(o => o.Remove(dataMockEliminar), Times.Once());
    }

}
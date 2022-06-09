using System.Collections.Generic;
using System.Linq;
using Moq;
using NUnit.Framework;
using SIREDOC.DB;
using SIREDOC.Models;
using SIREDOC.Repositories;
using SIREDOCTest.Helpers;

namespace SIREDOCTest.Repositories;

public class DocumentoRepositorioTest
{
    private IQueryable<Documento> data;
    private Mock<DbEntities> mockDB;
  
    [SetUp]
    public void SetUp()
    {
        data = new List<Documento>()
        {
            new(){ Id = 1, Tipo = "OFICIO", Numero = "200-2022", Asunto = "APOYO POLICIAL", EfectivoId = 1},
            new(){ Id = 2, Tipo = "INFORME", Numero = "201-2022", Asunto = "SEGURIDAD", EfectivoId = 2},
            new(){ Id = 3, Tipo = "DECRETO", Numero = "202-2022", Asunto = "CHARLAS", EfectivoId = 3},
            new(){ Id = 4, Tipo = "ACTA", Numero = "203-2022", Asunto = "SERVICIO POLICIAL", EfectivoId = 4}
        }.AsQueryable();
        
        var mockDbsetDocumento = new MockDBSet<Documento>(data);
        mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.Documentos).Returns(mockDbsetDocumento.Object);

    }
    
     [Test]
    public void IndexEfectivoRepoCaso01()
    {
        var repositorio = new DocumentoRepositorio(mockDB.Object);
        var result = repositorio.ObtenerTodos();
        
        Assert.AreEqual(4, result.Count);

    }
    
    [Test]
    public void ObtenerPorTipoTestCaso01()
    {
        var repositorio = new DocumentoRepositorio(mockDB.Object);
        var result = repositorio.ObtenerPorTipo("OFICIO");

        Assert.AreEqual(1, result.Count);
    }
    
    [Test]
    public void ObtenerPorTipoTestCaso02()
    {
        var repositorio = new DocumentoRepositorio(mockDB.Object);
        var result = repositorio.ObtenerPorTipo("ACTA");

        Assert.AreEqual(1, result.Count);
    }
    
    [Test]
    public void ObtenerPorTipoTestCaso03()
    {
        var repositorio = new DocumentoRepositorio(mockDB.Object);
        var result = repositorio.ObtenerPorTipo("INFORME");

        Assert.AreEqual(1, result.Count);
    }
    [Test]
    public void GuardarGetDocumentoTestCaso01()
    {
        var mockDbsetDocumento = new MockDBSet<Documento>(data);
        var mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.Documentos).Returns(mockDbsetDocumento.Object);
        
        var repositorio = new DocumentoRepositorio(mockDB.Object);
        var result = repositorio.ObtenerTodos();

        Assert.AreEqual(4,result.Count);
        Assert.IsNotNull(result);
    }
    
    [Test]
    public void GuardarPostDocumentoTestCaso01()
    {
        var mockDbsetDocumento = new MockDBSet<Documento>(data);
        var mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.Documentos).Returns(mockDbsetDocumento.Object);
        
        var repositorio = new DocumentoRepositorio(mockDB.Object);
        
        repositorio.GuardarDocumento(new Documento(){Id = 1, Tipo = "OFICIO", Numero = "205-2022"});

        Assert.IsNotNull(repositorio);
        mockDbsetDocumento.Verify(o => o.Add(It.IsAny<Documento>()), Times.Once);
    }
    
    [Test]
    public void EditarGetDocumentoTestCaso01()
    {
        var repositorio = new DocumentoRepositorio(mockDB.Object);
        var result = repositorio.GetEditarDocumentoPorId(2);

       
        Assert.IsNotNull(result);
    }
    
    [Test]
    public void EditarPostDocumentoTestCaso01()
    {
        var mockDbsetDocumento = new MockDBSet<Documento>(data);
        var mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.Documentos).Returns(mockDbsetDocumento.Object);
        
        var repositorio = new DocumentoRepositorio(mockDB.Object);
        
        repositorio.PostEditarDocumentoPorId(2, new Documento(){Id = 1, Tipo = "OFICIO", Numero = "205-2022"});

        Assert.IsNotNull(repositorio);

    }
    
     
    [Test]
    public void EliminarDocumentoCaso01()
    {
        var mockDbsetDocumento = new MockDBSet<Documento>(data);
        var mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.Documentos).Returns(mockDbsetDocumento.Object);
        
        var repo = new DocumentoRepositorio(mockDB.Object);

        repo.DeleteDocPorId(1);
        var dataMockEliminar = data.First(o => o.Id == 1);
        mockDbsetDocumento.Verify(o => o.Remove(dataMockEliminar), Times.Once());
    }

   
    
}
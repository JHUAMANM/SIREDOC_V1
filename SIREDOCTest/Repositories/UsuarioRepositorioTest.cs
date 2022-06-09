using System.Collections.Generic;
using System.Linq;
using Moq;
using NUnit.Framework;
using SIREDOC.DB;
using SIREDOC.Models;
using SIREDOC.Repositories;
using SIREDOCTest.Helpers;

namespace SIREDOCTest.Repositories;

public class UsuarioRepositorioTest
{
    private IQueryable<Usuario> data;
    private Mock<DbEntities> mockDB;
    
    [SetUp]
    public void SetUp()
    {
        data = new List<Usuario>
        {
            new(){Id = 1, Username = "admin", Password = "1234",},
            new(){Id = 2, Username = "user1", Password = "1111",},
            new(){Id = 3, Username = "user2", Password = "2222",},
            new(){Id = 4, Username = "user3", Password = "3333",}
            
        }.AsQueryable();
        
        var mockDbsetUsuario = new MockDBSet<Usuario>(data);
        mockDB = new Mock<DbEntities>();
        mockDB.Setup(o => o.Usuarios).Returns(mockDbsetUsuario.Object);

    }

    [Test]
    public void ObtenerUsuarioRepoTestCaso01()
    {
        var ropositorio = new UsuarioRepositorio(mockDB.Object);

        var result = ropositorio.ObtenerLoggedUser("admin");
        
        Assert.AreEqual("admin", result.Username);
    }
    
    [Test]
    public void ObtenerUsuarioRepoTestCaso02()
    {
        var ropositorio = new UsuarioRepositorio(mockDB.Object);

        var result = ropositorio.ObtenerLoggedUser("user1");
        
        Assert.AreEqual("user1", result.Username);
    }
    
    [Test]
    public void ObtenerUsuarioRepoTestCaso03()
    {
        var ropositorio = new UsuarioRepositorio(mockDB.Object);

        var result = ropositorio.ObtenerLoggedUser("user2");
        
        Assert.AreEqual("user2", result.Username);
    }
    
    [Test]
    public void ObtenerUsuarioRepoErrorTestCaso01()
    {
        var ropositorio = new UsuarioRepositorio(mockDB.Object);

        var result = ropositorio.ObtenerLoggedUser("user");
        
        Assert.AreEqual("user", result.Username);
    }
}
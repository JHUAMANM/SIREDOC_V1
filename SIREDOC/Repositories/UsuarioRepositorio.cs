using System.Security.Claims;
using SIREDOC.DB;
using SIREDOC.Models;

namespace SIREDOC.Repositories;

public interface IUsuarioRepositorio
{
    Usuario ObtenerLoggedUser(string username);
}
public class UsuarioRepositorio: IUsuarioRepositorio
{
    private DbEntities _dbEntities;
    
    
    public UsuarioRepositorio(DbEntities dbEntities)
    {
        _dbEntities = dbEntities;
    }

    public Usuario ObtenerLoggedUser(string username)
    {
        return _dbEntities.Usuarios.First(o => o.Username == username);
       
    }
}
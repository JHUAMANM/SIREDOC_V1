using System.Security.Claims;
using SIREDOC.DB;
using SIREDOC.Models;

namespace SIREDOC.Repositories;

public interface IUsuarioRepositorio
{
    Usuario ObtenerLoggedUser();
}
public class UsuarioRepositorio: IUsuarioRepositorio
{
    private DbEntities _dbEntities;
    
    
    public UsuarioRepositorio(DbEntities dbEntities)
    {
        _dbEntities = dbEntities;
    }

    public Usuario ObtenerLoggedUser()
    {
        
        /*var claim = HttpContext.User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Name);
        var username = claim.Value;
        return _dbEntities.Usuarios.First(o => o.Username == username);*/
        return new Usuario();
    }
}
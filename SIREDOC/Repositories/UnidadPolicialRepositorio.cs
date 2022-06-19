using SIREDOC.DB;
using SIREDOC.Models;

namespace SIREDOC.Repositories;

public interface IUnidadPolicialRepositorio
{
    List<UnidadPolicial> ObtenerTodos();
    void GuardarUnidad(UnidadPolicial unidad);
    UnidadPolicial ObtenerUnidadPorId(int id);
    void EditarUnidadPorId(int id, UnidadPolicial unidad);
    void DeleteUnidad(int id);
    List<UnidadPolicial> ObtenerPorNombre(string nombre);
    int ContarPorNombre(UnidadPolicial unidades);

}
public class UnidadPolicialRepositorio: IUnidadPolicialRepositorio
{
    private DbEntities _dbEntities;
    
    public UnidadPolicialRepositorio(DbEntities dbEntities)
    {
        _dbEntities = dbEntities;
    }
    
    public List<UnidadPolicial> ObtenerTodos()
    {
        return _dbEntities.UnidadPolicials.ToList();
       
    }

    public void GuardarUnidad(UnidadPolicial unidad)
    {
        _dbEntities.UnidadPolicials.Add(unidad);
        _dbEntities.SaveChanges();
    }

    public UnidadPolicial ObtenerUnidadPorId(int id)
    {
        return _dbEntities.UnidadPolicials.First(o => o.IdUnidad == id); 
    }

    public void EditarUnidadPorId(int id, UnidadPolicial unidad)
    {
        var unidadDB = _dbEntities.UnidadPolicials.First(o => o.IdUnidad == id);
        unidadDB.Nombre = unidad.Nombre;
        unidadDB.Correo = unidad.Correo;
        _dbEntities.SaveChanges();

    }

    public void DeleteUnidad(int id)
    {
        var unidadDB = _dbEntities.UnidadPolicials.First(o => o.IdUnidad == id);
        _dbEntities.UnidadPolicials.Remove(unidadDB);
        _dbEntities.SaveChanges();
    }
    
    public List<UnidadPolicial> ObtenerPorNombre(string nombre)
    {
        return _dbEntities.UnidadPolicials.Where(o => o.Nombre.Contains(nombre)).ToList();
    }
    public int ContarPorNombre(UnidadPolicial unidades)
    {
        return _dbEntities.UnidadPolicials.Where(o => o.Nombre == unidades.Nombre).Count();

        
    }
}
using Microsoft.EntityFrameworkCore;
using SIREDOC.DB;
using SIREDOC.Models;

namespace SIREDOC.Repositories;

public interface IEfectivoPolicialRepositorio
{
    List<EfectivoPolicial> ObtenerEfectivosTodos();
    List<EfectivoPolicial> ObtenerTodos();
    void GuardarEfectivo(EfectivoPolicial efectivos);
    EfectivoPolicial ObtenerEfectivoPorId(int id);
    void EditarEfectivoPorId(int id, EfectivoPolicial efectivos);
    void DeleteEfectivo(int id);
    List<EfectivoPolicial> ObtenerPorNombre(string nombre);

}


public class EfectiPolicialRepositorio: IEfectivoPolicialRepositorio
{
    private DbEntities _dbEntities;
    
    public EfectiPolicialRepositorio(DbEntities dbEntities)
    {
        _dbEntities = dbEntities;
    }

    public List<EfectivoPolicial> ObtenerEfectivosTodos()
    {
        return _dbEntities.EfectivoPolicials
            .Include(o => o.UnidadPolicial)
            .ToList();
    
    
    }
    
    public List<EfectivoPolicial> ObtenerTodos()
    {
        return _dbEntities.EfectivoPolicials.ToList();


    }

    public void GuardarEfectivo(EfectivoPolicial efectivos)
    {
        _dbEntities.EfectivoPolicials.Add(efectivos);
        _dbEntities.SaveChanges();

    }

    public EfectivoPolicial ObtenerEfectivoPorId(int id)
    {
        return _dbEntities.EfectivoPolicials.First(o => o.Id == id); 
    }

    public void EditarEfectivoPorId(int id, EfectivoPolicial efectivos)
    {
        var efectivoDB = _dbEntities.EfectivoPolicials.First(o => o.Id == id);
        efectivoDB.Nombre = efectivos.Nombre;
        efectivoDB.Telefono = efectivos.Telefono;
        efectivoDB.Correo = efectivos.Correo;
        _dbEntities.SaveChanges();

    }

    public void DeleteEfectivo(int id)
    {
        var efectivoDB = _dbEntities.EfectivoPolicials.First(o => o.Id == id);
        _dbEntities.EfectivoPolicials.Remove(efectivoDB);
        _dbEntities.SaveChanges();
    }
    
    public List<EfectivoPolicial> ObtenerPorNombre(string nombre)
    {
        return _dbEntities.EfectivoPolicials.Where(o => o.Nombre.Contains(nombre)).ToList();
    }
}
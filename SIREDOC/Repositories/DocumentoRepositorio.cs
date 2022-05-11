using Microsoft.EntityFrameworkCore;
using SIREDOC.DB;
using SIREDOC.Models;

namespace SIREDOC.Repositories;

public interface IDocumentoRepositorio
{
    //Ingresamos todos los metodos de la clase
    List<Documento> ObtenerDocumentosDeUsuario(int UserId);

    Documento GetEditarDocumentoPorId(int id);

    void GuardarDocumento(Documento documento);

    void PostEditarCuentaPorId(int id, Documento documento);

    void DeleteDocPorId(int id);

}


public class DocumentoRepositorio: IDocumentoRepositorio
{
    private DbEntities _dbEntities;
    
    public DocumentoRepositorio(DbEntities dbEntities)
    {
        _dbEntities = dbEntities;
    }

    public List<Documento> ObtenerDocumentosDeUsuario(int UserId)
    {
      return _dbEntities.Documentos
            .Include(o => o.EfectivoPolicial)
            .Where(o => o.UsuarioId == UserId).ToList();
    }

    public void GuardarDocumento(Documento documento)
    {
        _dbEntities.Documentos.Add(documento);
        _dbEntities.SaveChanges();
    }

    public Documento GetEditarDocumentoPorId(int id)
    {
        return _dbEntities.Documentos.First(o => o.Id == id);
    }

    public void PostEditarCuentaPorId(int id, Documento documento)
    {
        var documentoDB = _dbEntities.Documentos.First(o => o.Id == id);
        documentoDB.Tipo = documento.Tipo;
        documentoDB.Observaciones = documento.Observaciones;
        
        _dbEntities.SaveChanges();
    }

    public void DeleteDocPorId(int id)
    {
        var documentoDB = _dbEntities.Documentos.First(o => o.Id == id);
        _dbEntities.Documentos.Remove(documentoDB);
        
        _dbEntities.SaveChanges();
    }
}
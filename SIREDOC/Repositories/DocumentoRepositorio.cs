using Microsoft.EntityFrameworkCore;
using SIREDOC.Constantes;
using SIREDOC.DB;
using SIREDOC.Models;

namespace SIREDOC.Repositories;

public interface IDocumentoRepositorio
{
    //Ingresamos todos los metodos de la clase
    List<Documento> ObtenerDocumentosDeUsuario(int UserId);
    List<Documento> ObtenerTodos();

    Documento GetEditarDocumentoPorId(int id);

    Documento GuardarDocumento(Documento documento);

    void PostEditarDocumentoPorId(int id, Documento documento);

    void DeleteDocPorId(int id);
    Documento ActualizarEstadoDeDocumento(int DocumentoId, int UsuarioId);
    Documento MarcarAtendidoEstado(int DocumentoId, int id);

    List<Documento> ObtenerPorTipo(string nombre);

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
    
    public List<Documento> ObtenerTodos()
    {
        return _dbEntities.Documentos.ToList();

    }
    

    public Documento GuardarDocumento(Documento documento)
    {
        _dbEntities.Documentos.Add(documento);
        _dbEntities.SaveChanges();

        return documento;
    }

    public Documento GetEditarDocumentoPorId(int id)
    {
        return _dbEntities.Documentos.First(o => o.Id == id);
    }

    public void PostEditarDocumentoPorId(int id, Documento documento)
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
    
    public Documento ActualizarEstadoDeDocumento(int DocumentoId, int UsuarioId)
    {
        var documento = _dbEntities.Documentos
            .Where(o => o.Id == DocumentoId && o.UsuarioId == UsuarioId)
            .FirstOrDefault();

        documento.Estado = ESTADO.EN_PROCESO;
        _dbEntities.SaveChanges();
            
            
        return documento;
    }


    public Documento MarcarAtendidoEstado(int DocumentoId, int id)
    {
        var documento = _dbEntities.Documentos
            .Where(o => o.Id == DocumentoId && o.UsuarioId == id)
            .FirstOrDefault();

        documento.Estado = ESTADO.ATENDIDO;
            
        _dbEntities.SaveChanges();

        return documento;

    }
    
    public List<Documento> ObtenerPorTipo(string nombre)
    {
        return _dbEntities.Documentos.Where(o => o.Tipo.Contains(nombre)).ToList();
    }
}
namespace SIREDOC.Models;

public class Documento
{
    public int Id { get; set; }
    public string Tipo { get; set; }
    public string Numero { get; set; }
    public DateTime Fecha { get; set; }
    public string Asunto { get; set; }
    public string Entregado { get; set; }
    public string Asignado { get; set; }
    public string Observaciones { get; set; }
    public int EfectivoId { get; set; }
    public int UsuarioId { get; set; }    
    public EfectivoPolicial? EfectivoPolicial { get; set; }
}
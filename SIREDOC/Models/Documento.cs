using System.ComponentModel.DataAnnotations;

namespace SIREDOC.Models;

public class Documento
{
    public int Id { get; set; }
    
    [Required(ErrorMessage = "Elija un tipo de documento")]
    public string Tipo { get; set; }
  
    [Required(ErrorMessage = "Ingrese numero y siglas del documento")]
    [MaxLength(80, ErrorMessage = "Escriba un maximo de 80 caracteres")]
    public string Numero { get; set; }
    
    [Required(ErrorMessage = "Escriba fecha de ingreso del documento")]
    [DataType(DataType.Date)]
    public DateTime Fecha { get; set; }
    
    [Required(ErrorMessage = "Ingrese el asunto del documento")]
    public string Asunto { get; set; }
    
    [Required(ErrorMessage = "Elija un efectivo de documento")]
    public string Asignado { get; set; }
    
    [Required(ErrorMessage = "Elija un tipo de documento")]
    public string Archivo { get; set; }
    
    [Required(ErrorMessage = "Ingrese las observaciones")]
    [MaxLength(80, ErrorMessage = "Escriba un maximo de 80 caracteres")]
    public string Observaciones { get; set; }
    public int Estado { get; set; }
    
    [Required(ErrorMessage = "Elija el efectivo que entrega el documento")]
    public int EfectivoId { get; set; }
    public int UsuarioId { get; set; }    
    public EfectivoPolicial? EfectivoPolicial { get; set; }
}
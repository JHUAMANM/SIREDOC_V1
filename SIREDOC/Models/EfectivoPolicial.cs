using System.ComponentModel.DataAnnotations;

namespace SIREDOC.Models;

public class EfectivoPolicial
{
    public int Id { get; set; }
    
    [Required(ErrorMessage = "Ingrese el nombre del efectivo")]
    [RegularExpression(@"^[A-Z]+[a-zA-Z""'\s-]*$", ErrorMessage = "Debe ingresar solo letras")]
    [MaxLength(50, ErrorMessage = "Debe ingresar 50 caracteres como max")]
    public string Nombre { get; set; }
    
    [Required(ErrorMessage = "Ingrese los apellidos del efectivo")]
    [RegularExpression(@"^[A-Z]+[a-zA-Z""'\s-]*$", ErrorMessage = "Debe ingresar solo letras")]
    [MaxLength(80, ErrorMessage = "Debe ingresar 80 caracteres como max")]
    public string Apellidos { get; set; }
    public int UnidadId { get; set; }
    
    [Required(ErrorMessage = "Ingrese el cip del efectivo")]
    [RegularExpression("(^[0-9]+$)", ErrorMessage = "Solo se permiten números")]
    [StringLength(8, MinimumLength = 1, ErrorMessage = "El cip tendra una longitud de 8 digitos")]
    public string Cip { get; set; }
    
    [Required(ErrorMessage = "Ingrese el telefono del efectivo")]
    [RegularExpression("(^[0-9]+$)", ErrorMessage = "Solo se permiten números")]
    [StringLength(9, MinimumLength = 1, ErrorMessage = "El telefono tendra una longitud de 9 digitos")]
    public string Telefono { get; set; }
    
    [Required(ErrorMessage = "Ingrese el correo del efectivo")]
    [EmailAddress(ErrorMessage = "Escriba un correo valido")]
    public string Correo { get; set; }

    public UnidadPolicial? UnidadPolicial { get; set; }

    
   
}
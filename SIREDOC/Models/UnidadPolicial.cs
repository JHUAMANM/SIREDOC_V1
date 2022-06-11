using System.ComponentModel.DataAnnotations;

namespace SIREDOC.Models;

public class UnidadPolicial
{
    public int IdUnidad { get; set; }
    
    [Required(ErrorMessage = "Ingrese el nombre de la unidad")]
    [RegularExpression(@"^[A-Z]+[a-zA-Z0-9""'\s-]*$", ErrorMessage = "Debe ingresar solo letras y numeros")]
    [MaxLength(50, ErrorMessage = "Debe ingresar 50 caracteres como max")]
    public string Nombre { get; set; }
    
    [Required(ErrorMessage = "Ingrese el tipo de unidad")]
    [RegularExpression("^[a-zA-Z]*$", ErrorMessage = "Debe ingresar solo letras")]
    [MaxLength(50, ErrorMessage = "Debe ingresar 50 caracteres como max")]
    public string Tipo { get; set; }
    
    [Required(ErrorMessage = "Ingrese la direccion de la unidad")]
    [RegularExpression(@"^[A-Z]+[a-zA-Z0-9""'\s-]*$", ErrorMessage = "Debe ingresar solo letras y numeros")]
    [MaxLength(90, ErrorMessage = "Debe ingresar 90 caracteres como max")]
    public string Direccion { get; set; }
    
    [Required(ErrorMessage = "Ingrese el telefono de la unidad")]
    [RegularExpression("(^[0-9]+$)", ErrorMessage = "Solo se permiten números")]
    [StringLength(9, MinimumLength = 1, ErrorMessage = "El telefono tendra una longitud de 9 digitos")]
    public string Telefono { get; set; }
    [Required(ErrorMessage = "Ingrese el correo de la unidad")]
    [EmailAddress(ErrorMessage = "Escriba un correo valido")]
    public string Correo { get; set; }
}
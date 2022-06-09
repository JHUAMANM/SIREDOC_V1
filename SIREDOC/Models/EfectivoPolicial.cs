using System.ComponentModel.DataAnnotations;

namespace SIREDOC.Models;

public class EfectivoPolicial
{
    public int Id { get; set; }
    
    [Required(ErrorMessage = "Ingrese el nombre del efectivo")]
    [MaxLength(50, ErrorMessage = "Debe ingresar 50 caracteres como max")]
    public string Nombre { get; set; }
    
    [Required(ErrorMessage = "Ingrese los apellidos del efectivo")]
    [MaxLength(80, ErrorMessage = "Debe ingresar 80 caracteres como max")]
    public string Apellidos { get; set; }
    public int UnidadId { get; set; }
    
    [Required(ErrorMessage = "Ingrese el cip del efectivo")]
    //[RegularExpression(@"^[0-9]{8}-[0-9]{1}$", ErrorMessage = "Ingrese un cip valido")]
    public string Cip { get; set; }
    
    [Required(ErrorMessage = "Ingrese el telefono del efectivo")]
    //[RegularExpression("^[0-9]{9}-[0-9]{1}$", ErrorMessage = "Escriba un telefono valido")]
    public string Telefono { get; set; }
    
    [Required(ErrorMessage = "Ingrese el correo del efectivo")]
    [EmailAddress(ErrorMessage = "Escriba un correo valido")]
    //[RegularExpression(@"^[a-zA-Z0-9_+-]+@[a-zA-Z0-9-]+\-[a-zA-Z0-9-.]+$",ErrorMessage="Formato incorrecto")]

    public string Correo { get; set; }

    public UnidadPolicial? UnidadPolicial { get; set; }

    
   
}
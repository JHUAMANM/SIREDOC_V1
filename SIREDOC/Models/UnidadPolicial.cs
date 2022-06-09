using System.ComponentModel.DataAnnotations;

namespace SIREDOC.Models;

public class UnidadPolicial
{
    public int IdUnidad { get; set; }
    [Required]
    public string Nombre { get; set; }
    [Required]
    public string Tipo { get; set; }
    [Required]
    public string Direccion { get; set; }
    [Required]
    public string Telefono { get; set; }
    [Required]
    public string Correo { get; set; }
}
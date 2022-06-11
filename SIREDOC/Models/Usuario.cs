using System.ComponentModel.DataAnnotations;

namespace SIREDOC.Models;

public class Usuario
{
    public int Id { get; set; } 
    [Required(ErrorMessage = "Ingrese su usuario")]
    public string Username { get; set; }
    [DataType(DataType.Password)]
    public string Password { get; set; }
}
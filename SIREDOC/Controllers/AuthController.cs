using System.Security.Claims;
using SIREDOC.DB;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;

namespace SIREDOC.Controllers;


public class AuthController : Controller
{
    private DbEntities _dbEntities;
    public AuthController(DbEntities dbEntities)
    {
        _dbEntities = dbEntities;
    }
    [HttpGet]
    public IActionResult Login()
    {
        return View();
    }
    [HttpPost]
    public IActionResult Login(string username, string password)
    {
        //si el usuario existe en la base de datos generar la cookie, caso contrario mostrar mensaje de usuario y password erroneo
        if (_dbEntities.Usuarios.Any(x => x.Username == username && x.Password == password))
        {
            var claims = new List<Claim>()
            {
                new Claim(ClaimTypes.Name, username),
            };
            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
            
            HttpContext.SignInAsync(claimsPrincipal);
            
            return RedirectToAction("Index", "Documento");
        }
        ModelState.AddModelError("AuthError", "Usuario y/o contraseña erronea");
        return View();
    }

    [HttpGet]
    public IActionResult Logout()
    {
        HttpContext.SignOutAsync();
        return RedirectToAction("Login");

    }
}
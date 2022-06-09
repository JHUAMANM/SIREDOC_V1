using SIREDOC.Models;
using Microsoft.EntityFrameworkCore;
using SIREDOC.DB.Mapping;

namespace SIREDOC.DB;

public class DbEntities: DbContext
{
    public virtual DbSet<Documento> Documentos { get; set; }
    public virtual DbSet<EfectivoPolicial> EfectivoPolicials { get; set; }
    
    public virtual DbSet<UnidadPolicial> UnidadPolicials { get; set; }
    public virtual DbSet<Usuario> Usuarios { get; set; }

    public DbEntities() { }
    public DbEntities(DbContextOptions<DbEntities> options) : base(options){ }
    
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.ApplyConfiguration(new DocumentoMapping());
        modelBuilder.ApplyConfiguration(new EfectivoPolicialMapping());
        modelBuilder.ApplyConfiguration(new UsuarioMapping());
        modelBuilder.ApplyConfiguration(new UnidadPolicialMapping());
        
    }
    
    //public static List<EfectivoPolicial> Efectivos = new();
    

    // public static List<Usuario> Usuarios = new()
    // {
    //     new Usuario {Id = 1, Username = "admin", Password = "123456"},
    //     new Usuario {Id = 2, Username = "user1", Password = "123456"},
    //     new Usuario {Id = 3, Username = "user2", Password = "123456"},
    // };
}
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SIREDOC.Models;

namespace SIREDOC.DB.Mapping;

public class UsuarioMapping: IEntityTypeConfiguration<Usuario>
{
    public void Configure(EntityTypeBuilder<Usuario> builder)
    {
        builder.ToTable("Usuario", "dbo");
        builder.HasKey(o => o.Id);
    }
}
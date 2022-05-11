using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SIREDOC.Models;

namespace SIREDOC.DB.Mapping;

public class UnidadPolicialMapping: IEntityTypeConfiguration<UnidadPolicial>
{
    public void Configure(EntityTypeBuilder<UnidadPolicial> builder)
    {
        builder.ToTable("UnidadPolicial", "dbo");
        builder.HasKey(o => o.IdUnidad);
    }
}
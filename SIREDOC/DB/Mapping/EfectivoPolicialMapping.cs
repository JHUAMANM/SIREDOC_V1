
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SIREDOC.Models;

namespace SIREDOC.DB.Mapping;

public class EfectivoPolicialMapping: IEntityTypeConfiguration<EfectivoPolicial>
{
    public void Configure(EntityTypeBuilder<EfectivoPolicial> builder)
    {
        builder.ToTable("EfectivoPolicial", "dbo");
        builder.HasKey(o => o.Id);

        builder.HasOne(o => o.UnidadPolicial)
            .WithMany()
            .HasForeignKey(o => o.UnidadId);
    }
}
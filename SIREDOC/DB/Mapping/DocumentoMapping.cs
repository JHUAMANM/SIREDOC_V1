using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SIREDOC.Models;

namespace SIREDOC.DB.Mapping;

public class DocumentoMapping: IEntityTypeConfiguration<Documento>
{
        public void Configure(EntityTypeBuilder<Documento> builder)
        {
            builder.ToTable("Documento", "dbo");
            builder.HasKey(o => o.Id);

            builder.HasOne(o => o.EfectivoPolicial)
                .WithMany()
                .HasForeignKey(o => o.EfectivoId);
           
        }
    
}
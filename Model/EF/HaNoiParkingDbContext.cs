namespace Model.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class HaNoiParkingDbContext : DbContext
    {
        public HaNoiParkingDbContext()
            : base("name=HaNoiParking")
        {
        }

        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<Parking> Parkings { get; set; }
        public virtual DbSet<ParkingImage> ParkingImages { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Admin>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<Admin>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<Parking>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Parking>()
                .Property(e => e.Website)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Avatar)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsUnicode(false);
        }
    }
}

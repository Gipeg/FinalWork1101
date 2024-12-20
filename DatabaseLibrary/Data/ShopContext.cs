using System;
using System.Collections.Generic;
using DatabaseLibrary.Models;
using Microsoft.EntityFrameworkCore;

namespace DatabaseLibrary.Data;

public partial class ShopContext : DbContext
{
    public ShopContext()
    {
    }

    public ShopContext(DbContextOptions<ShopContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<OrderProduct> OrderProducts { get; set; }

    public virtual DbSet<PickupPoint> PickupPoints { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source = localhost; Initial Catalog = Exam1101; User ID = Exam1101; Trust Server Certificate=True; Integrated Security = True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.OrderId).HasName("PK__ExamOrde__C3905BAFC7CC9AED");

            entity.ToTable("Order");

            entity.Property(e => e.Date).HasColumnType("datetime");
            entity.Property(e => e.DeliveryDate).HasColumnType("datetime");

            entity.HasOne(d => d.PickupPoint).WithMany(p => p.Orders)
                .HasForeignKey(d => d.PickupPointId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ExamOrder_ExamPickupPoint");

            entity.HasOne(d => d.User).WithMany(p => p.Orders)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK_ExamOrder_ExamUser");
        });

        modelBuilder.Entity<OrderProduct>(entity =>
        {
            entity.HasKey(e => new { e.OrderId, e.ProductId }).HasName("PK__ExamOrde__817A266255BBC081");

            entity.ToTable("OrderProduct");

            entity.HasOne(d => d.Order).WithMany(p => p.OrderProducts)
                .HasForeignKey(d => d.OrderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ExamOrder__Order__403A8C7D");

            entity.HasOne(d => d.Product).WithMany(p => p.OrderProducts)
                .HasForeignKey(d => d.ProductId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_OrderProduct_Product");
        });

        modelBuilder.Entity<PickupPoint>(entity =>
        {
            entity.HasKey(e => e.PickupPointId).HasName("PK_ExamPickupPoint");

            entity.ToTable("PickupPoint");
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.ToTable("Product");

            entity.Property(e => e.ArticleNumber).HasMaxLength(100);
            entity.Property(e => e.Cost).HasColumnType("decimal(19, 4)");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.RoleId).HasName("PK__ExamRole__8AFACE3AA2D40FB8");

            entity.ToTable("Role");

            entity.Property(e => e.Name).HasMaxLength(100);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__ExamUser__1788CCAC0829F7A9");

            entity.ToTable("User");

            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.Patronymic).HasMaxLength(100);
            entity.Property(e => e.Surname).HasMaxLength(100);

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ExamUser_ExamRole");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}

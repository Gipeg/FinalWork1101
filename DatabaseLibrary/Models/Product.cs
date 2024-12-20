using System;
using System.Collections.Generic;

namespace DatabaseLibrary.Models;

public partial class Product
{
    public int ProductId { get; set; }

    public string ArticleNumber { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public string Category { get; set; } = null!;

    public string? Photo { get; set; }

    public string Manufacturer { get; set; } = null!;

    public decimal Cost { get; set; }

    public byte? DiscountAmount { get; set; }

    public int QuantityInStock { get; set; }

    public string Status { get; set; } = null!;

    public virtual ICollection<OrderProduct> OrderProducts { get; set; } = new List<OrderProduct>();
}

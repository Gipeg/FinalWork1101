using System;
using System.Collections.Generic;

namespace DatabaseLibrary.Models;

public partial class OrderProduct
{
    public int OrderId { get; set; }

    public int ProductId { get; set; }

    public short Amount { get; set; }

    public virtual Order Order { get; set; } = null!;

    public virtual Product Product { get; set; } = null!;
}

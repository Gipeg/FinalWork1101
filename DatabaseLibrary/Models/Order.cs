using System;
using System.Collections.Generic;

namespace DatabaseLibrary.Models;

public partial class Order
{
    public int OrderId { get; set; }

    public int? UserId { get; set; }

    public int PickupPointId { get; set; }

    public string Status { get; set; } = null!;

    public DateTime Date { get; set; }

    public DateTime DeliveryDate { get; set; }

    public int PickupCode { get; set; }

    public virtual ICollection<OrderProduct> OrderProducts { get; set; } = new List<OrderProduct>();

    public virtual PickupPoint PickupPoint { get; set; } = null!;

    public virtual User? User { get; set; }
}

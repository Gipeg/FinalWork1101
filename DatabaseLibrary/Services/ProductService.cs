using DatabaseLibrary.Data;
using DatabaseLibrary.Models;
using Microsoft.EntityFrameworkCore;

namespace DatabaseLibrary.Services
{
    public class ProductService
    {
        private readonly ShopContext _context = new();
        public async Task<List<Product>> GetProductsAsync()
            => await _context.Products.ToListAsync();
    }
}

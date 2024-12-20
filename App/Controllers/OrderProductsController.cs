using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DatabaseLibrary.Data;
using DatabaseLibrary.Models;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderProductsController : ControllerBase
    {
        private readonly ShopContext _context;

        public OrderProductsController(ShopContext context)
        {
            _context = context;
        }

        // GET: api/ExamOrderProducts
        [HttpGet]
        public async Task<ActionResult<IEnumerable<OrderProduct>>> GetExamOrderProducts()
        {
            return await _context.OrderProducts.ToListAsync();
        }

        // GET: api/ExamOrderProducts/5
        [HttpGet("{id}")]
        public async Task<ActionResult<OrderProduct>> GetExamOrderProduct(int id)
        {
            var examOrderProduct = await _context.OrderProducts.FindAsync(id);

            if (examOrderProduct == null)
            {
                return NotFound();
            }

            return examOrderProduct;
        }

        // PUT: api/ExamOrderProducts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutExamOrderProduct(int id, OrderProduct examOrderProduct)
        {
            if (id != examOrderProduct.OrderId)
            {
                return BadRequest();
            }

            _context.Entry(examOrderProduct).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ExamOrderProductExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/ExamOrderProducts
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<OrderProduct>> PostExamOrderProduct(OrderProduct examOrderProduct)
        {
            _context.OrderProducts.Add(examOrderProduct);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (ExamOrderProductExists(examOrderProduct.OrderId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetExamOrderProduct", new { id = examOrderProduct.OrderId }, examOrderProduct);
        }

        // DELETE: api/ExamOrderProducts/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteExamOrderProduct(int id)
        {
            var examOrderProduct = await _context.OrderProducts.FindAsync(id);
            if (examOrderProduct == null)
            {
                return NotFound();
            }

            _context.OrderProducts.Remove(examOrderProduct);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ExamOrderProductExists(int id)
        {
            return _context.OrderProducts.Any(e => e.OrderId == id);
        }
    }
}
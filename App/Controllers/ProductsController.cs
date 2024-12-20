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
    public class PickupPointsController : ControllerBase
    {
        private readonly ShopContext _context;

        public PickupPointsController(ShopContext context)
        {
            _context = context;
        }

        // GET: api/ExamPickupPoints
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PickupPoint>>> GetExamPickupPoints()
        {
            return await _context.PickupPoints.ToListAsync();
        }

        // GET: api/ExamPickupPoints/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PickupPoint>> GetExamPickupPoint(int id)
        {
            var examPickupPoint = await _context.PickupPoints.FindAsync(id);

            if (examPickupPoint == null)
            {
                return NotFound();
            }

            return examPickupPoint;
        }

        // PUT: api/ExamPickupPoints/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutExamPickupPoint(int id, PickupPoint examPickupPoint)
        {
            if (id != examPickupPoint.PickupPointId)
            {
                return BadRequest();
            }

            _context.Entry(examPickupPoint).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ExamPickupPointExists(id))
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

        // POST: api/ExamPickupPoints
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<PickupPoint>> PostExamPickupPoint(PickupPoint examPickupPoint)
        {
            _context.PickupPoints.Add(examPickupPoint);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (ExamPickupPointExists(examPickupPoint.PickupPointId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetExamPickupPoint", new { id = examPickupPoint.PickupPointId }, examPickupPoint);
        }

        // DELETE: api/ExamPickupPoints/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteExamPickupPoint(int id)
        {
            var examPickupPoint = await _context.PickupPoints.FindAsync(id);
            if (examPickupPoint == null)
            {
                return NotFound();
            }

            _context.PickupPoints.Remove(examPickupPoint);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ExamPickupPointExists(int id)
        {
            return _context.PickupPoints.Any(e => e.PickupPointId == id);
        }
    }
}
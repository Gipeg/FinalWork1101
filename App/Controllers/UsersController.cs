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
    public class UsersController : ControllerBase
    {
        private readonly ShopContext _context;

        public UsersController(ShopContext context)
        {
            _context = context;
        }

        // GET: api/ExamUsers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> GetExamUsers()
        {
            return await _context.Users.ToListAsync();
        }

        // GET: api/ExamUsers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetExamUser(int id)
        {
            var examUser = await _context.Users.FindAsync(id);

            if (examUser == null)
            {
                return NotFound();
            }

            return examUser;
        }

        // PUT: api/ExamUsers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutExamUser(int id, User examUser)
        {
            if (id != examUser.UserId)
            {
                return BadRequest();
            }

            _context.Entry(examUser).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ExamUserExists(id))
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

        // POST: api/ExamUsers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<User>> PostExamUser(User examUser)
        {
            _context.Users.Add(examUser);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetExamUser", new { id = examUser.UserId }, examUser);
        }

        // DELETE: api/ExamUsers/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteExamUser(int id)
        {
            var examUser = await _context.Users.FindAsync(id);
            if (examUser == null)
            {
                return NotFound();
            }

            _context.Users.Remove(examUser);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ExamUserExists(int id)
        {
            return _context.Users.Any(e => e.UserId == id);
        }
    }
}

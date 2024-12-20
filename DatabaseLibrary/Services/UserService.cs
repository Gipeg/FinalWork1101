using DatabaseLibrary.Data;
using DatabaseLibrary.Models;
using Microsoft.EntityFrameworkCore;

namespace DatabaseLibrary.Services
{
    public class UserService
    {
        private readonly ShopContext _context = new();

        public async Task<bool> IsUserExist(string login, string password)
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Login == login && u.Password == password);
            if (user != null)
                return true;

            return false;
        }

        public async Task<User?> GetUserByLogin(string login)
            => await _context.Users.FirstOrDefaultAsync(u => u.Login == login);

    }
}

using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Eshop.Models
{
    public class DbEntityContext: DbContext
    {
        public DbSet<Users> User { get; set; }
        public DbSet<UserRoles> UserRole { get; set; }
        public DbSet<CurrentUserRoles> CurrentUserRole { get; set; }
    }
}
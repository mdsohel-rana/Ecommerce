using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eshop.Models
{
    public class Users
    {
        public long Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Slug { get; set; }
        public string Password { get; set; }
        public DateTime CreateAt { get; set; }
        public Nullable<DateTime> UpdateAt { get; set; }
        public Nullable<DateTime> TrashAt { get; set; }
    }

    public class UserLogin
    {
    
        public string Username { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public bool RebemberMe { get; set; }
    }

    public class UserRegister
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }  
        public string ConfirmPassword { get; set; }
    }

    public class CurrentUserRoles
    {
        public long Id { get; set; }
        public long UserId { get; set; }
        public long RoleId { get; set; }
        public DateTime CreateAt { get; set; }
        public Nullable<DateTime> UpdateAt { get; set; }
        public Nullable<DateTime> TrashAt { get; set; }
    }
}
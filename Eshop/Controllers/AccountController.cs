using Eshop.Models;
using Eshop.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Eshop.Controllers
{
    [AllowAnonymous]
    public class AccountController : Controller
    {
        UtilityFunction utilityFunction = new UtilityFunction();
        // GET: Account/Registration
        [HttpGet]
        public ActionResult Registration()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(UserRegister requestUser)
        {
            Users newUser = new Users {
                FirstName = requestUser.FirstName,
                LastName =requestUser.LastName,
                Username=requestUser.Username,
                Email=requestUser.Email,
                Slug = requestUser.FirstName + DateTime.Now,
                CreateAt = DateTime.Now,
                Password = utilityFunction.GetSecurePassword(requestUser.Password),
                TrashAt =null,
                UpdateAt =null,
            };
            var saveStates = 0;
            using (DbEntityContext saveUserDBConn =new DbEntityContext())
            {
                saveUserDBConn.User.Add(newUser);
                saveStates= saveUserDBConn.SaveChanges();
            }
                return View();
        }
    }
}
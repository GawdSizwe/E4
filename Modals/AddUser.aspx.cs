using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Users.Model;

namespace Users.Modals
{
    public partial class AddUser : System.Web.UI.Page
    {
        const string xmlFile = @"C:\Users\Sizwe.M\Desktop\New folder\Users\users.xml";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static void AddNewUser(UserDetails data)
        {
            //var user = new Model.Users(1, "Sizwe", "Mazibuko", "0745135075");
            var xdoc = XDocument.Load(xmlFile);
            var xelement = new XElement("USER", new XAttribute("id", int.Parse(data.ID)), new XElement("NAME", data.Names), new XElement("SURNAME", data.Surname), new XElement("CELLNO", data.CellNo));
            xdoc.Root.Add(xelement);

            xdoc.Save(xmlFile);
        }

    }
}
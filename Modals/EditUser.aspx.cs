using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Users.Modals
{
    public partial class EditUser : System.Web.UI.Page
    {
        const string xmlFile = @"C:\Users\Sizwe.M\Desktop\New folder\Users\users.xml";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hiddenUserID.Value = Request.QueryString["id"];
                PrePopulateTextboxes();
            }
        }

        public void PrePopulateTextboxes()
        {
            if (hiddenUserID.Value != "")
            {
                var xdoc = XDocument.Load(xmlFile);
                var tgtUser = xdoc.Root.Descendants("USER").FirstOrDefault(x => x.Attribute("id").Value == hiddenUserID.Value.ToString());

                txtName.Text = tgtUser.Element("NAME").Value.ToString();
                txtSurname.Text = tgtUser.Element("SURNAME").Value.ToString();
                txtCellNo.Text = tgtUser.Element("CELLNO").Value.ToString();
            }
        }

        [WebMethod]
        public static void UpdateUser(UserDetails data) 
        {
            var xdoc = XDocument.Load(xmlFile);
            var tgtUser = xdoc.Root.Descendants("USER").FirstOrDefault(x => x.Attribute("id").Value == data.ID.ToString());
            tgtUser.Element("NAME").Value = data.Names;
            tgtUser.Element("SURNAME").Value = data.Surname;
            tgtUser.Element("CELLNO").Value = data.CellNo;

            xdoc.Save(xmlFile);
        }

        [WebMethod]
        public static void DeleteUser(UserDetails data)
        {
            var xdoc = XDocument.Load(xmlFile);
            var tgt = xdoc.Root.Descendants("USER").FirstOrDefault(x => x.Attribute("id").Value == data.ID.ToString());
            tgt.Remove();

            xdoc.Save(xmlFile);
        }
    }
}
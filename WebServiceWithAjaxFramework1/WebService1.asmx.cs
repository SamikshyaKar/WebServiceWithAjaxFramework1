using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace WebServiceWithAjaxFramework1
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public Student GetStudentbyID( int ID)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection Con= new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spGetStudentByID", Con);
                cmd.CommandType =CommandType.StoredProcedure;
                SqlParameter Param = new SqlParameter("@ID", ID);
                cmd.Parameters.Add(Param);
                Student studentobj = new Student();
                Con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while(rdr.Read())
                {
                    studentobj.ID = Convert.ToInt32(rdr["ID"]);
                    studentobj.Name = rdr["Name"].ToString();
                    studentobj.Gender = rdr["Gender"].ToString();
                    studentobj.TotalMarks = Convert.ToInt32(rdr["TotalMarks"]);                    
                }

                return studentobj;                   

            }
            
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace ConsoleApp4
{
    public class Connection
    {
        private string dataBase;
        private SqlConnection connection;

        public string DataBase {
            get { return dataBase; }
            set { dataBase = value; }
        }

        public Connection(string pDataBase) {
            dataBase = pDataBase;
        }

        public void openConnection() {
            connection = new SqlConnection("Data Source = EVELIO; Initial Catalog = PrograBD1; Integrated Security = True");
                                            //Data Source =.; Initial Catalog="+dataBase+"; Integrated Security=SSPI
            connection.Open();
            System.Console.WriteLine("Conectó");
        }

        public DataTable getTable() {//Busca la tabla que se le diga
            SqlDataAdapter adapter = new SqlDataAdapter("select * from information_schema.tables", connection);
            DataTable table = new DataTable("tables");
            adapter.Fill(table);
            return table;
        }

        public DataTable showData(string table){//Toma la información de la tabla dicha y lo coloca en un DataTable
            SqlDataAdapter adapter = new SqlDataAdapter("select * from " + table, connection);
            DataTable data = new DataTable("tables");
            adapter.Fill(data);
            return data;
        }
    }
}

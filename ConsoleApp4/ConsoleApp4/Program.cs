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
    class Program
    {
        static void Main(string[] args)
        {   
        }
        //FUNCIONES:
        static void fillClasses() {
            Connection connection = new Connection("Aquí va el nombre de la base, pero ahorita está directo a mi Base");
            connection.openConnection();
            Console.ReadKey();
        }
    }
}

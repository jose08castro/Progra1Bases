using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class Teacher
    {
        //Atributos
        private int idTeacher;
        private string name;
        private string email;
        private string password;

        //Constructor
        public Teacher(int idTeacher, string name, string email, string password)
        {
            setIdTeacher(idTeacher);
            setName(name);
            setEmail(email);
            setPassword(password);
        }

        //Métodos
        public int getIdTeacher()
        {
            return this.idTeacher;
        }

        private void setIdTeacher(int pIdTeacher)
        {
            this.idTeacher = pIdTeacher;
        }
        //-----------------------------------------------------------------------//
        public string getName()
        {
            return this.name;
        }

        private void setName(string pName)
        {
            this.name = pName;
        }
        //----------------------------------------------------------------------//
        public string getEmail()
        {
            return this.email;
        }

        private void setEmail(string pEmail)
        {
            this.email = pEmail;
        }
        //----------------------------------------------------------------------//
        public string getPassword()
        {
            return this.password;
        }

        private void setPassword(string pPassword)
        {
            this.password = pPassword;
        }
        //-----------------------------------------------------------------------//
        public void show()
        {
            Console.WriteLine("IdTeacher: ", this.getIdTeacher());
            Console.WriteLine("Name: ", this.getName());
            Console.WriteLine("Email: ", this.getEmail());
            Console.WriteLine("Password: ", this.getPassword());
            Console.WriteLine("-----------------------------------------------------");
        }
    }
}

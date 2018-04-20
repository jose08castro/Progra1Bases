using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace ConsoleApp4
{
    class Student
    {
        //Atributos
        private int idStudent;
        private string name;
        private string email;
        private string password;
        private int phone;
        private string state;

        //Constructor
        public Student(int idStudent, string name, string email, string password, int phone, string state) {
            setIdStudent(idStudent);
            setName(name);
            setEmail(email);
            setPassword(password);
            setPhone(phone);
            setState(state);
        }

        //Métodos
        public int getIdStudent()
        {
            return this.idStudent;
        }

        private void setIdStudent(int pIdStudent)
        {
            this.idStudent = pIdStudent;
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
        public string getPassword()
        {
            return this.password;
        }

        public void setPassword(string pPassword)
        {
            this.password = pPassword;
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
        //-----------------------------------------------------------------------//
        public int getPhone()
        {
            return this.phone;
        }

        private void setPhone(int pPhone)
        {
            this.phone = pPhone;
        }
        //-----------------------------------------------------------------------//
        public string getState()
        {
            return this.state;
        }

        private void setState(string pState)
        {
            this.state = pState;
        }
        //-----------------------------------------------------------------------//
        public void show() {
            Console.WriteLine("IdStudent: "+this.getIdStudent());
            Console.WriteLine("Name: "+this.getName());
            Console.WriteLine("Email: "+this.getEmail());
            Console.WriteLine("Password: "+this.getPassword());
            Console.WriteLine("Phone: "+this.getPhone());
            Console.WriteLine("State: "+this.getState());
            Console.WriteLine("-----------------------------------------------------");
        }
    }
}

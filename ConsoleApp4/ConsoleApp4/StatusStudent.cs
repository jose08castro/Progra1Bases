using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class StatusStudent
    {
        //Atributos
        private int idStatusStudent;
        private string name;

        //Constructor
        public StatusStudent(int idStatusStudent, string name)
        {
            setIdStatusStudent(idStatusStudent);
            setName(name);
        }

        //Métodos
        public int getIdStatusStudent()
        {
            return this.idStatusStudent;
        }

        private void setIdStatusStudent(int pIdStatusStudent)
        {
            this.idStatusStudent = pIdStatusStudent;
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
        //-----------------------------------------------------------------------//
        public void show()
        {
            Console.WriteLine("IdStatusStudent:", this.getIdStatusStudent());
            Console.WriteLine("Name:", this.getName());
            Console.WriteLine("-----------------------------------------------------");
        }
    }
}

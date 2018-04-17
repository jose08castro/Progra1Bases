using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class Group
    {
        //Atributos
        private int idGroup;
        private int idTerm;
        private string code;
        private int idTeacher;
        private string name;
        private int idStatusGroup;

        //Constructor
        public Group(int idGroup, int idTerm, string code, int idTeacher, string name, int idStatusGroup)
        {
            setIdGroup(idGroup);
            setIdTerm(idTerm);
            setCode(code);
            setIdTeacher(idTeacher);
            setName(name);
            setIdStatusGroup(idStatusGroup);
        }

        //Métodos
        public int getIdGroup()
        {
            return this.idGroup;
        }

        private void setIdGroup(int pIdGroup)
        {
            this.idGroup = pIdGroup;
        }
        //-----------------------------------------------------------------------//
        public int getIdTerm()
        {
            return this.idTerm;
        }

        private void setIdTerm(int pIdTerm)
        {
            this.idTerm = pIdTerm;
        }
        //-----------------------------------------------------------------------//
        public int getIdTeacher()
        {
            return this.idTeacher;
        }

        private void setIdTeacher(int pIdTeacher)
        {
            this.idTeacher = pIdTeacher;
        }
        //-----------------------------------------------------------------------//
        public int getIdStatusGroup()
        {
            return this.idStatusGroup;
        }

        private void setIdStatusGroup(int pIdStatusGroup)
        {
            this.idStatusGroup = pIdStatusGroup;
        }
        //-----------------------------------------------------------------------//
        public string getCode()
        {
            return this.code;
        }

        private void setCode(string pCode)
        {
            this.code = pCode;
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
            Console.WriteLine("IdGroup: ", this.getIdGroup());
            Console.WriteLine("IdTerm: ", this.getIdTerm());
            Console.WriteLine("Code ", this.getCode());
            Console.WriteLine("IdTeacher: ", this.getIdTeacher());
            Console.WriteLine("Name: ", this.getName());
            Console.WriteLine("IdStatusGroup: ", this.getIdStatusGroup());
            Console.WriteLine("-----------------------------------------------------");
        }
    }
}

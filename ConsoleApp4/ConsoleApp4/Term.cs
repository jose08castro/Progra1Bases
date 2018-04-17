using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class Term
    {
        //Atributos
        private int idTerm;
        private string start;
        private string end;
        private bool active;

        //Métodos
        public int getIdTerm()
        {
            return this.idTerm;
        }

        public void setIdTerm(int pIdTerm)
        {
            this.idTerm = pIdTerm;
        }
        //-----------------------------------------------------------------------//
        public string getStart()
        {
            return this.start;
        }

        public void setStart(string pStart)
        {
            this.start = pStart;
        }
        //-----------------------------------------------------------------------//
        public string getEnd()
        {
            return this.end;
        }

        public void setEnd(string pEnd)
        {
            this.end = pEnd;
        }
        //-----------------------------------------------------------------------//
        public bool getActive()
        {
            return this.active;
        }

        public void setActive(bool pActive)
        {
            this.active = pActive;
        }
        //-----------------------------------------------------------------------//
        public void show()
        {
            Console.WriteLine("IdTerm: ", this.getIdTerm());
            Console.WriteLine("Start: ", this.getStart());
            Console.WriteLine("End: ", this.getEnd());
            Console.WriteLine("Status: ", this.getActive());
            Console.WriteLine("-----------------------------------------------------");
        }
    }
}

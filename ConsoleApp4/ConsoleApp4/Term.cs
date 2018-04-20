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
        private string active;

        public Term(){}

        public Term(int idTerm, string start, string end, string active){
            setIdTerm(idTerm);
            setStart(start);
            setEnd(end);
            setActive(active);
        }

        //Métodos
        public int getIdTerm()
        {
            return this.idTerm;
        }

        private void setIdTerm(int pIdTerm)
        {
            this.idTerm = pIdTerm;
        }
        //-----------------------------------------------------------------------//
        public string getStart()
        {
            return this.start;
        }

        private void setStart(string pStart)
        {
            this.start = pStart;
        }
        //-----------------------------------------------------------------------//
        public string getEnd()
        {
            return this.end;
        }

        private void setEnd(string pEnd)
        {
            this.end = pEnd;
        }
        //-----------------------------------------------------------------------//
        public string getActive()
        {
            return this.active;
        }

        private void setActive(string pActive)
        {
            this.active = pActive;
        }
        //-----------------------------------------------------------------------//
        public void show()
        {
            Console.WriteLine("IdTerm: " + this.getIdTerm());
            Console.WriteLine("Start: " + this.getStart());
            Console.WriteLine("End: " + this.getEnd());
            Console.WriteLine("Status: " + this.getActive());
            Console.WriteLine("-----------------------------------------------------");
        }
    }
}

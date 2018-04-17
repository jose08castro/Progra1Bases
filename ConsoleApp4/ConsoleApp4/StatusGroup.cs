using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class StatusGroup
    {
        //Atributos
        private int idStatusGroup;
        private string name;

        //Constructor
        public StatusGroup( int idStatusGroup, string name)
        {
            setIdStatusGroup(idStatusGroup);
            setName(name);
        }

        //Métodos
        public int getIdStatusGroup()
        {
            return this.idStatusGroup;
        }

        private void setIdStatusGroup(int pIdStatusGroup)
        {
            this.idStatusGroup = pIdStatusGroup;
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
            Console.WriteLine("IdStatusGroup: ", this.getIdStatusGroup());
            Console.WriteLine("IdName: ", this.getName());
            Console.WriteLine("-----------------------------------------------------");
        }
    }
}

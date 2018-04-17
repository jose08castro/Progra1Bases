using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class Item
    {
        //Atributos
        private int idItem;
        private string name;

        //Constructor
        public Item(int idItem, string name)
        {
            setIdItem(idItem);
            setName(name);
        }

        //Métodos
        public int getIdItem()
        {
            return this.idItem;
        }

        private void setIdItem(int pIdItem)
        {
            this.idItem = pIdItem;
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
            Console.WriteLine("IdItem: ", this.getIdItem());
            Console.WriteLine("Name: ", this.getName());
            Console.WriteLine("-----------------------------------------------------");
        }
    }
}

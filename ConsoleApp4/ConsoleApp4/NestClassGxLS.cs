using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class NestClassGxLS
    {
        //Atributos 
        Group group;
        List<NestClassSxLG> listNestClassSxLG;

        //Constructor
        public NestClassGxLS(Group group, List<NestClassSxLG> listNestClassSxLG)
        {
            setGroup(group);
            setListNestClassSxLG(listNestClassSxLG);
        }

        //Métodos
        public Group getGroup()
        {
            return this.group;
        }

        private void setGroup(Group pGroup)
        {
            this.group = pGroup;
        }
        //-----------------------------------------------------------------------//
        public List<NestClassSxLG> getListNestClassSxLG()
        {
            return this.listNestClassSxLG;
        }

        private void setListNestClassSxLG(List<NestClassSxLG> pListNestClassSxLG)
        {
            this.listNestClassSxLG = pListNestClassSxLG;
        }
        //-----------------------------------------------------------------------//
    }
}

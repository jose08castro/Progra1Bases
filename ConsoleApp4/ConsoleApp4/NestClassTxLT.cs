using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class NestClassTxLT
    {
        //Atributos 
        Teacher teacher;
        List<NestClassTxLG> listNestClassTxLG;

        //Constructor
        public NestClassTxLT(Teacher teacher, List<NestClassTxLG> listNestClassGxLS)
        {
            setTeacher(teacher);
            setListNestClassGxLS(listNestClassGxLS);
        }

        //Métodos
        public Teacher getTeacher()
        {
            return this.teacher;
        }

        private void setTeacher(Teacher pTeacher)
        {
            this.teacher = pTeacher;
        }
        //-----------------------------------------------------------------------//
        public List<NestClassTxLG> getListNestClassTxLG()
        {
            return this.listNestClassTxLG;
        }

        private void setListNestClassGxLS(List<NestClassTxLG> pListNestClassTxLG)
        {
            this.listNestClassTxLG = pListNestClassTxLG;
        }
        //-----------------------------------------------------------------------//
    }
}

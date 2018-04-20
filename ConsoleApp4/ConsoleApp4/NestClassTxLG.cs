using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class NestClassTxLG
    {
        //Atributos 
        Term term;
        List<NestClassGxLS> listNestClassGxLS;

        //Constructor
        public NestClassTxLG(Term term, List<NestClassGxLS> listNestClassGxLS)
        {
            setTerm(term);
            setListNestClassGxLS(listNestClassGxLS);
        }

        //Métodos
        public Term getTerm()
        {
            return this.term;
        }

        private void setTerm(Term pTerm)
        {
            this.term = pTerm;
        }
        //-----------------------------------------------------------------------//
        public List<NestClassGxLS> getListNestClassGxLS()
        {
            return this.listNestClassGxLS;
        }

        private void setListNestClassGxLS(List<NestClassGxLS> pListNestClassGxLS)
        {
            this.listNestClassGxLS = pListNestClassGxLS;
        }
        //-----------------------------------------------------------------------//
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class NestClassSxLG
    {
        //Atributos 
        Student student;
        List<GradeXStudent> listGradeXStudent;

        //Constructor
        public NestClassSxLG(Student student, List<GradeXStudent> listGradeXStudent) {
            setStudent(student);
            setListGradeXStudent(listGradeXStudent);
        }

        //Métodos
        public Student getStudent()
        {
            return this.student;
        }

        private void setStudent(Student pStudent)
        {
            this.student = pStudent;
        }
        //-----------------------------------------------------------------------//
        public List<GradeXStudent> getListGradeXStudent()
        {
            return this.listGradeXStudent;
        }

        private void setListGradeXStudent(List<GradeXStudent> pListGradeXStudent)
        {
            this.listGradeXStudent = pListGradeXStudent;
        }
        //-----------------------------------------------------------------------//
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class StudentXGroup
    {
        //Atributos
        private int idStudentXGroup;
        private int idGroup;
        private int idStudent;
        private float totalGrade;
        private int idStatusGroup;

        //Constructor
        public StudentXGroup(int idStudentXGroup, int idGroup, int idStudent, float totalGrade, int idStatusGroup)
        {
            setIdStudentXGroup(idStudentXGroup);
            setIdGroup(idGroup);
            setIdStudent(idStudent);
            setTotalGrade(totalGrade);
            setIdStatusGroup(idStatusGroup);
        }

        //Métodos
        public int getIdStudentXGroup()
        {
            return this.idStudentXGroup;
        }

        private void setIdStudentXGroup(int pIdStudentXGroup)
        {
            this.idStudentXGroup = pIdStudentXGroup;
        }
        //-----------------------------------------------------------------------//
        public int getIdGroup()
        {
            return this.idGroup;
        }

        private void setIdGroup(int pIdGroup)
        {
            this.idGroup = pIdGroup;
        }
        //-----------------------------------------------------------------------//
        public int getIdStudent()
        {
            return this.idStudent;
        }

        private void setIdStudent(int pIdStudent)
        {
            this.idStudent = pIdStudent;
        }
        //-----------------------------------------------------------------------//
        public float getTotalGrade()
        {
            return this.totalGrade;
        }

        private void setTotalGrade(float pTotalGrade)
        {
            this.totalGrade = pTotalGrade;
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
        public void show()
        {
            Console.WriteLine("IdStudentXGroup: ", this.getIdStudentXGroup());
            Console.WriteLine("IdGroup: ", this.getIdGroup());
            Console.WriteLine("IdStudent: ", this.getIdStudent());
            Console.WriteLine("TotalGrade: ", this.getTotalGrade());
            Console.WriteLine("IdStatusGroup: ", this.getIdStatusGroup());
            Console.WriteLine("-----------------------------------------------------");
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class GradeXGroup
    {
        //Atributos
        private int idGrade;
        private int idStudentXGroup;
        private int idEvaluation;
        private float result;

        //Constructor
        public GradeXGroup(int idGrade, int idStudentXGroup, int idEvaluation, float result)
        {
            setIdGrade(idGrade);
            setIdStudentXGroup(idStudentXGroup);
            setIdEvaluation(idEvaluation);
            setResult(result);
        }

        //Métodos
        public int getIdGrade()
        {
            return this.idGrade;
        }

        private void setIdGrade(int pIdGrade)
        {
            this.idGrade = pIdGrade;
        }
        //-----------------------------------------------------------------------//
        public int getIdStudentXGroup()
        {
            return this.idStudentXGroup;
        }

        private void setIdStudentXGroup(int pIdStudentXGroup)
        {
            this.idStudentXGroup = pIdStudentXGroup;
        }
        //-----------------------------------------------------------------------//
        public int getIdEvaluation()
        {
            return this.idEvaluation;
        }

        private void setIdEvaluation(int pIdEvaluation)
        {
            this.idEvaluation = pIdEvaluation;
        }
        //-----------------------------------------------------------------------//
        public float getResult()
        {
            return this.result;
        }

        private void setResult(float pResult)
        {
            this.result = pResult;
        }
        //-----------------------------------------------------------------------//
        public void show()
        {
            Console.WriteLine("IdGrade:", this.getIdGrade());
            Console.WriteLine("IdStudentXGroup:", this.getIdStudentXGroup());
            Console.WriteLine("Evaluation:", this.getIdEvaluation());
            Console.WriteLine("Result:", this.getResult());
            Console.WriteLine("-----------------------------------------------------");
        }
    }
}

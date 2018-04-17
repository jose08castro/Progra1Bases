using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class EvaluationConfig
    {
        //Atributos
        private int idEvaluationConfig;
        private int idItem;
        private int idGroup;
        private int number;
        private float percentage;
        private string constant;

        //Constructor
        public EvaluationConfig(int idEvaluationConfig, int idItem, int idGroup, int number, float percentage, string constant)
        {
            setIdEvaluationConfig(idEvaluationConfig);
            setIdItem(idItem);
            setIdGroup(idGroup);
            setNumber(number);
            setPercentage(percentage);
            setConstant(constant);
        }

        //Métodos
        public int getIdEvaluationConfig()
        {
            return this.idEvaluationConfig;
        }

        private void setIdEvaluationConfig(int pIdEvaluationConfig)
        {
            this.idEvaluationConfig = pIdEvaluationConfig;
        }
        //-----------------------------------------------------------------------//
        public int getIdItem()
        {
            return this.idItem;
        }

        private void setIdItem(int pIdItem)
        {
            this.idItem = pIdItem;
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
        public int getNumber()
        {
            return this.number;
        }

        private void setNumber(int pNumber)
        {
            this.number = pNumber;
        }
        //-----------------------------------------------------------------------//
        public float getPercentage()
        {
            return this.percentage;
        }

        private void setPercentage(float pPercentage)
        {
            this.percentage = pPercentage;
        }
        //-----------------------------------------------------------------------//
        public string getConstant()
        {
            return this.constant;
        }

        private void setConstant(string pConstant)
        {
            this.constant = pConstant;
        }
        //-----------------------------------------------------------------------//
        public void show()
        {
            Console.WriteLine("IEvaluationConfig: ", this.getIdEvaluationConfig());
            Console.WriteLine("IdItem: ", this.getIdItem());
            Console.WriteLine("IdGroup: ", this.getIdGroup());
            Console.WriteLine("Number: ", this.getNumber());
            Console.WriteLine("Percentage: ", this.getPercentage());
            Console.WriteLine("Constant: ", this.getConstant());
            Console.WriteLine("-----------------------------------------------------");
        }
    }
}

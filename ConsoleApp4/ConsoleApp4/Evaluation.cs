using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class Evaluation
    {
        //Atributos
        private int idEvaluation;
        private int idEvaluationConfig;
        private string name;
        private string date;
        private float percentage;
        private string description;

        //Constructor
        public Evaluation(int idEvaluation, int idEvaluationConf, string name, string date, float percentage, string description)
        {
            setIdEvaluation(idEvaluation);
            setIdEvaluationConfig(idEvaluationConfig);
            setName(name);
            setDate(date);
            setPercentage(percentage);
            setDescription(description);

        }

        //Métodos
        public int getIdEvaluation()
        {
            return this.idEvaluation;
        }

        private void setIdEvaluation(int pIdEvaluation)
        {
            this.idEvaluation = pIdEvaluation;
        }
        //-----------------------------------------------------------------------//
        public int getIdEvaluationConfig()
        {
            return this.idEvaluationConfig;
        }

        private void setIdEvaluationConfig(int pIdEvaluationConfig)
        {
            this.idEvaluationConfig = pIdEvaluationConfig;
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
        public string getDate()
        {
            return this.date;
        }

        private void setDate(string pDate)
        {
            this.date = pDate;
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
        public string getDescription()
        {
            return this.description;
        }

        private void setDescription(string pDescription)
        {
            this.description = pDescription;
        }
        //-----------------------------------------------------------------------//
        public void show()
        {
            Console.WriteLine("IdEvaluation: ", this.getIdEvaluation());
            Console.WriteLine("IdEvaluationConfig: ", this.getIdEvaluationConfig());
            Console.WriteLine("Name: ", this.getName());
            Console.WriteLine("Date: ", this.getDate());
            Console.WriteLine("Percentage: ", this.getPercentage());
            Console.WriteLine("Description: ", this.getDescription());
            Console.WriteLine("-----------------------------------------------------");
        }
    }
}

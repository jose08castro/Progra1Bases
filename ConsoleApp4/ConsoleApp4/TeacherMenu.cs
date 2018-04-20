using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace ConsoleApp4
{
    class TeacherMenu
    {
        //Funciones de obtener datos
        private static List<Term> setListTerm() {
            //Activar Conexión
            Connection connection = new Connection("Aquí va el nombre de la base, pero ahorita está directo a mi Base");
            connection.openConnection();
            //Variables
            List<Term> listTerm = new List<Term>();
            DataTable tabTerm = connection.showData("Periodo_Lectivo");
            DataRow rowTerm;
            Term term;
            //Ejecución
            for (int i = 0; i < tabTerm.Rows.Count; i++) {
                rowTerm = tabTerm.Rows[i];
                term = new Term(int.Parse(rowTerm["IdPeriodo"].ToString()), rowTerm["Inicio"].ToString(), rowTerm["Fin"].ToString(), rowTerm["Activo"].ToString());
                listTerm.Add(term);
                //Console.Write(listTerm[i].getStart());
            }
            return listTerm;
        }

        private static List<Group> setListGroup() {
            //Activar Conexión
            Connection connection = new Connection("Aquí va el nombre de la base, pero ahorita está directo a mi Base");
            connection.openConnection();
            //Variables
            List<Group> listGroup = new List<Group>();
            DataTable tabGroup = connection.showData("Grupo");
            DataRow rowGroup;
            Group group;
            //Ejecución
            for (int i = 0; i < tabGroup.Rows.Count; i++) {
                rowGroup = tabGroup.Rows[i];
                group = new Group(int.Parse(rowGroup["IdGrupo"].ToString()), int.Parse(rowGroup["IdPeriodo"].ToString()), rowGroup["Codigo"].ToString(), int.Parse(rowGroup["IdProfesor"].ToString()), rowGroup["Nombre"].ToString(), int.Parse(rowGroup["Status"].ToString()));
                listGroup.Add(group);
            }
            return listGroup;
        }

        private static List<Student> setListStudent() {
            //Activar Conexión
            Connection connection = new Connection("Aquí va el nombre de la base, pero ahorita está directo a mi Base");
            connection.openConnection();
            //Variables
            List<Student> listStudent = new List<Student>();
            DataTable tabStudent = connection.showData("Estudiante");
            DataRow rowStudent;
            Student student;
            //Ejecución
            for (int i = 0; i < tabStudent.Rows.Count; i++)
            {
                rowStudent = tabStudent.Rows[i];
                student = new Student(int.Parse(rowStudent["IdEstudiante"].ToString()), rowStudent["Nombre"].ToString(), rowStudent["Email"].ToString(), rowStudent["Password"].ToString(), int.Parse(rowStudent["Telefono"].ToString()), rowStudent["Estado"].ToString());
                listStudent.Add(student);
            }
            return listStudent;
        }

        private static List<StudentXGroup> setListStudentXGroup()
        {
            //Activar Conexión
            Connection connection = new Connection("Aquí va el nombre de la base, pero ahorita está directo a mi Base");
            connection.openConnection();
            //Variables
            List<StudentXGroup> listStudentXGroup = new List<StudentXGroup>();
            DataTable tabStudentXGroup = connection.showData("EstudiantesXGrupo");
            DataRow rowStudentXGroup;
            StudentXGroup studentXGroup;
            //Ejecución
            for (int i = 0; i < tabStudentXGroup.Rows.Count; i++)
            {
                rowStudentXGroup = tabStudentXGroup.Rows[i];
                studentXGroup = new StudentXGroup(int.Parse(rowStudentXGroup["Id"].ToString()), int.Parse(rowStudentXGroup["IdGrupo"].ToString()), int.Parse(rowStudentXGroup["IdEstudiante"].ToString()), float.Parse(rowStudentXGroup["NotaTotal"].ToString()), int.Parse(rowStudentXGroup["Status"].ToString()));
                listStudentXGroup.Add(studentXGroup);
            }
            return listStudentXGroup;
        }

        private static List<GradeXGroup> setListGradeXGroup()
        {
            //Activar Conexión
            Connection connection = new Connection("Aquí va el nombre de la base, pero ahorita está directo a mi Base");
            connection.openConnection();
            //Variables
            List<GradeXGroup> listGradeXGroup = new List<GradeXGroup>();
            DataTable tabGradeXGroup = connection.showData("NotasXGrupo");
            DataRow rowGradeXGroup;
            GradeXGroup gradeXGroup;
            //Ejecución
            for (int i = 0; i < tabGradeXGroup.Rows.Count; i++)
            {
                rowGradeXGroup = tabGradeXGroup.Rows[i];
                gradeXGroup = new GradeXGroup(int.Parse(rowGradeXGroup["Id"].ToString()), int.Parse(rowGradeXGroup["IdEstudiantesXGrupo"].ToString()), int.Parse(rowGradeXGroup["IdEvaluacion"].ToString()), float.Parse(rowGradeXGroup["Obtenido"].ToString()));
                listGradeXGroup.Add(gradeXGroup);
            }
            return listGradeXGroup;
        }

        private static List<EvaluationConfig> setListEvaluationConfig()
        {
            //Activar Conexión
            Connection connection = new Connection("Aquí va el nombre de la base, pero ahorita está directo a mi Base");
            connection.openConnection();
            //Variables
            List<EvaluationConfig> listEvaluationConfig = new List<EvaluationConfig>();
            DataTable tabEvaluationConfig = connection.showData("Config_Evaluacion");
            DataRow rowEvaluationConfig;
            EvaluationConfig evaluationConfig;
            //Ejecución
            for (int i = 0; i < tabEvaluationConfig.Rows.Count; i++)
            {
                rowEvaluationConfig = tabEvaluationConfig.Rows[i];
                evaluationConfig = new EvaluationConfig(int.Parse(rowEvaluationConfig["IdConfig_Evaluacion"].ToString()), int.Parse(rowEvaluationConfig["IdRubro"].ToString()), int.Parse(rowEvaluationConfig["IdGrupo"].ToString()), int.Parse(rowEvaluationConfig["Numero"].ToString()), float.Parse(rowEvaluationConfig["Porcentage"].ToString()), rowEvaluationConfig["Constante"].ToString());
                listEvaluationConfig.Add(evaluationConfig);
            }
            return listEvaluationConfig;
        }

        private static List<Evaluation> setListEvaluation()
        {
            //Activar Conexión
            Connection connection = new Connection("Aquí va el nombre de la base, pero ahorita está directo a mi Base");
            connection.openConnection();
            //Variables
            List<Evaluation> listEvaluation = new List<Evaluation>();
            DataTable tabEvaluation = connection.showData("Evaluacion");
            DataRow rowEvaluation;
            Evaluation evaluation;
            //Ejecución
            for (int i = 0; i < tabEvaluation.Rows.Count; i++)
            {
                rowEvaluation = tabEvaluation.Rows[i];
                evaluation = new Evaluation(int.Parse(rowEvaluation["IdEvaluacion"].ToString()), int.Parse(rowEvaluation["IdConfig_Evaluacion"].ToString()), rowEvaluation["Nombre"].ToString(), rowEvaluation["Fecha"].ToString(), float.Parse(rowEvaluation["Porcentaje"].ToString()), rowEvaluation["Descripcion"].ToString());
                listEvaluation.Add(evaluation);
            }
            return listEvaluation;
        }

        private static List<Item> setListItem()
        {
            //Activar Conexión
            Connection connection = new Connection("Aquí va el nombre de la base, pero ahorita está directo a mi Base");
            connection.openConnection();
            //Variables
            List<Item> listItem = new List<Item>();
            DataTable tabItem = connection.showData("Rubro");
            DataRow rowItem;
            Item item;
            //Ejecución
            for (int i = 0; i < tabItem.Rows.Count; i++)
            {
                rowItem = tabItem.Rows[i];
                item = new Item(int.Parse(rowItem["IdRubro"].ToString()), rowItem["Nombre"].ToString());
                listItem.Add(item);
            }
            return listItem;
        }


        //------------------------------------------------------------------------------------------------------//

        //Funciones de Acomodar Datos
        public List<Term> sortTermList(int idTeacher) {//Obtiene todos los período que pertenecen a un profesor
            List<Term> listTerm = setListTerm();
            List<Group> listGroup = setListGroup();
            List<Term> listToReturn = new List<Term>();
            //-------------------------------------------------------------//
            for (int i = 0; i < listGroup.Count; i++)
            {
                if (listGroup[i].getIdTeacher().Equals(idTeacher))
                {
                    listToReturn.Add(listTerm[listGroup[i].getIdTerm() - 1]);
                }
            }
            return listToReturn.Distinct().ToList();
        }

        public List<Group> sortGroupList(int idTeacher, int idTerm) {//Obtiene todos los grupos que pertenecen a un período
            List<Group> listGroup = setListGroup();
            List<Group> listToReturn = new List<Group>();
            //-------------------------------------------------------------//
            for (int i = 0; i < listGroup.Count; i++)
            {
                if (listGroup[i].getIdTerm().Equals(idTerm) && listGroup[i].getIdTeacher().Equals(idTeacher))
                {
                    listToReturn.Add(listGroup[i]);
                }
            }
            return listToReturn.Distinct().ToList();
        }

        public List<Student> sortStudentList(int idGroup) {//Obtiene todos los estudiantes que pertenecen a un grupo
            List<Student> listStudent = setListStudent();
            List<StudentXGroup> listStudentXGroup = setListStudentXGroup();
            List<Student> listToReturn = new List<Student>();
            //-------------------------------------------------------------//
            for (int i = 0; i < listStudentXGroup.Count; i++) {
                if (listStudentXGroup[i].getIdGroup().Equals(idGroup)) {
                    listToReturn.Add(listStudent[listStudentXGroup[i].getIdStudent() - 1]);
                }
            }
            return listToReturn.Distinct().ToList();
        }

        public List<GradeXStudent> sortGradeXStudentList(int idStudent){
            List<GradeXStudent> listToReturn = new List<GradeXStudent>();

            return listToReturn.Distinct().ToList();
        }

        //------------------------------------------------------------------------------------------------------//

        //Función de Combinar
        public void show(){
            //Producto Final
            List<Student> listStudent = new List<Student>(); 
            //------------------------------------------------
            int idTeacher = 4;
            List<Term> dataTerm = sortTermList(idTeacher);
            List<Group> dataGroup;
            List<Student> dataStudent;
            List<GradeXStudent> dataGradeXStudent;

            List<NestClassSxLG> listNestClassSxLG = new List<NestClassSxLG>();
            List<NestClassGxLS> listNestClassGxLS = new List<NestClassGxLS>();
            List<NestClassTxLG> listNestClassTxLG = new List<NestClassTxLG>();
            List<NestClassTxLT> listNestClassTxLT = new List<NestClassTxLT>();
            //----------------------------------------------------------------
            //listNestClassTxLT.Clear();
            for (int i = 0; i < dataTerm.Count; i++){
                dataTerm[i].show();
                dataGroup = sortGroupList(idTeacher, dataTerm[i].getIdTerm());
                //listNestClassTxLG.Clear();
                for (int j = 0; j < dataGroup.Count; j++) {
                    dataGroup[j].show();
                    dataStudent = sortStudentList(dataGroup[j].getIdGroup());
                    //listNestClassGxLS.Clear();
                    for (int k = 0; k < dataStudent.Count; k++) {
                        dataStudent[k].show();
                        dataGradeXStudent = sortGradeXStudentList(dataStudent[k].getIdStudent());
                        //listNestClassSxLG.Clear();
                        for (int l = 0; l < dataGradeXStudent.Count; l++) {
                            NestClassSxLG nestClassSxLG = new NestClassSxLG(dataStudent[k], dataGradeXStudent);
                            listNestClassSxLG.Add(nestClassSxLG);
                        }
                        NestClassGxLS nestClassGxLS = new NestClassGxLS(dataGroup[j], listNestClassSxLG);
                        listNestClassGxLS.Add(nestClassGxLS);
                    }
                    NestClassTxLG nestClassTxLG = new NestClassTxLG(dataTerm[i], listNestClassGxLS);
                    listNestClassTxLG.Add(nestClassTxLG);
                }
            }
        }
    }
}
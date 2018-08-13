using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityLayer
{
    public class Physician
    {
        public string PhysicianId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string DepartmentId { get; set; }
        public string EducationalQualification { get; set; }
        public float YearsOfExperience { get; set; }
        public string StateId { get; set; }
        public string PlanId { get; set; }


    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityLayer
{
   public class PatientDiagnosis
    {
        public int DiagnosisId { get; set; }
        public string Symptoms { get; set; }
        public string DiagnosisProvided { get; set; }
        public string AdministeredBy { get; set; }
        public string DateOfDiagnosis { get; set; }
        public string FollowUpRequired { get; set; }
        public string DateOfFollowUp { get; set; }
        public int BillId { get; set; }


    }
}

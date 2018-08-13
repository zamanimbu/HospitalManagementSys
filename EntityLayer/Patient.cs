using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityLayer
{
    public class Patient
    {
        public int PatientId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string DateOfBirth { get; set; }
        public int PhoneNumber { get; set; }
        public string Email { get; set; }
        public string State { get; set; }
        public string Plan { get; set; }
    }
}

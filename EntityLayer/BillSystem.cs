using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityLayer
{
    public class BillSystem
    {
        public int BillId { get; set; }
        public float BillAmount { get; set; }
        public string CardNumber { get; set; }
        public string ModeOfPayment { get; set; }
    }
}

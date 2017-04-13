using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace rf_demod
{
    class TimeStampLog
    {
        List<string> ellapsedms = new List<string>();
        Stopwatch sw = Stopwatch.StartNew();

        public void reset()
        {
            ellapsedms.Clear();
        }
        public void start()
        {
            sw.Restart();
        }
        public void stop(string msg)
        {
            sw.Stop();
            ellapsedms.Add(msg + sw.ElapsedMilliseconds.ToString()+"[ms]");
        }
        public string[] getLog()
        {
            return ellapsedms.ToArray();
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace adc_capture
{
    public partial class FormMain : Form
    {
        public FormMain()
        {
            InitializeComponent();
        }

        public static int SERVER_PORT = 12345;
        public static string SERVER_ADR = "192.168.56.101";

        private UInt32 read_uint(byte[] buf, UInt32 offset)
        {
            UInt32 ret = 0;
            ret += buf[offset];
            ret += ((UInt32)buf[offset + 1]) << 8;
            ret += ((UInt32)buf[offset + 2]) << 16;
            ret += ((UInt32)buf[offset + 3]) << 24;
            return ret;
        }

        static UInt32 MB = 1024 * 1024;

        private void button_capture_Click(object sender, EventArgs e)
        {
            TcpClient tcp;
            string ip = textBox_IP.Text;
            if (ip != null)
                tcp = new TcpClient(ip, SERVER_PORT);
            else
                tcp = new TcpClient(SERVER_ADR, SERVER_PORT);

            byte[] buf = new byte[256*MB];
            using (NetworkStream ns = tcp.GetStream())
            {
                Stopwatch sw = Stopwatch.StartNew();
                int total = 0;
                while (total < buf.Length)
                {
                    total += ns.Read(buf, total, buf.Length-total);
                }
                sw.Stop();

                for (UInt32 i = 0; i < 256*MB; i += 4)
                {
                    UInt32 val = read_uint(buf, i);
                    if (val != i/4)
                    {
                        MessageBox.Show("val="+val.ToString("X8")+" i="+i.ToString("X8"));
                    }
                }
                MessageBox.Show(sw.ElapsedMilliseconds + "[ms]");
            }
        }
    }
}

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

        private void button_capture_Click(object sender, EventArgs e)
        {
            TcpClient tcp;
            string ip = textBox_IP.Text;
            if (ip != null)
                tcp = new TcpClient(ip, SERVER_PORT);
            else
                tcp = new TcpClient(SERVER_ADR, SERVER_PORT);

            byte[] buf = new byte[1024*1024];
            using (NetworkStream ns = tcp.GetStream())
            {
                uint i = 0;
                Stopwatch sw = Stopwatch.StartNew();
                while (true)
                {
                    int total = 0;
                    while (total < buf.Length)
                    {
                        int len = ns.Read(buf, 0, buf.Length-total);  // Read 1MBytes
                        total += len;
                    }
                    i++;
                    if (i >= 256)    // 256MBytes
                        break;
                }
                sw.Stop();
                MessageBox.Show(sw.ElapsedMilliseconds + "[ms]");
            }
        }
    }
}

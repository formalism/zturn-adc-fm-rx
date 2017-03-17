using MathNet.Numerics;
using MathNet.Numerics.IntegralTransforms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Net.Sockets;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;

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

        private byte[] get_raw_values()
        {
            int size = (int)(numericUpDown_size.Value * MB);
            TcpClient tcp;
            string ip = textBox_IP.Text;
            if (ip != null)
                tcp = new TcpClient(ip, SERVER_PORT);
            else
                tcp = new TcpClient(SERVER_ADR, SERVER_PORT);

            byte[] buf = new byte[size];
            using (NetworkStream ns = tcp.GetStream())
            {
                Stopwatch sw = Stopwatch.StartNew();
                byte[] lenstr = System.Text.Encoding.ASCII.GetBytes(size.ToString("X8"));   // send how many bytes to receive
                ns.Write(lenstr, 0, lenstr.Length);

                int total = 0;
                while (total < size)
                {
                    total += ns.Read(buf, total, size - total);
                }
                sw.Stop();
            }
            /*
                            for (UInt32 i = 0; i < size; i += 4)
                            {
                                UInt32 val = read_uint(buf, i);
                                if (val != i/4)
                                {
                                    MessageBox.Show("val="+val.ToString("X8")+" i="+i.ToString("X8"));
                                }
                            }*/
            //                MessageBox.Show(sw.ElapsedMilliseconds + "[ms]");
            return buf;
        }

        int[] decode_values(byte[] buf, int len)
        {
            int i, j;
            int[] data = new int[len + 4];  // allocate more

            // decode raw data to integer values
            for (i = 0, j = 0; i < len; i += 5, j++)
            {
                uint b0 = buf[j * 8 + 0];
                uint b1 = buf[j * 8 + 1];
                uint b2 = buf[j * 8 + 2];
                uint b3 = buf[j * 8 + 3];
                uint b4 = buf[j * 8 + 4];
                uint b5 = buf[j * 8 + 5];
                uint b6 = buf[j * 8 + 6];
                uint b7 = buf[j * 8 + 7];
                data[i] = (int)(b0 | ((b1 & 0xF) << 8));
                data[i + 1] = (int)(((b1 & 0xF0u) >> 4) | (b2 << 4));
                data[i + 2] = (int)(b3 | ((b4 & 0xF) << 8));
                data[i + 3] = (int)(((b4 & 0xF0u) >> 4) | (b5 << 4));
                data[i + 4] = (int)(b6 | ((b7 & 0xF) << 8));
            }

            for (i = 0; i < len; i++)
                if ((data[i] & 0x800) != 0)    // negative
                    data[i] = data[i] - 0x1000;

            return data;
        }

        private void button_capture_Click(object sender, EventArgs e)
        {
            byte[] buf = get_raw_values();

            chart.Series.Clear();
            chart.ChartAreas.Clear();
            chart.ChartAreas.Add(new ChartArea("data"));
            chart.ChartAreas.Add(new ChartArea("FFT"));

            int[] data = decode_values(buf, 4096);
            Complex[] data2 = new Complex[4096];

            Series dat = new Series();
            dat.ChartType = SeriesChartType.Line;
            dat.Color = Color.Aqua;
            dat.BorderWidth = 1;
            dat.LegendText = "data";
        
            for (int i = 0; i < 512; i++)
            {
                dat.Points.AddXY(i, data[i]);
            }
            dat.ChartArea = "data";
            chart.Series.Add(dat);

            var window = Window.Hamming(4096);
            for (int i = 0; i < 4096; i++)
            {
                data2[i] = new Complex(data[i] * (float)window[i], 0.0f);
            }
            Fourier.Radix2Forward(data2, FourierOptions.Default);

            dat = new Series();
            dat.ChartType = SeriesChartType.Line;
            dat.Color = Color.Green;
            dat.BorderWidth = 1;
            dat.LegendText = "FFT";
            float s = 4096.0f / (40.0f);    // 40MHz
            for (int i = 0; i < 4096/2; i++)
            {
                Complex val = data2[i];
                dat.Points.AddXY((float)i / s, val.Real * val.Real + val.Imaginary * val.Imaginary);
            }
            dat.ChartArea = "FFT";
            chart.Series.Add(dat);
        }

        private void FormMain_Load(object sender, EventArgs e)
        {

        }
    }
}

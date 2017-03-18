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
        private NetworkStream ns = null;
        private TcpClient tcp = null;

        private void open_connection()
        {
            string ip = textBox_IP.Text;
            if (ip != null)
                tcp = new TcpClient(ip, SERVER_PORT);
            else
                tcp = new TcpClient(SERVER_ADR, SERVER_PORT);
            ns = tcp.GetStream();
        }

        private int set_capture_size()
        {
            int size = (int)(numericUpDown_size.Value * MB);
            if (tcp == null)
                open_connection();

            byte[] lenstr = System.Text.Encoding.ASCII.GetBytes(size.ToString("X8"));   // send how many bytes to receive
            ns.Write(lenstr, 0, lenstr.Length);
            return size;
        }

        private void get_raw_values(byte[] buf)
        {
            int size = buf.Length;

            Stopwatch sw = Stopwatch.StartNew();
            int total = 0;
            while (total < size)
            {
                total += ns.Read(buf, total, size - total);
            }
            sw.Stop();
            //                MessageBox.Show(sw.ElapsedMilliseconds + "[ms]");
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

        private bool running = false;
        private static int FFT_POINTS = 4096;
        private static float SAMPLE_FREQ = 40.0f;

        private void capture_and_display()
        {
            int size = set_capture_size();
            byte[] buf = new byte[size];

            while (running)
            {
                get_raw_values(buf);

                int[] data = decode_values(buf, FFT_POINTS);
                Complex[] data2 = new Complex[FFT_POINTS];

                var window = Window.Hamming(FFT_POINTS);
                for (int i = 0; i < FFT_POINTS; i++)
                {
                    data2[i] = new Complex(data[i] * (float)window[i], 0.0f);
                }
                Fourier.Radix2Forward(data2, FourierOptions.Default);

                chart.Invoke(new Action(() =>
                {
                    chart.Series.Clear();
                    chart.ChartAreas.Clear();
                    chart.ChartAreas.Add(new ChartArea("data"));
                    chart.ChartAreas.Add(new ChartArea("FFT"));

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

                    dat = new Series();
                    dat.ChartType = SeriesChartType.Line;
                    dat.Color = Color.Green;
                    dat.BorderWidth = 1;
                    dat.LegendText = "FFT";
                    float s = SAMPLE_FREQ / (float)FFT_POINTS;
                    for (int i = 0; i < FFT_POINTS / 2; i++)
                    {
                        Complex val = data2[i];
                        dat.Points.AddXY((float)i * s, val.Real * val.Real + val.Imaginary * val.Imaginary);
                    }
                    dat.ChartArea = "FFT";
                    chart.Series.Add(dat);
                }));
            }
        }

        private void button_capture_Click(object sender, EventArgs e)
        {
            if (!running)
            {
                running = true;
                button_capture.Text = "Stop";
                Task.Factory.StartNew(() =>
                {
                    capture_and_display();
                });
            }else{
                running = false;
                button_capture.Text = "Capture";
            }
        }

        private void FormMain_Load(object sender, EventArgs e)
        {

        }

        private void FormMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            running = false;
            if (ns != null)
                ns.Close();
            if (tcp != null)
                tcp.Close();
        }
    }
}

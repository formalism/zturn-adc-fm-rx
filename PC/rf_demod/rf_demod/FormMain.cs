using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace rf_demod
{
    public partial class FormMain : Form
    {
        public FormMain()
        {
            InitializeComponent();
        }

        // http://dsp.jpn.org/dfdesign/fir/mado.shtml

        // FIR 6/25 6phase 51tap cutoff=0.04
        static double[] fir_coef_6over25 = new double[]
        {
            6.552081121128271e-19 ,
            -2.758320715660911e-04 ,
            -6.297342534957636e-04 ,
            -1.112298709801730e-03 ,
            -1.752031986783353e-03 ,
            -2.540700364858205e-03 ,
            -3.422175606507029e-03 ,
            -4.286815836594286e-03 ,
            -4.972834426792344e-03 ,
            -5.275302058508891e-03 ,
            -4.962486044567336e-03 ,
            -3.798269405458164e-03 ,
            -1.568529902784798e-03 ,
            1.891291929964146e-03 ,
            6.670557049765995e-03 ,
            1.276283946298361e-02 ,
            2.005312314264532e-02 ,
            2.831480531474018e-02 ,
            3.721754247983992e-02 ,
            4.634582995958356e-02 ,
            5.522702789511995e-02 ,
            6.336647205383988e-02 ,
            7.028646289000484e-02 ,
            7.556541295764632e-02 ,
            7.887331593519886e-02 ,
            8.000000000000000e-02 ,
            7.887331593519886e-02 ,
            7.556541295764632e-02 ,
            7.028646289000484e-02 ,
            6.336647205383988e-02 ,
            5.522702789511995e-02 ,
            4.634582995958356e-02 ,
            3.721754247983992e-02 ,
            2.831480531474018e-02 ,
            2.005312314264532e-02 ,
            1.276283946298361e-02 ,
            6.670557049765995e-03 ,
            1.891291929964146e-03 ,
            -1.568529902784798e-03 ,
            -3.798269405458164e-03 ,
            -4.962486044567336e-03 ,
            -5.275302058508891e-03 ,
            -4.972834426792344e-03 ,
            -4.286815836594286e-03 ,
            -3.422175606507029e-03 ,
            -2.540700364858205e-03 ,
            -1.752031986783353e-03 ,
            -1.112298709801730e-03 ,
            -6.297342534957636e-04 ,
            -2.758320715660911e-04 ,
            6.552081121128271e-19
        };
           
        // for 2/5 FIR 51tap (2phase) cutoff=0.2
        static double[] fir_coef_2over5 = new double[] {
            -1.247414986406201e-18 ,
            -1.054855475052850e-03 ,
            -7.683356183186423e-04 ,
            9.550734669726456e-04 ,
            1.973500327846110e-03 ,
            -2.617266600758345e-18 ,
            -3.261117480891941e-03 ,
            -2.565163221017817e-03 ,
            3.230405998797884e-03 ,
            6.511387630530369e-03 ,
            -6.203584686676173e-18 ,
            -9.812898494167341e-03 ,
            -7.356059669230699e-03 ,
            8.869742466528913e-03 ,
            1.723350616858374e-02 ,
            -1.063651762980754e-17 ,
            -2.475188274269755e-02 ,
            -1.839359791484775e-02 ,
            2.227039247428934e-02 ,
            4.416465243930284e-02 ,
            -1.422283571572536e-17 ,
            -7.137640997199889e-02 ,
            -6.035135634164929e-02 ,
            9.219698303850865e-02 ,
            3.016326153714955e-01 ,
            4.000000000000000e-01 ,
            3.016326153714955e-01 ,
            9.219698303850865e-02 ,
            -6.035135634164929e-02 ,
            -7.137640997199889e-02 ,
            -1.422283571572536e-17 ,
            4.416465243930284e-02 ,
            2.227039247428934e-02 ,
            -1.839359791484775e-02 ,
            -2.475188274269755e-02 ,
            -1.063651762980754e-17 ,
            1.723350616858374e-02 ,
            8.869742466528913e-03 ,
            -7.356059669230699e-03 ,
            -9.812898494167341e-03 ,
            -6.203584686676173e-18 ,
            6.511387630530369e-03 ,
            3.230405998797884e-03 ,
            -2.565163221017817e-03 ,
            -3.261117480891941e-03 ,
            -2.617266600758345e-18 ,
            1.973500327846110e-03 ,
            9.550734669726456e-04 ,
            -7.683356183186423e-04 ,
            -1.054855475052850e-03 ,
            -1.247414986406201e-18
        };

        private double[] cic(Int16[] dat, int N, int M)
        {
            double[] result = new double[dat.Length / M + 1024];
            Int64[] sums = new Int64[N];
            Int64[] diffs = new Int64[N];
            for (int i = 0, j = 0; i < dat.Length; i++)
            {
                Int64 sum = dat[i];
                for (int x = 0; x < N; x++)
                {
                    sum += sums[x];
                    sums[x] = sum;
                }
                if (i % M == 0)
                {
                    for (int x = 0; x < N; x++)
                    {
                        Int64 prev = diffs[x];
                        diffs[x] = sum;
                        sum -= prev;
                    }
                    result[j++] = sum;
                }
            }
            return result;
        }

        static double AM_TUNE_FREQ = 810 * 1000;        // Hz
        static double SAMPLE_FREQ = 40 * 1000 * 1000;

        private double[] fir(double[] dat, int N, int M, double[] coefs)
        {
            double[] result = new double[dat.Length * N / M + 1024];
            int p = 0;
            int i = 0, prod = 0;

            while (i < dat.Length - (2*M+coefs.Length))
            {
                i = (int)Math.Ceiling((float)(M * prod) / (float)N);
                prod++;

                double sum = 0.0f;
                for (int j = N - ((N - i) % N); j < coefs.Length; j += N)
                {
                    sum += dat[i + j] * coefs[j];
                }
                result[p++] = sum;
            }
            return result;
        }

        private void write_wave_header(BinaryWriter bw, UInt32 sz)
        {
            ushort formatID = 0x0001;
            ushort numCh = 0x0001;      // mono
            uint sampleRate = 48000;
            ushort bitwidth = 16;
            ushort blockSize = (ushort)(numCh * (bitwidth/8));
            bw.Write(System.Text.Encoding.ASCII.GetBytes("RIFF"));
            bw.Write(sz+36);
            bw.Write(System.Text.Encoding.ASCII.GetBytes("WAVEfmt "));
            bw.Write(0x00000010);       // linear PCM
            bw.Write(formatID);           // PCM
            bw.Write(numCh);
            bw.Write(sampleRate);
            bw.Write(sampleRate * 2 * numCh);       // data rate 16bit
            bw.Write(blockSize);
            bw.Write(bitwidth);
            bw.Write(System.Text.Encoding.ASCII.GetBytes("data"));
            bw.Write(sz);
        }

        private void am_demodulate(Int16[] dat, string wavefilename)
        {
            Int16[] i_dat = new Int16[dat.Length];
            Int16[] q_dat = new Int16[dat.Length];

            for (var i = 0; i < dat.Length; i++)
            {
                i_dat[i] = (Int16)(Math.Sin(((double)i) * Math.PI * 2.0 * AM_TUNE_FREQ / SAMPLE_FREQ) * ((double)dat[i]));
                q_dat[i] = (Int16)(Math.Cos(((double)i) * Math.PI * 2.0 * AM_TUNE_FREQ / SAMPLE_FREQ) * ((double)dat[i]));
            }

            // 40MHz -> (CIC 1/32) -> 1.25MHz -> (FIR 2/5) -> 500kHz -> (FIR 2/5) -> 200kHz -> (FIR 6/25) -> 48kHz
            double[] i_cic = cic(i_dat, 4, 32);
            double[] q_cic = cic(q_dat, 4, 32);
            double[] i_fir1 = fir(i_cic, 2, 5, fir_coef_2over5);
            double[] q_fir1 = fir(q_cic, 2, 5, fir_coef_2over5);
            double[] i_fir2 = fir(i_fir1, 2, 5, fir_coef_2over5);
            double[] q_fir2 = fir(q_fir1, 2, 5, fir_coef_2over5);
            double[] i_fir3 = fir(i_fir2, 6, 25, fir_coef_6over25);
            double[] q_fir3 = fir(q_fir2, 6, 25, fir_coef_6over25);

            FileStream fs = new FileStream(wavefilename, FileMode.CreateNew);
            BinaryWriter bw = new BinaryWriter(fs, Encoding.ASCII);
            write_wave_header(bw, (uint)i_fir3.Length * 2);
            double maxAmp = 0.0;
            for (var i = 0; i < i_fir3.Length; i++)
            {
                double val = Math.Sqrt(i_fir3[i] * i_fir3[i] + q_fir3[i] * q_fir3[i]);
                if (maxAmp < val)
                    maxAmp = val;
            }
            for (var i = 0; i < i_fir3.Length; i++)
            {
                double v = Math.Sqrt(i_fir3[i] * i_fir3[i] + q_fir3[i] * q_fir3[i]);
                short val = (short)((v / maxAmp) * (2 << 15) - (1<<15));
                bw.Write(val);
            }
            bw.Close();
            fs.Close();
        }

        private void button_am_Click(object sender, EventArgs e)
        {
            OpenFileDialog dlg = new OpenFileDialog();
            if (DialogResult.OK == dlg.ShowDialog())
            {
                AM_TUNE_FREQ = Convert.ToInt32(textBox_am_freq.Text) * 1000;
                FileStream fs = new FileStream(dlg.FileName, FileMode.Open);
                BinaryReader br = new BinaryReader(fs);
                Int16[] dat = new Int16[fs.Length / 2];
                for (var i = 0; i < dat.Length; i++)
                {
                    dat[i] = br.ReadInt16();
                }
                br.Close();
                fs.Close();
                am_demodulate(dat, dlg.FileName+".wav");
                MessageBox.Show("Done");
            }
        }
    }
}

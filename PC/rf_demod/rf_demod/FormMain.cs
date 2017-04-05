﻿using System;
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

        // FIR 6/25 6phase 255tap cutoff=0.02
        static double[] fir_coef_6over25 = new double[]
        {
            -4.986485019118435e-05 ,
            -2.537459624811725e-05 ,
            -2.388033333418007e-19 ,
            2.614592625603723e-05 ,
            5.293453914189696e-05 ,
            8.021296367680731e-05 ,
            1.077957833448971e-04 ,
            1.354574245933737e-04 ,
            1.629256331111350e-04 ,
            1.898764202901091e-04 ,
            2.159308270551792e-04 ,
            2.406538092770453e-04 ,
            2.635554950902913e-04 ,
            2.840950007672385e-04 ,
            3.016869197727031e-04 ,
            3.157105209272332e-04 ,
            3.255216081385278e-04 ,
            3.304669080028401e-04 ,
            3.299007649419394e-04 ,
            3.232038387190800e-04 ,
            3.098034184883191e-04 ,
            2.891948932651103e-04 ,
            2.609638530663876e-04 ,
            2.248082400180717e-04 ,
            1.805599263347001e-04 ,
            1.282050678621622e-04 ,
            6.790256917157093e-05 ,
            7.323682343972413e-19 ,
            -7.495367621239525e-05 ,
            -1.561991625949675e-04 ,
            -2.427622232631082e-04 ,
            -3.334538849936260e-04 ,
            -4.268758314027343e-04 ,
            -5.214312727485844e-04 ,
            -6.153414598948690e-04 ,
            -7.066678860666161e-04 ,
            -7.933400872665999e-04 ,
            -8.731888143364297e-04 ,
            -9.439842095955250e-04 ,
            -1.003478481889220e-03 ,
            -1.049452438934592e-03 ,
            -1.079765108306569e-03 ,
            -1.092405561450337e-03 ,
            -1.085545951815586e-03 ,
            -1.057594691472878e-03 ,
            -1.007248623024700e-03 ,
            -9.335429975740247e-04 ,
            -8.358980468894523e-04 ,
            -7.141609402009851e-04 ,
            -5.686419442850065e-04 ,
            -4.001436601450954e-04 ,
            -2.099822906158553e-04 ,
            6.407025579479959e-19 ,
            2.274324417792909e-04 ,
            4.694233837985764e-04 ,
            7.225788659919679e-04 ,
            9.830323240681269e-04 ,
            1.246485506077507e-03 ,
            1.508260461046260e-03 ,
            1.763362234963926e-03 ,
            2.006551681590506e-03 ,
            2.232427569493479e-03 ,
            2.435516947003727e-03 ,
            2.610372517979208e-03 ,
            2.751675587902176e-03 ,
            2.854342966260490e-03 ,
            2.913636061470619e-03 ,
            2.925270282538492e-03 ,
            2.885522770544481e-03 ,
            2.791336425695264e-03 ,
            2.640418174347369e-03 ,
            2.431329436681475e-03 ,
            2.163566810518230e-03 ,
            1.837631080324921e-03 ,
            1.455082792239770e-03 ,
            1.018582804663712e-03 ,
            5.319164276268083e-04 ,
            2.828767141751309e-18 ,
            -5.711309817160370e-04 ,
            -1.174352779874043e-03 ,
            -1.801503664714181e-03 ,
            -2.443453458605527e-03 ,
            -3.090192003982117e-03 ,
            -3.730935845558656e-03 ,
            -4.354252081797384e-03 ,
            -4.948198013390849e-03 ,
            -5.500474903826542e-03 ,
            -5.998593874880030e-03 ,
            -6.430051693868277e-03 ,
            -6.782513975052854e-03 ,
            -7.044003119618842e-03 ,
            -7.203088161511219e-03 ,
            -7.249073573774763e-03 ,
            -7.172184024871752e-03 ,
            -6.963742058899107e-03 ,
            -6.616335708996317e-03 ,
            -6.123973139939596e-03 ,
            -5.482221553457129e-03 ,
            -4.688327776758858e-03 ,
            -3.741318188832087e-03 ,
            -2.642075917015873e-03 ,
            -1.393393554209366e-03 ,
            -3.746172523250508e-18 ,
            1.531439588463638e-03 ,
            3.192351343964024e-03 ,
            4.972307920167895e-03 ,
            6.859111158136809e-03 ,
            8.838901504732022e-03 ,
            1.089629306809438e-02 ,
            1.301453277619398e-02 ,
            1.517568170447033e-02 ,
            1.736081626480617e-02 ,
            1.955024660709464e-02 ,
            2.172374928256541e-02 ,
            2.386081096030241e-02 ,
            2.594087977976942e-02 ,
            2.794362076659938e-02 ,
            2.984917163945443e-02 ,
            3.163839529453319e-02 ,
            3.329312527240576e-02 ,
            3.479640058939707e-02 ,
            3.613268645179185e-02 ,
            3.728807756376609e-02 ,
            3.825048098624463e-02 ,
            3.900977579999062e-02 ,
            3.955794716743171e-02 ,
            3.988919276850939e-02 ,
            4.000000000000000e-02 ,
            3.988919276850939e-02 ,
            3.955794716743171e-02 ,
            3.900977579999062e-02 ,
            3.825048098624463e-02 ,
            3.728807756376609e-02 ,
            3.613268645179185e-02 ,
            3.479640058939707e-02 ,
            3.329312527240576e-02 ,
            3.163839529453319e-02 ,
            2.984917163945443e-02 ,
            2.794362076659938e-02 ,
            2.594087977976942e-02 ,
            2.386081096030241e-02 ,
            2.172374928256541e-02 ,
            1.955024660709464e-02 ,
            1.736081626480617e-02 ,
            1.517568170447033e-02 ,
            1.301453277619398e-02 ,
            1.089629306809438e-02 ,
            8.838901504732022e-03 ,
            6.859111158136809e-03 ,
            4.972307920167895e-03 ,
            3.192351343964024e-03 ,
            1.531439588463638e-03 ,
            -3.746172523250508e-18 ,
            -1.393393554209366e-03 ,
            -2.642075917015873e-03 ,
            -3.741318188832087e-03 ,
            -4.688327776758858e-03 ,
            -5.482221553457129e-03 ,
            -6.123973139939596e-03 ,
            -6.616335708996317e-03 ,
            -6.963742058899107e-03 ,
            -7.172184024871752e-03 ,
            -7.249073573774763e-03 ,
            -7.203088161511219e-03 ,
            -7.044003119618842e-03 ,
            -6.782513975052854e-03 ,
            -6.430051693868277e-03 ,
            -5.998593874880030e-03 ,
            -5.500474903826542e-03 ,
            -4.948198013390849e-03 ,
            -4.354252081797384e-03 ,
            -3.730935845558656e-03 ,
            -3.090192003982117e-03 ,
            -2.443453458605527e-03 ,
            -1.801503664714181e-03 ,
            -1.174352779874043e-03 ,
            -5.711309817160370e-04 ,
            2.828767141751309e-18 ,
            5.319164276268083e-04 ,
            1.018582804663712e-03 ,
            1.455082792239770e-03 ,
            1.837631080324921e-03 ,
            2.163566810518230e-03 ,
            2.431329436681475e-03 ,
            2.640418174347369e-03 ,
            2.791336425695264e-03 ,
            2.885522770544481e-03 ,
            2.925270282538492e-03 ,
            2.913636061470619e-03 ,
            2.854342966260490e-03 ,
            2.751675587902176e-03 ,
            2.610372517979208e-03 ,
            2.435516947003727e-03 ,
            2.232427569493479e-03 ,
            2.006551681590506e-03 ,
            1.763362234963926e-03 ,
            1.508260461046260e-03 ,
            1.246485506077507e-03 ,
            9.830323240681269e-04 ,
            7.225788659919679e-04 ,
            4.694233837985764e-04 ,
            2.274324417792909e-04 ,
            6.407025579479959e-19 ,
            -2.099822906158553e-04 ,
            -4.001436601450954e-04 ,
            -5.686419442850065e-04 ,
            -7.141609402009851e-04 ,
            -8.358980468894523e-04 ,
            -9.335429975740247e-04 ,
            -1.007248623024700e-03 ,
            -1.057594691472878e-03 ,
            -1.085545951815586e-03 ,
            -1.092405561450337e-03 ,
            -1.079765108306569e-03 ,
            -1.049452438934592e-03 ,
            -1.003478481889220e-03 ,
            -9.439842095955250e-04 ,
            -8.731888143364297e-04 ,
            -7.933400872665999e-04 ,
            -7.066678860666161e-04 ,
            -6.153414598948690e-04 ,
            -5.214312727485844e-04 ,
            -4.268758314027343e-04 ,
            -3.334538849936260e-04 ,
            -2.427622232631082e-04 ,
            -1.561991625949675e-04 ,
            -7.495367621239525e-05 ,
            7.323682343972413e-19 ,
            6.790256917157093e-05 ,
            1.282050678621622e-04 ,
            1.805599263347001e-04 ,
            2.248082400180717e-04 ,
            2.609638530663876e-04 ,
            2.891948932651103e-04 ,
            3.098034184883191e-04 ,
            3.232038387190800e-04 ,
            3.299007649419394e-04 ,
            3.304669080028401e-04 ,
            3.255216081385278e-04 ,
            3.157105209272332e-04 ,
            3.016869197727031e-04 ,
            2.840950007672385e-04 ,
            2.635554950902913e-04 ,
            2.406538092770453e-04 ,
            2.159308270551792e-04 ,
            1.898764202901091e-04 ,
            1.629256331111350e-04 ,
            1.354574245933737e-04 ,
            1.077957833448971e-04 ,
            8.021296367680731e-05 ,
            5.293453914189696e-05 ,
            2.614592625603723e-05 ,
            -2.388033333418007e-19 ,
            -2.537459624811725e-05 ,
            -4.986485019118435e-05
        };
           
        // for 2/5 FIR 71tap (2phase) cutoff=0.1
        static double[] fir_coef_2over5 = new double[] {
            6.237074932031003e-19 ,
            4.504206171974968e-04 ,
            8.017078310315705e-04 ,
            9.136514825731257e-04 ,
            6.598637193110659e-04 ,
            -9.788646333135722e-19 ,
            -9.362219005640206e-04 ,
            -1.814785974898718e-03 ,
            -2.170546829686103e-03 ,
            -1.598327923623971e-03 ,
            1.973992826329629e-18 ,
            2.234161923672401e-03 ,
            4.238498390235892e-03 ,
            4.942883326089295e-03 ,
            3.544632888976663e-03 ,
            -3.411994729178070e-18 ,
            -4.709476564881011e-03 ,
            -8.734826181883638e-03 ,
            -9.983663264638728e-03 ,
            -7.036601910350430e-03 ,
            5.008056429063783e-18 ,
            9.116313902131152e-03 ,
            1.678505489221534e-02 ,
            1.912197364977820e-02 ,
            1.349507264820077e-02 ,
            -6.446058331912225e-18 ,
            -1.783435103156921e-02 ,
            -3.354304779640488e-02 ,
            -3.944787706794282e-02 ,
            -2.915254169699824e-02 ,
            7.441186524928280e-18 ,
            4.540247749992576e-02 ,
            9.923743311014128e-02 ,
            1.502463941743610e-01 ,
            1.867513843136312e-01 ,
            2.000000000000000e-01 ,
            1.867513843136312e-01 ,
            1.502463941743610e-01 ,
            9.923743311014128e-02 ,
            4.540247749992576e-02 ,
            7.441186524928280e-18 ,
            -2.915254169699824e-02 ,
            -3.944787706794282e-02 ,
            -3.354304779640488e-02 ,
            -1.783435103156921e-02 ,
            -6.446058331912225e-18 ,
            1.349507264820077e-02 ,
            1.912197364977820e-02 ,
            1.678505489221534e-02 ,
            9.116313902131152e-03 ,
            5.008056429063783e-18 ,
            -7.036601910350430e-03 ,
            -9.983663264638728e-03 ,
            -8.734826181883638e-03 ,
            -4.709476564881011e-03 ,
            -3.411994729178070e-18 ,
            3.544632888976663e-03 ,
            4.942883326089295e-03 ,
            4.238498390235892e-03 ,
            2.234161923672401e-03 ,
            1.973992826329629e-18 ,
            -1.598327923623971e-03 ,
            -2.170546829686103e-03 ,
            -1.814785974898718e-03 ,
            -9.362219005640206e-04 ,
            -9.788646333135722e-19 ,
            6.598637193110659e-04 ,
            9.136514825731257e-04 ,
            8.017078310315705e-04 ,
            4.504206171974968e-04 ,
            6.237074932031003e-19
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
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
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

        static double[] fir_coef_255tap_008 = new double[]
        {
                1.692963312556495e-04 ,
                9.753442581616795e-05 ,
                9.552133333672030e-19 ,
                -1.004992505054608e-04 ,
                -1.797182431927990e-04 ,
                -2.174662926775003e-04 ,
                -2.024614365299799e-04 ,
                -1.354574245933748e-04 ,
                -2.982993610151545e-05 ,
                9.071638020503609e-05 ,
                1.970532499805924e-04 ,
                2.612556378015815e-04 ,
                2.635554950902918e-04 ,
                1.979832380393349e-04 ,
                7.517482638520268e-05 ,
                -7.866924961999355e-05 ,
                -2.268530662524390e-04 ,
                -3.304669080028394e-04 ,
                -3.581428235649253e-04 ,
                -2.949480057774397e-04 ,
                -1.480133481422623e-04 ,
                5.294848344151100e-05 ,
                2.609638530663853e-04 ,
                4.222335772838912e-04 ,
                4.895181026390976e-04 ,
                4.352694845011861e-04 ,
                2.610026985585317e-04 ,
                2.929472937588965e-18 ,
                -2.881056195220986e-04 ,
                -5.303123356662127e-04 ,
                -6.581554685834398e-04 ,
                -6.262912191686222e-04 ,
                -4.268758314027382e-04 ,
                -9.546847386999147e-05 ,
                2.939888467796897e-04 ,
                6.448880204157134e-04 ,
                8.612561384964030e-04 ,
                8.731888143364315e-04 ,
                6.578540627923524e-04 ,
                2.500483637611610e-04 ,
                -2.615042274815016e-04 ,
                -7.524785437515493e-04 ,
                -1.092405561450334e-03 ,
                -1.178477086469113e-03 ,
                -9.651353350473600e-04 ,
                -4.812285217284996e-04 ,
                1.709217109296377e-04 ,
                8.358980468894545e-04 ,
                1.341333077974583e-03 ,
                1.541651745755660e-03 ,
                1.358529171912534e-03 ,
                8.071262276065090e-04 ,
                -2.562810231791984e-18 ,
                -8.742008110792345e-04 ,
                -1.593741009508975e-03 ,
                -1.958991912922166e-03 ,
                -1.846325805244584e-03 ,
                -1.246485506077504e-03 ,
                -2.761463148451479e-04 ,
                8.424734293061777e-04 ,
                1.831130531493743e-03 ,
                2.423540646482860e-03 ,
                2.435516947003725e-03 ,
                1.819145012065323e-03 ,
                6.856668984681024e-04 ,
                -7.112497190601387e-04 ,
                -2.030486634260575e-03 ,
                -2.925270282538489e-03 ,
                -3.132545851130610e-03 ,
                -2.547306107116917e-03 ,
                -1.261500393984743e-03 ,
                4.451503446880453e-04 ,
                2.163566810518221e-03 ,
                3.451428402763526e-03 ,
                3.944891771387069e-03 ,
                3.458194123686406e-03 ,
                2.044570989168643e-03 ,
                1.131506856700524e-17 ,
                -2.195303200996989e-03 ,
                -3.987049323727796e-03 ,
                -4.884077401613289e-03 ,
                -4.589280600527688e-03 ,
                -3.090192003982131e-03 ,
                -6.830943403236852e-04 ,
                2.080310903046235e-03 ,
                4.515605823326994e-03 ,
                5.971358124468579e-03 ,
                5.998593874880029e-03 ,
                4.481044902847019e-03 ,
                1.690077617266120e-03 ,
                -1.755235898106300e-03 ,
                -5.019767029505734e-03 ,
                -7.249073573774766e-03 ,
                -7.786178483844650e-03 ,
                -6.354942568630820e-03 ,
                -3.161056148122140e-03 ,
                1.121233804426501e-03 ,
                5.482221553457118e-03 ,
                8.805590971670762e-03 ,
                1.014313097232507e-02 ,
                8.970121396830575e-03 ,
                5.355901584280139e-03 ,
                1.498469009300203e-17 ,
                -5.886520497603279e-03 ,
                -1.083836346725252e-02 ,
                -1.348048145692103e-02 ,
                -1.288274416033482e-02 ,
                -8.838901504732015e-03 ,
                -1.994994401788992e-03 ,
                6.217893205023874e-03 ,
                1.384896006429286e-02 ,
                1.884703649463750e-02 ,
                1.955024660709464e-02 ,
                1.513908450941302e-02 ,
                5.945674816469620e-03 ,
                -6.463989672448501e-03 ,
                -1.947365672389025e-02 ,
                -2.984917163945443e-02 ,
                -3.434688678530819e-02 ,
                -3.038250085182185e-02 ,
                -1.662451557076751e-02 ,
                6.615507378742690e-03 ,
                3.728807756376609e-02 ,
                7.184183915301876e-02 ,
                1.057598539256723e-01 ,
                1.343033279308836e-01 ,
                1.533253760928581e-01 ,
                1.600000000000000e-01 ,
                1.533253760928581e-01 ,
                1.343033279308836e-01 ,
                1.057598539256723e-01 ,
                7.184183915301876e-02 ,
                3.728807756376609e-02 ,
                6.615507378742690e-03 ,
                -1.662451557076751e-02 ,
                -3.038250085182185e-02 ,
                -3.434688678530819e-02 ,
                -2.984917163945443e-02 ,
                -1.947365672389025e-02 ,
                -6.463989672448501e-03 ,
                5.945674816469620e-03 ,
                1.513908450941302e-02 ,
                1.955024660709464e-02 ,
                1.884703649463750e-02 ,
                1.384896006429286e-02 ,
                6.217893205023874e-03 ,
                -1.994994401788992e-03 ,
                -8.838901504732015e-03 ,
                -1.288274416033482e-02 ,
                -1.348048145692103e-02 ,
                -1.083836346725252e-02 ,
                -5.886520497603279e-03 ,
                1.498469009300203e-17 ,
                5.355901584280139e-03 ,
                8.970121396830575e-03 ,
                1.014313097232507e-02 ,
                8.805590971670762e-03 ,
                5.482221553457118e-03 ,
                1.121233804426501e-03 ,
                -3.161056148122140e-03 ,
                -6.354942568630820e-03 ,
                -7.786178483844650e-03 ,
                -7.249073573774766e-03 ,
                -5.019767029505734e-03 ,
                -1.755235898106300e-03 ,
                1.690077617266120e-03 ,
                4.481044902847019e-03 ,
                5.998593874880029e-03 ,
                5.971358124468579e-03 ,
                4.515605823326994e-03 ,
                2.080310903046235e-03 ,
                -6.830943403236852e-04 ,
                -3.090192003982131e-03 ,
                -4.589280600527688e-03 ,
                -4.884077401613289e-03 ,
                -3.987049323727796e-03 ,
                -2.195303200996989e-03 ,
                1.131506856700524e-17 ,
                2.044570989168643e-03 ,
                3.458194123686406e-03 ,
                3.944891771387069e-03 ,
                3.451428402763526e-03 ,
                2.163566810518221e-03 ,
                4.451503446880453e-04 ,
                -1.261500393984743e-03 ,
                -2.547306107116917e-03 ,
                -3.132545851130610e-03 ,
                -2.925270282538489e-03 ,
                -2.030486634260575e-03 ,
                -7.112497190601387e-04 ,
                6.856668984681024e-04 ,
                1.819145012065323e-03 ,
                2.435516947003725e-03 ,
                2.423540646482860e-03 ,
                1.831130531493743e-03 ,
                8.424734293061777e-04 ,
                -2.761463148451479e-04 ,
                -1.246485506077504e-03 ,
                -1.846325805244584e-03 ,
                -1.958991912922166e-03 ,
                -1.593741009508975e-03 ,
                -8.742008110792345e-04 ,
                -2.562810231791984e-18 ,
                8.071262276065090e-04 ,
                1.358529171912534e-03 ,
                1.541651745755660e-03 ,
                1.341333077974583e-03 ,
                8.358980468894545e-04 ,
                1.709217109296377e-04 ,
                -4.812285217284996e-04 ,
                -9.651353350473600e-04 ,
                -1.178477086469113e-03 ,
                -1.092405561450334e-03 ,
                -7.524785437515493e-04 ,
                -2.615042274815016e-04 ,
                2.500483637611610e-04 ,
                6.578540627923524e-04 ,
                8.731888143364315e-04 ,
                8.612561384964030e-04 ,
                6.448880204157134e-04 ,
                2.939888467796897e-04 ,
                -9.546847386999147e-05 ,
                -4.268758314027382e-04 ,
                -6.262912191686222e-04 ,
                -6.581554685834398e-04 ,
                -5.303123356662127e-04 ,
                -2.881056195220986e-04 ,
                2.929472937588965e-18 ,
                2.610026985585317e-04 ,
                4.352694845011861e-04 ,
                4.895181026390976e-04 ,
                4.222335772838912e-04 ,
                2.609638530663853e-04 ,
                5.294848344151100e-05 ,
                -1.480133481422623e-04 ,
                -2.949480057774397e-04 ,
                -3.581428235649253e-04 ,
                -3.304669080028394e-04 ,
                -2.268530662524390e-04 ,
                -7.866924961999355e-05 ,
                7.517482638520268e-05 ,
                1.979832380393349e-04 ,
                2.635554950902918e-04 ,
                2.612556378015815e-04 ,
                1.970532499805924e-04 ,
                9.071638020503609e-05 ,
                -2.982993610151545e-05 ,
                -1.354574245933748e-04 ,
                -2.024614365299799e-04 ,
                -2.174662926775003e-04 ,
                -1.797182431927990e-04 ,
                -1.004992505054608e-04 ,
                9.552133333672030e-19 ,
                9.753442581616795e-05 ,
                1.692963312556495e-04
        };

        // cutoff = 0.0625
        static double[] fir_coef_255tap_0625 = new double[]
        {
            -7.673191798460112e-05 ,
            -1.431587502105628e-04 ,
            -1.895353728006565e-04 ,
            -2.086112798057082e-04 ,
            -1.966510895704312e-04 ,
            -1.540759238722237e-04 ,
            -8.562811781732087e-05 ,
            1.242073860434699e-18 ,
            9.108056985302654e-05 ,
            1.742512612643474e-04 ,
            2.362755814761200e-04 ,
            2.659666381781650e-04 ,
            2.560242461124495e-04 ,
            2.045078986769790e-04 ,
            1.156788517478729e-04 ,
            -5.423576494062342e-19 ,
            -1.268180221407178e-04 ,
            -2.457008470083805e-04 ,
            -3.368473164667253e-04 ,
            -3.827942070338505e-04 ,
            -3.714680313764233e-04 ,
            -2.987254906802301e-04 ,
            -1.699031110854956e-04 ,
            -9.149393851806932e-19 ,
            1.877008524789638e-04 ,
            3.645289878945593e-04 ,
            5.005359877702303e-04 ,
            5.692726815212967e-04 ,
            5.525124132665210e-04 ,
            4.441253657143903e-04 ,
            2.523631748259983e-04 ,
            -1.017191784615988e-18 ,
            -2.779217541062351e-04 ,
            -5.386153643627636e-04 ,
            -7.378216865610880e-04 ,
            -8.369590353729566e-04 ,
            -8.100450433580014e-04 ,
            -6.492124508843733e-04 ,
            -3.677611789814834e-04 ,
            4.926590612135030e-18 ,
            4.024021100796316e-04 ,
            7.772769417558973e-04 ,
            1.061189447875307e-03 ,
            1.199727559932071e-03 ,
            1.157240048128728e-03 ,
            9.243609222285971e-04 ,
            5.218799925935790e-04 ,
            -1.741588213627593e-18 ,
            -5.672973026449397e-04 ,
            -1.092267744540927e-03 ,
            -1.486528229542140e-03 ,
            -1.675391950277253e-03 ,
            -1.611163806924864e-03 ,
            -1.283131514846307e-03 ,
            -7.223476346080421e-04 ,
            2.163434902734965e-18 ,
            7.808766266322138e-04 ,
            1.499524444617371e-03 ,
            2.035580835253487e-03 ,
            2.288555390185612e-03 ,
            2.195606675505071e-03 ,
            1.744603754490336e-03 ,
            9.799964238649682e-04 ,
            -2.603543390269180e-18 ,
            -1.055102662823435e-03 ,
            -2.022315845642182e-03 ,
            -2.740388537449318e-03 ,
            -3.075811197776026e-03 ,
            -2.946281746368787e-03 ,
            -2.337685223438023e-03 ,
            -1.311391204904232e-03 ,
            3.044734030079175e-18 ,
            1.408611682533885e-03 ,
            2.697231942527053e-03 ,
            3.651810779954122e-03 ,
            4.095795033227468e-03 ,
            3.920960837883393e-03 ,
            3.109589353666913e-03 ,
            1.743850040388522e-03 ,
            -3.469784934171917e-18 ,
            -1.872750950197091e-03 ,
            -3.586443867429432e-03 ,
            -4.857156815136508e-03 ,
            -5.450225138994774e-03 ,
            -5.220941256343668e-03 ,
            -4.144011188356843e-03 ,
            -2.326345802877527e-03 ,
            3.862104229553967e-18 ,
            2.505045495265341e-03 ,
            4.805444071428086e-03 ,
            6.520677376456877e-03 ,
            7.332975314672733e-03 ,
            7.041927151257223e-03 ,
            5.604938475350350e-03 ,
            3.156248458346515e-03 ,
            -4.206377722421292e-18 ,
            -3.423494220641465e-03 ,
            -6.595122999934834e-03 ,
            -8.991005793008504e-03 ,
            -1.016318569774062e-02 ,
            -9.815275928183823e-03 ,
            -7.861267143782383e-03 ,
            -4.457365735497734e-03 ,
            4.489166688109010e-18 ,
            4.912382982479831e-03 ,
            9.550986542073817e-03 ,
            1.315400950919250e-02 ,
            1.503763741988871e-02 ,
            1.470587204104798e-02 ,
            1.194355121901418e-02 ,
            6.878230350718096e-03 ,
            -4.699432452054946e-18 ,
            -7.866572960702044e-03 ,
            -1.563800244694529e-02 ,
            -2.208810069652229e-02 ,
            -2.599216938871171e-02 ,
            -2.628206695278501e-02 ,
            -2.219274177446373e-02 ,
            -1.338099880285151e-02 ,
            4.828967284745606e-18 ,
            1.728199500313575e-02 ,
            3.732346158689465e-02 ,
            5.860931612948186e-02 ,
            7.939842089957490e-02 ,
            9.790255272740873e-02 ,
            1.124761968039653e-01 ,
            1.217947767628126e-01 ,
            1.250000000000000e-01 ,
            1.217947767628126e-01 ,
            1.124761968039653e-01 ,
            9.790255272740873e-02 ,
            7.939842089957490e-02 ,
            5.860931612948186e-02 ,
            3.732346158689465e-02 ,
            1.728199500313575e-02 ,
            4.828967284745606e-18 ,
            -1.338099880285151e-02 ,
            -2.219274177446373e-02 ,
            -2.628206695278501e-02 ,
            -2.599216938871171e-02 ,
            -2.208810069652229e-02 ,
            -1.563800244694529e-02 ,
            -7.866572960702044e-03 ,
            -4.699432452054946e-18 ,
            6.878230350718096e-03 ,
            1.194355121901418e-02 ,
            1.470587204104798e-02 ,
            1.503763741988871e-02 ,
            1.315400950919250e-02 ,
            9.550986542073817e-03 ,
            4.912382982479831e-03 ,
            4.489166688109010e-18 ,
            -4.457365735497734e-03 ,
            -7.861267143782383e-03 ,
            -9.815275928183823e-03 ,
            -1.016318569774062e-02 ,
            -8.991005793008504e-03 ,
            -6.595122999934834e-03 ,
            -3.423494220641465e-03 ,
            -4.206377722421292e-18 ,
            3.156248458346515e-03 ,
            5.604938475350350e-03 ,
            7.041927151257223e-03 ,
            7.332975314672733e-03 ,
            6.520677376456877e-03 ,
            4.805444071428086e-03 ,
            2.505045495265341e-03 ,
            3.862104229553967e-18 ,
            -2.326345802877527e-03 ,
            -4.144011188356843e-03 ,
            -5.220941256343668e-03 ,
            -5.450225138994774e-03 ,
            -4.857156815136508e-03 ,
            -3.586443867429432e-03 ,
            -1.872750950197091e-03 ,
            -3.469784934171917e-18 ,
            1.743850040388522e-03 ,
            3.109589353666913e-03 ,
            3.920960837883393e-03 ,
            4.095795033227468e-03 ,
            3.651810779954122e-03 ,
            2.697231942527053e-03 ,
            1.408611682533885e-03 ,
            3.044734030079175e-18 ,
            -1.311391204904232e-03 ,
            -2.337685223438023e-03 ,
            -2.946281746368787e-03 ,
            -3.075811197776026e-03 ,
            -2.740388537449318e-03 ,
            -2.022315845642182e-03 ,
            -1.055102662823435e-03 ,
            -2.603543390269180e-18 ,
            9.799964238649682e-04 ,
            1.744603754490336e-03 ,
            2.195606675505071e-03 ,
            2.288555390185612e-03 ,
            2.035580835253487e-03 ,
            1.499524444617371e-03 ,
            7.808766266322138e-04 ,
            2.163434902734965e-18 ,
            -7.223476346080421e-04 ,
            -1.283131514846307e-03 ,
            -1.611163806924864e-03 ,
            -1.675391950277253e-03 ,
            -1.486528229542140e-03 ,
            -1.092267744540927e-03 ,
            -5.672973026449397e-04 ,
            -1.741588213627593e-18 ,
            5.218799925935790e-04 ,
            9.243609222285971e-04 ,
            1.157240048128728e-03 ,
            1.199727559932071e-03 ,
            1.061189447875307e-03 ,
            7.772769417558973e-04 ,
            4.024021100796316e-04 ,
            4.926590612135030e-18 ,
            -3.677611789814834e-04 ,
            -6.492124508843733e-04 ,
            -8.100450433580014e-04 ,
            -8.369590353729566e-04 ,
            -7.378216865610880e-04 ,
            -5.386153643627636e-04 ,
            -2.779217541062351e-04 ,
            -1.017191784615988e-18 ,
            2.523631748259983e-04 ,
            4.441253657143903e-04 ,
            5.525124132665210e-04 ,
            5.692726815212967e-04 ,
            5.005359877702303e-04 ,
            3.645289878945593e-04 ,
            1.877008524789638e-04 ,
            -9.149393851806932e-19 ,
            -1.699031110854956e-04 ,
            -2.987254906802301e-04 ,
            -3.714680313764233e-04 ,
            -3.827942070338505e-04 ,
            -3.368473164667253e-04 ,
            -2.457008470083805e-04 ,
            -1.268180221407178e-04 ,
            -5.423576494062342e-19 ,
            1.156788517478729e-04 ,
            2.045078986769790e-04 ,
            2.560242461124495e-04 ,
            2.659666381781650e-04 ,
            2.362755814761200e-04 ,
            1.742512612643474e-04 ,
            9.108056985302654e-05 ,
            1.242073860434699e-18 ,
            -8.562811781732087e-05 ,
            -1.540759238722237e-04 ,
            -1.966510895704312e-04 ,
            -2.086112798057082e-04 ,
            -1.895353728006565e-04 ,
            -1.431587502105628e-04 ,
            -7.673191798460112e-05
        };

        private double[] cic(Int32[] dat, int N, int M)
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

        static double SAMPLE_FREQ = 40 * 1000 * 1000;

        private double[] fir(double[] dat, int N, int M, double[] coefs)
        {
            double[] result = new double[dat.Length * N / M + 1024];
            int p = 0;
            int i = 0, prod = 0;

            while (i < dat.Length - (2*M+coefs.Length))
            {
                if (M * prod % N == 0)
                    i = M * prod / N;
                else
                    i = M * prod / N + 1;

                double sum = 0.0f;
                for (int j = N*i - M*prod, k = 0; j < coefs.Length; j += N, k++)
                {
                    sum += dat[i + k] * coefs[j];
                }
                result[p++] = sum;

                prod++;
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

        private Int32[] init_sin_table(int tune_freq)
        {
            List<Int32> sin = new List<Int32>();
            double ratio = ((double)tune_freq) / SAMPLE_FREQ;
            for (int i = 0; i < SAMPLE_FREQ/1000; i++)  // assume tune_freq and SAMPLE_FREQ are both dividable by 1000
            {
                sin.Add((Int32)(Math.Sin(i * Math.PI * 2.0 * ratio) * (1<<12)));
            }
            return sin.ToArray();
        }

        // s1.12
        private Int32[] init_cos_table(int tune_freq)
        {
            List<Int32> cos = new List<Int32>();
            double ratio = ((double)tune_freq) / SAMPLE_FREQ;
            for (int i = 0; i < SAMPLE_FREQ/1000; i++)
            {
                cos.Add((Int32)(Math.Cos(i * Math.PI * 2.0 * ratio) * (1<<12)));
            }
            return cos.ToArray();
        }

        private void mixer(int tune_freq, Int16[] dat, Int32[] i_dat, Int32[] q_dat)
        {
            Int32[] sin = init_sin_table(tune_freq);
            Int32[] cos = init_cos_table(tune_freq);
            int freq = ((int)SAMPLE_FREQ) / 1000;
            for (var i = 0; i < dat.Length; i++)
            {
                i_dat[i] = sin[i % freq] * dat[i];     // s11 * s1.12 -> s13.12
                q_dat[i] = cos[i % freq] * dat[i];

                i_dat[i] >>= 5;     // s13.12 -> s13.7
                q_dat[i] >>= 5;
            }
        }

        private void am_demodulate(int tune_freq, Int16[] dat, string wavefilename, Stopwatch sw, List<long> ellapsedms)
        {
            Int32[] i_dat = new Int32[dat.Length];
            Int32[] q_dat = new Int32[dat.Length];

            sw.Restart();
            mixer(tune_freq, dat, i_dat, q_dat);
            sw.Stop();
            ellapsedms.Add(sw.ElapsedMilliseconds);

            sw.Restart();
            // 40MHz -> (CIC 1/32) -> 1.25MHz -> (FIR 2/5) -> 500kHz -> (FIR 2/5) -> 200kHz -> (FIR 6/25) -> 48kHz
            double[] i_cic = cic(i_dat, 4, 32);
            double[] q_cic = cic(q_dat, 4, 32); // 1.25MHz
            sw.Stop();
            ellapsedms.Add(sw.ElapsedMilliseconds);

            sw.Restart();
            double[] i_fir1 = fir(i_cic, 2, 5, fir_coef_255tap_0625);   // 500kHz (cutoff 156.25kHz)
            double[] q_fir1 = fir(q_cic, 2, 5, fir_coef_255tap_0625);
            double[] i_fir2 = fir(i_fir1, 2, 5, fir_coef_255tap_0625);  // 200kHz (cutoff 62.5kHz)
            double[] q_fir2 = fir(q_fir1, 2, 5, fir_coef_255tap_0625);
            double[] i_fir3 = fir(i_fir2, 3, 5, fir_coef_255tap_008);   // 120kHz (cutoff 48kHz)
            double[] q_fir3 = fir(q_fir2, 3, 5, fir_coef_255tap_008);
            double[] i_fir4 = fir(i_fir3, 2, 5, fir_coef_255tap_0625); // 48kHz (cutoff 15kHz)
            double[] q_fir4 = fir(q_fir3, 2, 5, fir_coef_255tap_0625);
            sw.Stop();
            ellapsedms.Add(sw.ElapsedMilliseconds);

            FileStream fs = new FileStream(wavefilename, FileMode.CreateNew);
            BinaryWriter bw = new BinaryWriter(fs, Encoding.ASCII);
            write_wave_header(bw, (uint)i_fir4.Length * 2);
            double maxAmp = 0.0;
            for (var i = 0; i < i_fir4.Length; i++)
            {
                double val = Math.Sqrt(i_fir4[i] * i_fir4[i] + q_fir4[i] * q_fir4[i]);
                if (maxAmp < val)
                    maxAmp = val;
            }
            for (var i = 0; i < i_fir4.Length; i++)
            {
                double v = Math.Sqrt(i_fir4[i] * i_fir4[i] + q_fir4[i] * q_fir4[i]);
                short val = (short)((v / maxAmp) * (2 << 15) - (1<<15));
                bw.Write(val);
            }
            bw.Close();
            fs.Close();
        }

        private double[] fm_demodulate_sub(double[] i, double[] q)
        {
            double[] result = new double[i.Length];
            double prev = 0.0, tmp;

            for (int x = 0; x < i.Length; x++)
            {
                tmp = Math.Atan2(i[x], q[x]);
                if (tmp - prev > Math.PI)
                {
                    result[x] = tmp - prev - Math.PI * 2.0;
                }else if (tmp - prev < -Math.PI)
                {
                    result[x] = tmp - prev + Math.PI * 2.0;
                }
                else
                {
                    result[x] = tmp - prev;
                }
                prev = tmp;
            }
            return result;
        }

        // https://tomroelandts.com/articles/low-pass-single-pole-iir-filter
        private double[] de_emphasis(double[] vals, double decay)
        {
            double b = 1.0 - decay;
            double[] result = new double[vals.Length];
            for (var i = 1; i < vals.Length; i++)
            {
                result[i] = b * vals[i] + decay * result[i - 1];  // single pole IIR
            }
            return result;
        }

        private void fm_demodulate(double tune_freq, Int16[] dat, string wavefilename, TimeStampLog log)
        {
            Int32[] i_dat = new Int32[dat.Length];
            Int32[] q_dat = new Int32[dat.Length];

            int rem = (int)(tune_freq / SAMPLE_FREQ);
            tune_freq = tune_freq - SAMPLE_FREQ * rem;  // TODO: correctly calculate frequency aliasing

            log.start();
            mixer((int)tune_freq, dat, i_dat, q_dat);
            log.stop("mixer: ");

            log.start();
            // 40MHz -> (CIC 1/32) -> 1.25MHz -> (FIR 2/5) -> 500kHz -> 
            // (FIR 2/5 cutoff 80kHz:0.08) -> 200kHz -> (FIR 3/5 cutoff 48kHz:0.08) -> 120kHz -> (FIR 2/5 cutoff 15kHz:0.0625) -> 48kHz
            double[] i_cic = cic(i_dat, 3, 32);
            double[] q_cic = cic(q_dat, 3, 32); // 1.25MHz
            log.stop("cic: ");

            log.start();
            double[] i_fir1 = fir(i_cic, 2, 5, fir_coef_255tap_008);    // 500kHz (cutoff 200kHz)
            double[] q_fir1 = fir(q_cic, 2, 5, fir_coef_255tap_008);

            // FM demodulation
            double[] arctans = fm_demodulate_sub(i_fir1, q_fir1);
            double[] arctans2 = fir(arctans, 2, 5, fir_coef_255tap_008);  // 200kHz (cutoff 80kHz)
            double[] arctans3 = fir(arctans2, 3, 5, fir_coef_255tap_008);  // 120kHz (cutoff 48kHz)
            double[] arctans4 = fir(arctans3, 2, 5, fir_coef_255tap_0625); // 48kHz (cutoff 15kHz)
            double[] arctans5 = de_emphasis(arctans4, 0.67523190665);   // fc = 3kHz/48kHz = 0.0625, e^(-2pi*0.0625)
            log.stop("FIR: ");

            FileStream fs = new FileStream(wavefilename, FileMode.CreateNew);
            BinaryWriter bw = new BinaryWriter(fs, Encoding.ASCII);
            write_wave_header(bw, (uint)arctans5.Length * 2);
            double maxAmp = 0.0;
            for (var i = 0; i < arctans5.Length; i++)
            {
                double val = Math.Abs(arctans5[i]);
                if (maxAmp < val)
                    maxAmp = val;
            }
            for (var i = 0; i < arctans5.Length; i++)
            {
                double v = arctans5[i];
                short val = (short)((v / maxAmp) * (1 << 15) + (1 << 14));
                bw.Write(val);
            }
            bw.Close();
            fs.Close();
        }

        private void fm_demodulate2(Int32[] i_dat, Int32[] q_dat, string wavefilename, TimeStampLog log)
        {
            double[] i_cic = new double[i_dat.Length];
            double[] q_cic = new double[q_dat.Length];

            for (var i = 0; i < i_dat.Length; i++)
            {
                i_cic[i] = (double)i_dat[i];
                q_cic[i] = (double)q_dat[i];        // 40/32 = 1.25MHz after CIC
            }

            log.start();
            double[] i_fir1 = fir(i_cic, 2, 5, fir_coef_255tap_008);    // 500kHz (cutoff 200kHz)
            double[] q_fir1 = fir(q_cic, 2, 5, fir_coef_255tap_008);

            // FM demodulation
            double[] arctans = fm_demodulate_sub(i_fir1, q_fir1);
            double[] arctans2 = fir(arctans, 2, 5, fir_coef_255tap_008);  // 200kHz (cutoff 80kHz)
            double[] arctans3 = fir(arctans2, 3, 5, fir_coef_255tap_008);  // 120kHz (cutoff 48kHz)
            double[] arctans4 = fir(arctans3, 2, 5, fir_coef_255tap_0625); // 48kHz (cutoff 15kHz)
            double[] arctans5 = de_emphasis(arctans4, 0.67523190665);   // fc = 3kHz/48kHz = 0.0625, e^(-2pi*0.0625)
            log.stop("FIR: ");

            FileStream fs = new FileStream(wavefilename, FileMode.CreateNew);
            BinaryWriter bw = new BinaryWriter(fs, Encoding.ASCII);
            write_wave_header(bw, (uint)arctans5.Length * 2);
            double maxAmp = 0.0;
            for (var i = 0; i < arctans5.Length; i++)
            {
                double val = Math.Abs(arctans5[i]);
                if (maxAmp < val)
                    maxAmp = val;
            }
            for (var i = 0; i < arctans5.Length; i++)
            {
                double v = arctans5[i];
                int val = (int)((v / maxAmp) * (1 << 15) + (1 << 12));
                short vv = (val > 0x7FFF) ? (short)0x7FFF :
                            (val < -0x8000) ? (short)-0x8000 : (short)val;
                bw.Write(vv);
            }
            bw.Close();
            fs.Close();
        }

        private Int16[] read_data_file(string fname)
        {
            FileStream fs = new FileStream(fname, FileMode.Open);
            BinaryReader br = new BinaryReader(fs);
            byte[] bindat = br.ReadBytes((int)fs.Length);
            br.Close();
            fs.Close();

            Int16[] dat = new Int16[bindat.Length / 2];
            for (var i = 0; i < bindat.Length; i += 2)
            {
                dat[i / 2] = BitConverter.ToInt16(bindat, i);
            }
            return dat;
        }

        private void read_cic_data_file(string fname, out Int32[] i_dat, out Int32[] q_dat)
        {
            FileStream fs = new FileStream(fname, FileMode.Open);
            BinaryReader br = new BinaryReader(fs);
            byte[] bindat = br.ReadBytes((int)fs.Length);
            br.Close();
            fs.Close();

            i_dat = new Int32[bindat.Length / 8];
            q_dat = new Int32[bindat.Length / 8];
            for (var i = 0; i < bindat.Length; i += 8)
            {
                q_dat[i / 8] = BitConverter.ToInt32(bindat, i);
                i_dat[i / 8] = BitConverter.ToInt32(bindat, i+4);
            }
        }

        private void button_am_Click(object sender, EventArgs e)
        {
            int am_tune_freq = Convert.ToInt32(textBox_am_freq.Text) * 1000;
            OpenFileDialog dlg = new OpenFileDialog();
            if (DialogResult.OK == dlg.ShowDialog())
            {
                List<long> ellapsedms = new List<long>();
                Stopwatch sw = Stopwatch.StartNew();
                Int16[] dat = read_data_file(dlg.FileName);
                sw.Stop();
                ellapsedms.Add(sw.ElapsedMilliseconds);
                am_demodulate(am_tune_freq, dat, dlg.FileName+".wav", sw, ellapsedms);
                MessageBox.Show("file read="+ellapsedms[0]+"[ms], "+
                    "mixer="+ellapsedms[1]+"[ms], "+"cic="+ellapsedms[2]+"[ms], "+
                    "fir="+ellapsedms[3]+"[ms]");
            }
        }

        private void button_fm_Click(object sender, EventArgs e)
        {
            string msg = "";
            double fm_tune_freq = Convert.ToDouble(textBox_fm_freq.Text) * 1.0e+6;
            OpenFileDialog dlg = new OpenFileDialog();
            if (DialogResult.OK == dlg.ShowDialog())
            {
                TimeStampLog log = new TimeStampLog();
                log.start();
                Int16[] dat = read_data_file(dlg.FileName);
                log.stop("Read File: ");
                fm_demodulate(fm_tune_freq, dat, dlg.FileName + ".wav", log);
                string[] buf = log.getLog();
                for (var i = 0; i < buf.Length; i++)
                {
                    msg += buf[i] + "\n";
                }
                MessageBox.Show(msg);
            }
        }

        private void button_fm_demodulate2_Click(object sender, EventArgs e)
        {
            string msg = "";
            OpenFileDialog dlg = new OpenFileDialog();
            if (DialogResult.OK == dlg.ShowDialog())
            {
                TimeStampLog log = new TimeStampLog();
                log.start();
                Int32[] i_dat, q_dat;
                read_cic_data_file(dlg.FileName, out i_dat, out q_dat);
                log.stop("Read File: ");
                fm_demodulate2(i_dat, q_dat, dlg.FileName + ".wav", log);
                string[] buf = log.getLog();
                for (var i = 0; i < buf.Length; i++)
                {
                    msg += buf[i] + "\n";
                }
                MessageBox.Show(msg);
            }
        }
    }
}

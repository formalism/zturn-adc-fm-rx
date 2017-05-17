namespace adc_capture
{
    partial class FormMain
    {
        /// <summary>
        /// 必要なデザイナー変数です。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 使用中のリソースをすべてクリーンアップします。
        /// </summary>
        /// <param name="disposing">マネージ リソースを破棄する場合は true を指定し、その他の場合は false を指定します。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows フォーム デザイナーで生成されたコード

        /// <summary>
        /// デザイナー サポートに必要なメソッドです。このメソッドの内容を
        /// コード エディターで変更しないでください。
        /// </summary>
        private void InitializeComponent()
        {
            this.button_capture = new System.Windows.Forms.Button();
            this.textBox_IP = new System.Windows.Forms.TextBox();
            this.numericUpDown_size = new System.Windows.Forms.NumericUpDown();
            this.chart = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.radioButton_signed = new System.Windows.Forms.RadioButton();
            this.radioButton_offset = new System.Windows.Forms.RadioButton();
            this.button_capture_single = new System.Windows.Forms.Button();
            this.checkBox_decode = new System.Windows.Forms.CheckBox();
            this.textBox_tune_freq = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.button_tune_freq = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.radioButton_KB = new System.Windows.Forms.RadioButton();
            this.radioButton_MB = new System.Windows.Forms.RadioButton();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.radioButton_raw = new System.Windows.Forms.RadioButton();
            this.radioButton_32bit = new System.Windows.Forms.RadioButton();
            this.textBox_fs = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_size)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.chart)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // button_capture
            // 
            this.button_capture.Location = new System.Drawing.Point(12, 119);
            this.button_capture.Name = "button_capture";
            this.button_capture.Size = new System.Drawing.Size(118, 39);
            this.button_capture.TabIndex = 0;
            this.button_capture.Text = "continuous";
            this.button_capture.UseVisualStyleBackColor = true;
            this.button_capture.Click += new System.EventHandler(this.button_capture_Click);
            // 
            // textBox_IP
            // 
            this.textBox_IP.Location = new System.Drawing.Point(12, 91);
            this.textBox_IP.Name = "textBox_IP";
            this.textBox_IP.Size = new System.Drawing.Size(118, 22);
            this.textBox_IP.TabIndex = 1;
            this.textBox_IP.Text = "192.168.0.90";
            // 
            // numericUpDown_size
            // 
            this.numericUpDown_size.Location = new System.Drawing.Point(6, 32);
            this.numericUpDown_size.Maximum = new decimal(new int[] {
            512,
            0,
            0,
            0});
            this.numericUpDown_size.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.numericUpDown_size.Name = "numericUpDown_size";
            this.numericUpDown_size.Size = new System.Drawing.Size(64, 22);
            this.numericUpDown_size.TabIndex = 4;
            this.numericUpDown_size.Value = new decimal(new int[] {
            2,
            0,
            0,
            0});
            // 
            // chart
            // 
            this.chart.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.chart.Location = new System.Drawing.Point(160, 24);
            this.chart.Name = "chart";
            this.chart.Size = new System.Drawing.Size(547, 499);
            this.chart.TabIndex = 5;
            this.chart.Text = "chart1";
            // 
            // radioButton_signed
            // 
            this.radioButton_signed.AutoSize = true;
            this.radioButton_signed.Checked = true;
            this.radioButton_signed.Location = new System.Drawing.Point(15, 21);
            this.radioButton_signed.Name = "radioButton_signed";
            this.radioButton_signed.Size = new System.Drawing.Size(68, 19);
            this.radioButton_signed.TabIndex = 6;
            this.radioButton_signed.TabStop = true;
            this.radioButton_signed.Text = "signed";
            this.radioButton_signed.UseVisualStyleBackColor = true;
            // 
            // radioButton_offset
            // 
            this.radioButton_offset.AutoSize = true;
            this.radioButton_offset.Location = new System.Drawing.Point(15, 46);
            this.radioButton_offset.Name = "radioButton_offset";
            this.radioButton_offset.Size = new System.Drawing.Size(66, 19);
            this.radioButton_offset.TabIndex = 7;
            this.radioButton_offset.Text = "offset";
            this.radioButton_offset.UseVisualStyleBackColor = true;
            // 
            // button_capture_single
            // 
            this.button_capture_single.Location = new System.Drawing.Point(12, 395);
            this.button_capture_single.Name = "button_capture_single";
            this.button_capture_single.Size = new System.Drawing.Size(118, 39);
            this.button_capture_single.TabIndex = 8;
            this.button_capture_single.Text = "single";
            this.button_capture_single.UseVisualStyleBackColor = true;
            this.button_capture_single.Click += new System.EventHandler(this.button_capture_single_Click);
            // 
            // checkBox_decode
            // 
            this.checkBox_decode.AutoSize = true;
            this.checkBox_decode.Location = new System.Drawing.Point(12, 370);
            this.checkBox_decode.Name = "checkBox_decode";
            this.checkBox_decode.Size = new System.Drawing.Size(129, 19);
            this.checkBox_decode.TabIndex = 9;
            this.checkBox_decode.Text = "raw adc decode";
            this.checkBox_decode.UseVisualStyleBackColor = true;
            // 
            // textBox_tune_freq
            // 
            this.textBox_tune_freq.Location = new System.Drawing.Point(12, 445);
            this.textBox_tune_freq.Name = "textBox_tune_freq";
            this.textBox_tune_freq.Size = new System.Drawing.Size(64, 22);
            this.textBox_tune_freq.TabIndex = 10;
            this.textBox_tune_freq.Text = "81.3";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(82, 448);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(35, 15);
            this.label2.TabIndex = 11;
            this.label2.Text = "MHz";
            // 
            // button_tune_freq
            // 
            this.button_tune_freq.Location = new System.Drawing.Point(10, 473);
            this.button_tune_freq.Name = "button_tune_freq";
            this.button_tune_freq.Size = new System.Drawing.Size(118, 39);
            this.button_tune_freq.TabIndex = 12;
            this.button_tune_freq.Text = "Tune";
            this.button_tune_freq.UseVisualStyleBackColor = true;
            this.button_tune_freq.Click += new System.EventHandler(this.button_tune_freq_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.radioButton_KB);
            this.groupBox1.Controls.Add(this.radioButton_MB);
            this.groupBox1.Controls.Add(this.numericUpDown_size);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(129, 72);
            this.groupBox1.TabIndex = 13;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Capture Size";
            // 
            // radioButton_KB
            // 
            this.radioButton_KB.AutoSize = true;
            this.radioButton_KB.Location = new System.Drawing.Point(74, 46);
            this.radioButton_KB.Name = "radioButton_KB";
            this.radioButton_KB.Size = new System.Drawing.Size(47, 19);
            this.radioButton_KB.TabIndex = 1;
            this.radioButton_KB.Text = "KB";
            this.radioButton_KB.UseVisualStyleBackColor = true;
            // 
            // radioButton_MB
            // 
            this.radioButton_MB.AutoSize = true;
            this.radioButton_MB.Checked = true;
            this.radioButton_MB.Location = new System.Drawing.Point(74, 21);
            this.radioButton_MB.Name = "radioButton_MB";
            this.radioButton_MB.Size = new System.Drawing.Size(49, 19);
            this.radioButton_MB.TabIndex = 0;
            this.radioButton_MB.TabStop = true;
            this.radioButton_MB.Text = "MB";
            this.radioButton_MB.UseVisualStyleBackColor = true;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.radioButton_signed);
            this.groupBox2.Controls.Add(this.radioButton_offset);
            this.groupBox2.Location = new System.Drawing.Point(10, 164);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(123, 75);
            this.groupBox2.TabIndex = 14;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "RAW format";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.radioButton_raw);
            this.groupBox3.Controls.Add(this.radioButton_32bit);
            this.groupBox3.Location = new System.Drawing.Point(12, 245);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(123, 75);
            this.groupBox3.TabIndex = 15;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Data Select";
            // 
            // radioButton_raw
            // 
            this.radioButton_raw.AutoSize = true;
            this.radioButton_raw.Checked = true;
            this.radioButton_raw.Location = new System.Drawing.Point(15, 21);
            this.radioButton_raw.Name = "radioButton_raw";
            this.radioButton_raw.Size = new System.Drawing.Size(54, 19);
            this.radioButton_raw.TabIndex = 6;
            this.radioButton_raw.TabStop = true;
            this.radioButton_raw.Text = "Raw";
            this.radioButton_raw.UseVisualStyleBackColor = true;
            // 
            // radioButton_32bit
            // 
            this.radioButton_32bit.AutoSize = true;
            this.radioButton_32bit.Location = new System.Drawing.Point(15, 46);
            this.radioButton_32bit.Name = "radioButton_32bit";
            this.radioButton_32bit.Size = new System.Drawing.Size(59, 19);
            this.radioButton_32bit.TabIndex = 7;
            this.radioButton_32bit.Text = "32bit";
            this.radioButton_32bit.UseVisualStyleBackColor = true;
            // 
            // textBox_fs
            // 
            this.textBox_fs.Location = new System.Drawing.Point(48, 326);
            this.textBox_fs.Name = "textBox_fs";
            this.textBox_fs.Size = new System.Drawing.Size(64, 22);
            this.textBox_fs.TabIndex = 16;
            this.textBox_fs.Text = "40.0";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(20, 329);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(22, 15);
            this.label1.TabIndex = 17;
            this.label1.Text = "Fs";
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(719, 535);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBox_fs);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.button_tune_freq);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.textBox_tune_freq);
            this.Controls.Add(this.checkBox_decode);
            this.Controls.Add(this.button_capture_single);
            this.Controls.Add(this.chart);
            this.Controls.Add(this.textBox_IP);
            this.Controls.Add(this.button_capture);
            this.Name = "FormMain";
            this.Text = "Capture";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormMain_FormClosing);
            this.Load += new System.EventHandler(this.FormMain_Load);
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_size)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.chart)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button_capture;
        private System.Windows.Forms.TextBox textBox_IP;
        private System.Windows.Forms.NumericUpDown numericUpDown_size;
        private System.Windows.Forms.DataVisualization.Charting.Chart chart;
        private System.Windows.Forms.RadioButton radioButton_signed;
        private System.Windows.Forms.RadioButton radioButton_offset;
        private System.Windows.Forms.Button button_capture_single;
        private System.Windows.Forms.CheckBox checkBox_decode;
        private System.Windows.Forms.TextBox textBox_tune_freq;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button button_tune_freq;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton radioButton_KB;
        private System.Windows.Forms.RadioButton radioButton_MB;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.RadioButton radioButton_raw;
        private System.Windows.Forms.RadioButton radioButton_32bit;
        private System.Windows.Forms.TextBox textBox_fs;
        private System.Windows.Forms.Label label1;
    }
}


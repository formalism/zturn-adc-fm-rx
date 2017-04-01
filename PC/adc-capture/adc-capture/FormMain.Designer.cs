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
            this.label1 = new System.Windows.Forms.Label();
            this.numericUpDown_size = new System.Windows.Forms.NumericUpDown();
            this.chart = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.radioButton_signed = new System.Windows.Forms.RadioButton();
            this.radioButton_offset = new System.Windows.Forms.RadioButton();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_size)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.chart)).BeginInit();
            this.SuspendLayout();
            // 
            // button_capture
            // 
            this.button_capture.Location = new System.Drawing.Point(12, 89);
            this.button_capture.Name = "button_capture";
            this.button_capture.Size = new System.Drawing.Size(118, 39);
            this.button_capture.TabIndex = 0;
            this.button_capture.Text = "capture";
            this.button_capture.UseVisualStyleBackColor = true;
            this.button_capture.Click += new System.EventHandler(this.button_capture_Click);
            // 
            // textBox_IP
            // 
            this.textBox_IP.Location = new System.Drawing.Point(12, 61);
            this.textBox_IP.Name = "textBox_IP";
            this.textBox_IP.Size = new System.Drawing.Size(118, 22);
            this.textBox_IP.TabIndex = 1;
            this.textBox_IP.Text = "192.168.0.90";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(104, 26);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(28, 15);
            this.label1.TabIndex = 3;
            this.label1.Text = "MB";
            // 
            // numericUpDown_size
            // 
            this.numericUpDown_size.Location = new System.Drawing.Point(12, 24);
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
            this.numericUpDown_size.Size = new System.Drawing.Size(86, 22);
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
            this.chart.Size = new System.Drawing.Size(547, 460);
            this.chart.TabIndex = 5;
            this.chart.Text = "chart1";
            // 
            // radioButton_signed
            // 
            this.radioButton_signed.AutoSize = true;
            this.radioButton_signed.Location = new System.Drawing.Point(12, 151);
            this.radioButton_signed.Name = "radioButton_signed";
            this.radioButton_signed.Size = new System.Drawing.Size(68, 19);
            this.radioButton_signed.TabIndex = 6;
            this.radioButton_signed.Text = "signed";
            this.radioButton_signed.UseVisualStyleBackColor = true;
            // 
            // radioButton_offset
            // 
            this.radioButton_offset.AutoSize = true;
            this.radioButton_offset.Checked = true;
            this.radioButton_offset.Location = new System.Drawing.Point(12, 176);
            this.radioButton_offset.Name = "radioButton_offset";
            this.radioButton_offset.Size = new System.Drawing.Size(66, 19);
            this.radioButton_offset.TabIndex = 7;
            this.radioButton_offset.TabStop = true;
            this.radioButton_offset.Text = "offset";
            this.radioButton_offset.UseVisualStyleBackColor = true;
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(719, 496);
            this.Controls.Add(this.radioButton_offset);
            this.Controls.Add(this.radioButton_signed);
            this.Controls.Add(this.chart);
            this.Controls.Add(this.numericUpDown_size);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBox_IP);
            this.Controls.Add(this.button_capture);
            this.Name = "FormMain";
            this.Text = "Capture";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormMain_FormClosing);
            this.Load += new System.EventHandler(this.FormMain_Load);
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_size)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.chart)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button_capture;
        private System.Windows.Forms.TextBox textBox_IP;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.NumericUpDown numericUpDown_size;
        private System.Windows.Forms.DataVisualization.Charting.Chart chart;
        private System.Windows.Forms.RadioButton radioButton_signed;
        private System.Windows.Forms.RadioButton radioButton_offset;
    }
}


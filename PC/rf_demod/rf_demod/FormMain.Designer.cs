namespace rf_demod
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
            this.button_am = new System.Windows.Forms.Button();
            this.textBox_am_freq = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.button_fm = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.textBox_fm_freq = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // button_am
            // 
            this.button_am.Location = new System.Drawing.Point(12, 64);
            this.button_am.Name = "button_am";
            this.button_am.Size = new System.Drawing.Size(258, 68);
            this.button_am.TabIndex = 0;
            this.button_am.Text = "AM";
            this.button_am.UseVisualStyleBackColor = true;
            this.button_am.Click += new System.EventHandler(this.button_am_Click);
            // 
            // textBox_am_freq
            // 
            this.textBox_am_freq.Location = new System.Drawing.Point(12, 26);
            this.textBox_am_freq.Name = "textBox_am_freq";
            this.textBox_am_freq.Size = new System.Drawing.Size(100, 22);
            this.textBox_am_freq.TabIndex = 1;
            this.textBox_am_freq.Text = "810";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(118, 29);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(31, 15);
            this.label1.TabIndex = 2;
            this.label1.Text = "kHz";
            // 
            // button_fm
            // 
            this.button_fm.Location = new System.Drawing.Point(12, 189);
            this.button_fm.Name = "button_fm";
            this.button_fm.Size = new System.Drawing.Size(258, 68);
            this.button_fm.TabIndex = 3;
            this.button_fm.Text = "FM";
            this.button_fm.UseVisualStyleBackColor = true;
            this.button_fm.Click += new System.EventHandler(this.button_fm_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(118, 153);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(35, 15);
            this.label2.TabIndex = 5;
            this.label2.Text = "MHz";
            // 
            // textBox_fm_freq
            // 
            this.textBox_fm_freq.Location = new System.Drawing.Point(12, 150);
            this.textBox_fm_freq.Name = "textBox_fm_freq";
            this.textBox_fm_freq.Size = new System.Drawing.Size(100, 22);
            this.textBox_fm_freq.TabIndex = 4;
            this.textBox_fm_freq.Text = "84.7";
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(282, 275);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.textBox_fm_freq);
            this.Controls.Add(this.button_fm);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBox_am_freq);
            this.Controls.Add(this.button_am);
            this.Name = "FormMain";
            this.Text = "RF Demodulate";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button_am;
        private System.Windows.Forms.TextBox textBox_am_freq;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button_fm;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBox_fm_freq;
    }
}


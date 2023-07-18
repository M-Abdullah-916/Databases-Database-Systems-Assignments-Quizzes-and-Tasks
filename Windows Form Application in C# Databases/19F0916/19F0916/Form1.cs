using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace _19F0916
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            panel5.Hide();
            panel4.Hide();
            panel6.Hide();
        }

        public String Connection = @"Data Source=DESKTOP-BOPDM7L\SQLEXPRESS;Initial Catalog=StudentManagmentSystem;Integrated Security=True";

        private void label2_Click(object sender, EventArgs e)
        {
            panel4.Show();
            panel4.BringToFront();
            panel5.Show();
            panel5.BringToFront();
        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Save_Button(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection(Connection);
            Conn.Open();
            if(Conn.State==System.Data.ConnectionState.Open)
            {
                String q = "insert into Registration values('" + textBox1.Text.ToString() + "','" + textBox2.Text.ToString() + "','" + textBox3.Text.ToString() + "','" + textBox4.Text.ToString() + "','" + textBox5.Text.ToString() + "','" + textBox6.Text.ToString() + "','" + textBox7.Text.ToString() + "','" + textBox8.Text.ToString() + "')";
                SqlCommand cmd = new SqlCommand(q, Conn);
                int i=cmd.ExecuteNonQuery();
                if (i != 0) 
                {
                    MessageBox.Show("Record Has Been Registered");
                }
                else
                {
                    MessageBox.Show("Record Has Not Registered");
                }
                
            }
            Conn.Close();
        }

        private void Select_Button(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(Connection);
            conn.Open();
            if (conn.State == System.Data.ConnectionState.Open)
            {
                String q = "Select * from Registration";
                SqlDataAdapter adp = new SqlDataAdapter(q, conn);
                DataTable Dt = new DataTable();
                adp.Fill(Dt);
                dataGridView1.DataSource = Dt;

            }
            conn.Close();

        }

        private void Show_Content(object sender, MouseEventArgs e)
        {
            
        }

        private void Show_Contents(object sender, DataGridViewCellEventArgs e)
        {
            textBox1.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            textBox2.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            textBox3.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            textBox4.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            textBox5.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            textBox6.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
            textBox7.Text = dataGridView1.Rows[e.RowIndex].Cells[6].Value.ToString();
            textBox8.Text = dataGridView1.Rows[e.RowIndex].Cells[7].Value.ToString();
        }

        private void Update_Button(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection(Connection);
            Conn.Open();
            if (Conn.State == System.Data.ConnectionState.Open)
            {
                String q = "Update Registration Set Name='" + textBox1.Text.ToString() + "', Address='" + textBox2.Text.ToString() + "', CNIC='" + textBox3.Text.ToString() + "', Class='" + textBox4.Text.ToString() + "', Section='" + textBox5.Text.ToString() + "', Semester='" + textBox6.Text.ToString() + "', RollNo='" + textBox7.Text.ToString() + "', DOB='" + textBox8.Text.ToString() + "' where RollNo='"+textBox7.Text+"'";
                SqlCommand cmd = new SqlCommand(q, Conn);
                int i = cmd.ExecuteNonQuery();
                if (i != 0)
                {
                    MessageBox.Show("Record Has Been Updated");
                }
                else
                {
                    MessageBox.Show("Record Has Not Updated");
                }

            }
            Conn.Close();
        }

        private void Delete_Button(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection(Connection);
            Conn.Open();
            if (Conn.State == System.Data.ConnectionState.Open)
            {
                String q = "Delete from Registration where CNIC='" + textBox3.Text.ToString() + "'";
                SqlCommand cmd = new SqlCommand(q, Conn);
                int i = cmd.ExecuteNonQuery();
                if (i != 0)
                {
                    MessageBox.Show("Record Has Been Deleted");
                }
                else
                {
                    MessageBox.Show("Record Has Not Deleted");
                }

            }
            Conn.Close();
        }

        private void Search_Button(object sender, EventArgs e)
        {
            panel6.Show();
            panel6.BringToFront();
        }

        private void Searchh(object sender, EventArgs e)
        {
            panel6.Hide();
       
            SqlConnection conn = new SqlConnection(Connection);
            conn.Open();
            if (conn.State == System.Data.ConnectionState.Open)
            {
                String q = "Select * from Registration where RollNo='" + textBox9.Text.ToString() + "'";
                SqlDataAdapter adp = new SqlDataAdapter(q, conn);
                DataTable Dt = new DataTable();
                adp.Fill(Dt);
                dataGridView1.DataSource = Dt;                         
            }
            conn.Close();
        }
    }
}

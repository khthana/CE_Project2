using System;

namespace Org.Snmp.Snmp_pp
{
	
	public class MyStat
	{
		//---- variable-----
		public static int no_of_variable = 13;			//มีค่า 13 เพราะ นับตั้งแต่ 0 - 13 จะได้ 14 ค่า
		public double [] chi_square = new double [11];
		public double [] chi_square1 = new double [11];
		public double [] chi_square2 = new double [11];
		const double lamda = 0.0833;
		public double [] max = new double[14];
		public double [] vector = new double[11];
		public double [] vector1 = new double[11];
		public double [] vector2 = new double[11];
		public double [,]EWMA_value = new double[14,11];
		public double [,] data = new double[14,48];  
		public double [,] meandata = new double[14,12];
		//public double [] xbar = new double[3];
		public double sd;
		public double sd1;
		public double sd2;
		public double [] expect_val = new double[3];
		
		public double [] Lower_bound = new double[11];
		public double [] Lower_bound1 = new double[11];
		public double [] Lower_bound2 = new double[11];

		//================limit-------------------
		public double [] Upper_bound = new double[11];
		public double [] Upper_bound1 = new double[11];
		public double [] Upper_bound2 = new double[11];
		
		public double [] Upper1_bound = new double[11];
		public double [] Upper1_bound1 = new double[11];
		public double [] Upper1_bound2 = new double[11];

		public double [] Upper2_bound = new double[11];
		public double [] Upper2_bound1 = new double[11];
		public double [] Upper2_bound2 = new double[11];
		
		//    function
		public MyStat()
		{
			
			for(int i =0;i<14;i++)
			{
				for(int j = 0;j<47;j++)
				{
					data[i,j] = 0;
					if(j < 11)
					{
						EWMA_value[i,j] = 0;
						vector[j] = 0;
						vector1[j] = 0;
						vector2[j] = 0;
					}
					else if(j<12)
					{
						meandata[i,j] = 0;
					}
				}
				data[i,47] = 0;
				//expect_val[i] = 0; 
				max[i] = 0;
				sd = 0;
			}
		}

		public MyStat(MyStat obj)
		{
			for(int i = 0;i<no_of_variable;i++)
			{
				for(int j = 0;j<47;j++)
				{
					data[i,j] = obj.data[i,j];
					
				}
				data[i,47] = obj.data[i,47];

				for(int j = 0;j<12;j++)
				{
					if(j < 11)
					{
						EWMA_value[i,j] = obj.EWMA_value[i,j]; 
						vector[j]  = obj.vector[j];
						vector1[j] = obj.vector1[j];
						vector2[j] = obj.vector2[j];
					}
					meandata[i,j] = obj.meandata[i,j];
					
				}
			}
			for(int i =0;i<3;i++)
			{
				expect_val[i] = obj.expect_val[i];
			}
			for(int k =0;k<11;k++)
			{
				//----------- init 3 group ---------//
				chi_square[k] = obj.chi_square[k];
				Upper_bound[k] = obj.Upper_bound[k];
				Upper1_bound[k] = obj.Upper1_bound[k];
				Upper2_bound[k] = obj.Upper2_bound[k];
				Lower_bound[k] = obj.Lower_bound[k];

				chi_square1[k] = obj.chi_square1[k];
				Upper_bound1[k] = obj.Upper_bound1[k];
				Upper1_bound1[k] = obj.Upper1_bound1[k];
				Upper2_bound1[k] = obj.Upper2_bound1[k];
				Lower_bound1[k] = obj.Lower_bound1[k];

				chi_square2[k] = obj.chi_square2[k];
				Upper_bound2[k] = obj.Upper_bound2[k];
				Upper1_bound2[k] = obj.Upper1_bound2[k];
				Upper2_bound2[k] = obj.Upper2_bound2[k];
				Lower_bound2[k] = obj.Lower_bound2[k];
			}
		}
		
		//--------------function จัดการตัวเอาค่าจาก class DB มาใส่ array-----------//
		// เมื่อเรียก function class DB.query จะ return ค่าตัวแปร(ถ้า norm ได้ 48 row,observe ได้ 12 row)
		public void Assign_data (MyStat obj,string data,int length_array,int index_variable)	//index_variable = ตัวแสดง ว่าตัวแปรที่ เท่าไหร่
		{
			int lastindex = 0;
			for(int j = 0;j < length_array;j++)
			{
				int start = data.IndexOf("$",lastindex);
				int end = data.IndexOf("$",start+1);
				try
				{
					obj.data[index_variable,j] = double.Parse(data.Substring(start+1,end-start-1));
				}
				catch(Exception e){}
				lastindex = end;
			}
		}
		
		
		public int count_row(string data)
		{
			int index = 0;
			int counter = 0;
			while(index != data.Length && index < data.Length-1)
			{
				index = data.IndexOf("$",index+1,data.Length-(index+1));
				counter++;
			}
				return counter;
		}

		public void GroupNorm_EWMA(MyStat obj,int arg_length_array,int no_group,int arg_no_var)
		{
			int startindex;
			int no_var;
			int length_array;
			//----------------ถ้ามีมากกว่า 48 row คิดแค่ 48-------------------
			if(arg_length_array >= 48)
			{
				length_array = 48;
			}
			else length_array = arg_length_array;
			//----------------------------------------------------------------------
			if(no_group == 0)
			{
				startindex = 0;
				no_var = startindex + arg_no_var;
			}
			else if(no_group == 1)
			{
				startindex = 4;
				no_var = startindex + arg_no_var;
			}
			else
			{
				startindex = 8;
				no_var = startindex + arg_no_var;
			}
				//============== คิด meandata ของ แต่ละตัวแปร ===============//
				for(int i = startindex;i<no_var;i++)		// ทำของแต่ละตัวแปร
				{
					for(int j = 0;j<12;j++)
					{
						double temp,number;					//number คือ จำนวนตัวหาร เผื่อว่า norm มีไม่เต็ม 1 เดือน
						temp = (obj.data[i,j] + obj.data[i,j+12] + obj.data[i,j+24] + obj.data[i,j+36]);
						if(length_array <= 12)
						{
							number = 1;
						}
						else if(length_array <= 24)
						{
							number = 2;
						}
						else if(length_array <= 36)
						{
							number = 3;
						}
						else {number = 4; }

						obj.meandata[i,j] = temp/number;
					}
				}
				//================คิด EWMA ของ แต่ละตัวแปร ===================//
			for(int i = startindex;i<no_var;i++)		// ทำของแต่ละตัวแปร
			{
				obj.EWMA_value[i,0] = lamda * obj.meandata[i,1] + (1-lamda)*obj.meandata[i,0];
				for(int j = 1;j<11;j++)
				{
					obj.EWMA_value[i,j] = lamda * obj.meandata[i,j+1] + (1-lamda)*obj.EWMA_value[i,j-1];
				}
			}
		}
		
		public void Norm_Max(MyStat obj)
		{
			for(int i = 0 ; i< 14;i++)		// วนทำแต่ละตัวแปร
			{
				for(int j = 0;j< 11;j++)	// วนเทียบค่า
				{
					if(obj.max[i] < obj.EWMA_value[i,j] )
					{
						obj.max[i] = obj.EWMA_value[i,j];
					}
				}
			}
					
		}

		public void Norm_Weight(MyStat obj)
		{
			for(int i = 0;i<14;i++)
			{
				for(int j = 0;j<11;j++)
				{
					if(obj.max[i] != 0)
					{
						obj.EWMA_value[i,j] = (obj.EWMA_value[i,j] / obj.max[i]) * 250;
					}
				}
			}
		}

		
		//ยุบรวมตัวแปรในกลุ่มเป็น vector ลัพธ์
		public void Vector(MyStat obj)
		{
			double temp;
			for(int i =0;i<11;i++)
			{
				temp = Math.Pow(obj.EWMA_value[0,i],2) + Math.Pow(obj.EWMA_value[1,i],2) + Math.Pow(obj.EWMA_value[2,i],2) + Math.Pow(obj.EWMA_value[3,i],2);
				obj.vector[i] = Math.Sqrt(temp);

				temp = Math.Pow(obj.EWMA_value[4,i],2) + Math.Pow(obj.EWMA_value[5,i],2) + Math.Pow(obj.EWMA_value[6,i],2) + Math.Pow(obj.EWMA_value[7,i],2);
				obj.vector1[i] = Math.Sqrt(temp);

				temp = Math.Pow(obj.EWMA_value[8,i],2) + Math.Pow(obj.EWMA_value[9,i],2) + Math.Pow(obj.EWMA_value[10,i],2) + Math.Pow(obj.EWMA_value[11,i],2) + Math.Pow(obj.EWMA_value[12,i],2) + Math.Pow(obj.EWMA_value[13,i],2) ;
				obj.vector2[i] = Math.Sqrt(temp);
			}
		}

		public void Expect_Value(MyStat obj)
		{
			double sum,sum1,sum2;/*
			sum = sum1 = sum2 = 0;
			
			sum = (lamda * obj.vector[1]) + ((1 - lamda) * obj.vector[0]);
			sum1 = (lamda * obj.vector1[1]) + ((1 - lamda) * obj.vector1[0]);
			sum2 = (lamda * obj.vector2[1]) + ((1 - lamda) * obj.vector2[0]);
			for(int i = 1;i < 10;i++)
			{
				sum  = (lamda * obj.vector[i+1])  + ((1 - lamda) * sum);
				sum1 = (lamda * obj.vector1[i+1]) + ((1 - lamda) * sum1);
				sum2 = (lamda * obj.vector2[i+1]) + ((1 - lamda) * sum2);
			}
			obj.expect_val[0]  = sum;
			obj.expect_val[1] = sum1;
			obj.expect_val[2] = sum2;*/
			sum = sum1 = sum2 = 0;
			for(int i =0;i<11;i++)
			{
                sum += obj.vector[i];
				sum1 += obj.vector1[i];
				sum2 += obj.vector2[i];
			}
			obj.expect_val[0] = sum/11;
			obj.expect_val[1] = sum1/11;
			obj.expect_val[2] = sum2/11;
		}

		public void SD(MyStat obj)
		{
			double temp,sum;
			double temp1,sum1;
			double temp2,sum2;
			sum  = temp  = 0;
			sum1 = temp1 = 0;
			sum2 = temp2 = 0;
			for(int i =0;i<11;i++)
			{
				temp = obj.vector[i] - obj.expect_val[0];
				temp = Math.Pow(temp,2);
				sum += temp;

				temp1 = obj.vector1[i] - obj.expect_val[1];
				temp1 = Math.Pow(temp1,2);
				sum1 += temp1;

				temp2 = obj.vector2[i] - obj.expect_val[2];
				temp2 = Math.Pow(temp2,2);
				sum2 += temp2;
			}
			obj.sd  = sum / 11;
			obj.sd1 = sum1 / 11;
			obj.sd2 = sum2 / 11;

			obj.sd  = Math.Sqrt(obj.sd);
			obj.sd1 = Math.Sqrt(obj.sd1);
			obj.sd2 = Math.Sqrt(obj.sd2);
		}

		

		public void Group_Norm_ChiSquare(MyStat obj)
		{
			double temp,sum;
			double temp1,sum1;
			double temp2,sum2;
			sum = temp = 0;
			sum1 = temp1 = 0;
			sum2 = temp2 = 0;
			for(int i=0;i<11;i++)
			{
				// กลุ่ม inbound
				temp = obj.vector[i] - obj.expect_val[0];
				if(temp > 0)
				{
					temp = Math.Pow(temp,2);
					sum += temp / obj.expect_val[0];
				}
				
				// กลุ่ม outbound
				temp1 = obj.vector1[i] - obj.expect_val[1];
				if(temp1 > 0)
				{
					temp1 = Math.Pow(temp1,2);
					sum1 += temp1 / obj.expect_val[1];
				}
				
				// กลุ่ม Etherstat
				temp2 = obj.vector2[i] - obj.expect_val[2];
				if(temp2 > 0)
				{
					temp2 = Math.Pow(temp2,2);
					sum2 += temp2 / obj.expect_val[2];
				}
			}

			for(int i = 0;i<9;i++)
			{
				obj.chi_square[i] = obj.chi_square[i+1];	
				obj.chi_square1[i] = obj.chi_square1[i+1];	
				obj.chi_square2[i] = obj.chi_square2[i+1];	
			}
			obj.chi_square[10] = sum;
			obj.chi_square1[10] = sum1;
			obj.chi_square2[10] = sum2;
		}
		
		public void Group_Control_Limit (MyStat obj)
		{
			for(int i=0;i<10;i++)
			{	// ของ กลุ่ม inbound
				obj.Upper_bound[i] = obj.Upper_bound[i+1];
				obj.Upper_bound1[i] = obj.Upper_bound1[i+1];
				obj.Upper_bound2[i] = obj.Upper_bound2[i+1];
				
				//ของ กลุ่ม outbound
				obj.Upper1_bound[i] = obj.Upper1_bound[i+1];
				obj.Upper1_bound1[i] = obj.Upper1_bound1[i+1];
				obj.Upper1_bound2[i] = obj.Upper1_bound2[i+1];

				//ของ กลุ่ม etherstat
				obj.Upper2_bound[i] = obj.Upper2_bound[i+1];
				obj.Upper2_bound1[i] = obj.Upper2_bound1[i+1];
				obj.Upper2_bound2[i] = obj.Upper2_bound2[i+1];
			}
			// ของ กลุ่ม inbound
			obj.Upper_bound[10]  = obj.chi_square[10] + (3 * obj.sd);
			obj.Upper1_bound[10] = obj.chi_square[10] + (1 * obj.sd);
			obj.Upper2_bound[10] = obj.chi_square[10] + (2 * obj.sd);

			//ของ กลุ่ม outbound
			obj.Upper_bound1[10]  = obj.chi_square1[10] + (3 * obj.sd1);
			obj.Upper1_bound1[10] = obj.chi_square1[10] + (1 * obj.sd1);
			obj.Upper2_bound1[10] = obj.chi_square1[10] + (2 * obj.sd1);

			//ของ กลุ่ม etherstat
			obj.Upper_bound2[10]  = obj.chi_square2[10] + (3 * obj.sd2);
			obj.Upper1_bound2[10] = obj.chi_square2[10] + (1 * obj.sd2);
			obj.Upper2_bound2[10] = obj.chi_square2[10] + (2 * obj.sd2);
			
		}

		//===========================Observe-=========================//
		/*public void Observe_Max(MyStat obj)
		{
			for(int i = 0 ; i< 14;i++)		// วนทำแต่ละตัวแปร
			{
				for(int j = 0;j< 11;j++)	// วนเทียบค่า
				{
					if(obj.max[i] < obj.data[i,j] )
					{
						obj.max[i] = obj.data[i,j];
					}
				}
			}
		}*/

		public void Observe_Max(MyStat norm,MyStat observe)
		{
			for(int i = 0;i<14;i++)
			{
				observe.max[i] = norm.max[i];
			}
		}

		public void Observe_Weight(MyStat obj)
		{
			for(int i = 0;i<14;i++)
			{
				for(int j = 0;j<11;j++)
				{
					if(obj.max[i] != 0)
					{
						obj.EWMA_value[i,j] = (obj.data[i,j] / obj.max[i]) * 175;
					}
				}
			}
		}

		public void Observe_Vector(MyStat obj)
		{
			double temp;
			for(int i =0;i<11;i++)
			{
				temp = Math.Pow(obj.EWMA_value[0,i],2) + Math.Pow(obj.EWMA_value[1,i],2) + Math.Pow(obj.EWMA_value[2,i],2) + Math.Pow(obj.EWMA_value[3,i],2);
				obj.vector[i] = Math.Sqrt(temp);

				temp = Math.Pow(obj.EWMA_value[4,i],2) + Math.Pow(obj.EWMA_value[5,i],2) + Math.Pow(obj.EWMA_value[6,i],2) + Math.Pow(obj.EWMA_value[7,i],2);
				obj.vector1[i] = Math.Sqrt(temp);

				temp = Math.Pow(obj.EWMA_value[8,i],2) + Math.Pow(obj.EWMA_value[9,i],2) + Math.Pow(obj.EWMA_value[10,i],2) + Math.Pow(obj.EWMA_value[11,i],2) + Math.Pow(obj.EWMA_value[12,i],2) + Math.Pow(obj.EWMA_value[13,i],2) ;
				obj.vector2[i] = Math.Sqrt(temp);
			}
		}

		public void send_Expect_value(MyStat Norm,MyStat Observe)
		{
			for(int i = 0;i<3;i++)
			{
				Observe.expect_val[i] = Norm.expect_val[i];
			}
		}

		public void send_Controllimit(MyStat Norm,MyStat Observe)
		{
			for(int i = 0;i<11;i++)
			{
				Observe.Upper_bound[i]   = Norm.Upper_bound[i];
				Observe.Upper_bound1[i]  = Norm.Upper_bound1[i];
				Observe.Upper_bound2[i]  = Norm.Upper_bound2[i];

				Observe.Upper1_bound[i]  = Norm.Upper1_bound[i];
				Observe.Upper1_bound1[i] = Norm.Upper1_bound1[i];
				Observe.Upper1_bound2[i] = Norm.Upper1_bound2[i];

				Observe.Upper2_bound[i]  = Norm.Upper2_bound[i];
				Observe.Upper2_bound1[i] = Norm.Upper2_bound1[i];
				Observe.Upper2_bound2[i] = Norm.Upper2_bound2[i];
			}
			
		}
		public void Observe_ChiSquare(MyStat obj)
		{
			double temp,sum;
			double temp1,sum1;
			double temp2,sum2;
			sum = temp = 0;
			sum1 = temp1 = 0;
			sum2 = temp2 = 0;
			for(int i=0;i<11;i++)
			{
				// กลุ่ม inbound
				temp = obj.vector[i] - obj.expect_val[0];
				if(temp1 > 0)
				{
					temp = Math.Pow(temp,2);
					sum += temp / obj.expect_val[0];
				}
				// กลุ่ม outbound
				temp1 = obj.vector1[i] - obj.expect_val[1];
				if(temp1 > 0)
				{
					temp1 = Math.Pow(temp1,2);
					sum1 += temp1 / obj.expect_val[1];
				}
				// กลุ่ม Etherstat
				temp2 = obj.vector2[i] - obj.expect_val[2];
				if(temp2 > 0)
				{
					temp2 = Math.Pow(temp2,2);
					sum2 += temp2 / obj.expect_val[2];
				}
			}

			for(int i = 0;i<10;i++)
			{
				obj.chi_square[i] = obj.chi_square[i+1];	
				obj.chi_square1[i] = obj.chi_square1[i+1];	
				obj.chi_square2[i] = obj.chi_square2[i+1];	
			}
			obj.chi_square[10] = sum;
			obj.chi_square1[10] = sum1;
			obj.chi_square2[10] = sum2;
		}

		public string Error_Update_DB(MyStat norm,MyStat observe,string ifno)
		{
			string stringdata = "$" + ifno.Substring(1);
			long []val = new long [14];			//ค่าที่จะใช้ ไป ทำ string SQL เพื่อ update norm
			long []diff = new long [14];
			for(int i = 0;i<14;i++)
			{
				diff[i] = System.Convert.ToInt64(observe.data[i,11] - norm.meandata[i,11]);		//ตำแหน่งท้ายสุดเท่านั้น
				if(diff[i] > 0)
				{
					val[i] = System.Convert.ToInt64(norm.meandata[i,11] + (diff[i] / 2));
				}
				else
				{
					val[i] = System.Convert.ToInt64(norm.meandata[i,11]);
				} 
				stringdata += "%" + val[i].ToString();
				
			}
			
			return stringdata;
		}

		public string NoError_Update_DB(MyStat norm,MyStat observe,string ifno)
		{
			string stringdata = "$" + ifno.Substring(1);
			long temp =0;
			for(int i =0;i<14;i++)
			{
				temp = System.Convert.ToInt64(observe.data[i,11]);
				stringdata += "%" + temp.ToString();
			}
			
			return stringdata;
		}
		
	};// end of class 
	
}

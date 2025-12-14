using System;
using System.Data;

namespace Restaurant
{
	/// <summary>
	/// Summary description for customer.
	/// </summary>
	public class customer
	{
		private string cardID;
		private string name;
		private string lastname;
		private int age;
		private bool sex;
		private string address;
		private string province;
		private string postcode;
		private string telephone;
		private string email;
		public customer()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		
		public customer(string cardID,string name,string lastname,int age,bool sex,string address,
			string province,string postcode,string telephone,string email)
		{
			this.cardID = cardID;
			this.name = name;
			this.lastname = lastname;
			this.age = age;
			this.sex = sex;
			this.address = address;
			this.province = province;
			this.postcode = postcode;
			this.telephone = telephone;
			this.email = email;
		}

		public string getCardID()
		{
			return cardID;
		}
		public void setCardID(string cardID)
		{
			this.cardID = cardID;
		}

		public string getName()
		{
			return name;
		}
		public void setName(string name)
		{
			this.name = name;
		}

		public string getLastName()
		{
			return lastname;
		}
		public void setLastName(string lastname)
		{
			this.lastname = lastname;
		}

		public int  getAge()
		{
			return age;
		}
		public void setAge(int age)
		{
			this.age = age;
		}

		public bool getSex()
		{
			return sex;
		}
		public void setSex(bool sex)
		{
			this.sex = sex;
		}

		public string getAddress()
		{
			return address;
		}
		public void setAddress(string address)
		{
			this.address = address;
		}

		public string getProvince()
		{
			return province;
		}
		public void setProvince(string province)
		{
			this.province = province;
		}

		public string getPostCode()
		{
			return postcode;
		}
		public void setPostCode(string postcode)
		{
			this.postcode = postcode;
		}

		public string getTelephone()
		{
			return telephone;
		}
		public void setTelephone(string telephone)
		{
			this.telephone = telephone;
		}

		public string getEmail()
		{
			return email;
		}
		public void setEmail(string email)
		{
			this.email = email;
		}
	}
}

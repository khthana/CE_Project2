using System;

namespace Restaurant
{
	/// <summary>
	/// Summary description for promotion.
	/// </summary>
	public class promotion
	{
		private int promotionID;
		private string promotionName;
		private string discription;
		private string beginTime;
		private string endTime;

		public promotion()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public promotion(int promotionID,string promotionName,string discrioption,
					string beginTime,string endTime)
		{
			this.promotionID = promotionID;
			this.promotionName = promotionName;
			this.discription = discrioption;
			this.beginTime = beginTime;
			this.endTime = endTime;

		}

		public int getPromotionID()
		{
			return promotionID;
		}
		public void setPromotionID(int promotionID)
		{
			this.promotionID = promotionID;
		}

		public string getPromotionName()
		{
			return promotionName;
		}
		public void setPromotionName(string promotionName)
		{
			this.promotionName = promotionName;
		}

		public string getDiscription()
		{
			return discription;
		}
		public void setDiscription(string discription)
		{
			this.discription = discription;
		}

		public string getBeginTime()
		{
			return beginTime;
		}
		public void setBeginTime(string beginTime)
		{
			this.beginTime = beginTime;
		}

		public string getEndTime()
		{
			return endTime;
		}
		public void setEndTime(string endTime)
		{
			this.endTime = endTime;
		}
	}
}

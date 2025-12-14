bkk=["All","คลองเตย", "คลองสาน", "คลองสามวา","คันนายาว","จตุจักร","จอมทอง","ดอนเมือง","ดินแดง","ดุสิต","ตลิ่งชัน","ทวีวิฒนา","ทุ่งครุ","ธนบุรี","บางกอกน้อย","บางกอกใหญ่","บางกะปิ","บางขุนเทียน","บางเขน","บางคอแหลม","บางแค","บางซื่อ","บางนา","บางบอน","บางพลัด","บางรัก","บึงกุ่ม","ปทุมวัน","ประเวศ","ป้อมปราบศัตรูพ่าย","พญาไท","พระโขนง","พระนคร","ภาษีเจริญ","มีนบุรี","ยานาวา","ราชเทวี","ราชบูรณะ","ลาดระบัง","ลาดพร้าว","วังทองหลาง","วัฒนา","สวนหลวง","สะพานสูง","สัมพันธวงศ์","สาธร","สายไหม","หนองแขม","หนองจอก","หลักสี่","ห้วยขวาง"];
samutprakan=["All","บางบ่อ","บางพลี","พระปะแดง","เมือง"];
function cityChange(a){
	switch  (a.document.form1.province.value)
	{
		case "กรุงเทพ":
		{
			a.document.form1.area.options.length=0;
			
			for (var  i=0;i<bkk.length;i++)
				{
					var option0 = new Option(bkk[i],bkk[i]);
					a.document.form1.area.options[i]=option0;
				}
				break;
		}
		case "สมุทรปราการ":
		{
			a.document.form1.area.options.length=0;			
			for (var  i=0;i<samutprakan.length;i++)
			{
				var option0 = new Option(samutprakan[i],samutprakan[i]);
				a.document.form1.area.options[i]=option0;
			}
			break;
		}	
		case "null":
		{
			a.document.form1.area.options.length=0;			
			break;
		}	
	}	
}
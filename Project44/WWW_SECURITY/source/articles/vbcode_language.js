// the following are the text prompts for buttons etc.
// DO NOT ADD LINE-BREAKS BETWEEN THE "...." QUOTES!

// MINI-HELP MESSAGES


b_text = "แทรกข้อความตัวหนาลงไป\n รูปแบบ : [b] isag [/b]";
i_text = "แทรกข้อความตัวเอียงลงไป\n รูปแบบ : [i] isag [/i]";
u_text = "แทรกข้อความตัวขีดเส้นใต้ลงไป\n รูปแบบ : [u] isag [/u]";

url_text = "แทรก Url ลงไป\n รูปแบบ : [url=http://cnn.com] CNN [/url]";
email_text = "แทรก email ลงไป\n Option นี้ยังใช้ไม่ได้";

list_text = "แทรกลำดับรายการ";

norm_text = "Mode การใช้งานปกติ เมื่อต้องการจัดรูปแบบตัวอักษร เช่น ตัวหนา เมื่อกดปุ่ม B จะมี Dialog ให้ผู้ใช้กรอกข้อความตามปกติ";
enha_text = "Mode การใช้งานพิเศษ สามารถซ้อน Tag ได้ เมื่อต้องการจัดรูปแบบตัวอักษร เช่นตัวหนา เมื่อกดปุ่ม B จะพิพม์ [B] ลงไปใน Textarea โดยอัติโนมัติ";

closecurrent_text = "ปิด Tag ปัจจุบันที่กำลังเรียกใช้ เช่น ถ้ามีการเปิด Tag ไว้เพื่อพิพม์ตัวหนา คือ [B] เมื่อคลิกปุ่มนี้จะปิดแท็ก [/B] โดยอัติโนมัติ";
closeall_text = "ปิด Tag ทั้งหมดที่ได้เปิดไว้ เช่น ถ้ามีการเปิดแท็ก [B] [I] ไว้ เมื่อคลิกปุ่มนี้จะปิดแท็ก [/I] [/B] โดยอัติโนมัติ";

// ERROR MESSAGES

enhanced_only_text = "<< This is only available in Enhanced Mode >>";
no_tags_text = "<< No open vBcode tags detected. >>";
already_open_text = "<< You already have an open tag of this type >>";

// TEXT FOR POP-UP PROMPTS

tag_prompt = "ใส่ข้อมูลที่ต้องการจัดรูปแบบ:";

font_formatter_prompt = "Enter the text to be formatted with the specified";

link_text_prompt = "ใส่ข้อมูลที่จะแสดงเป็นชื่อลิงค์";
link_url_prompt = "ใส่ URL เต็มๆ ";
link_email_prompt = "ใส่ Email Address";

list_type_prompt = "เลือกชนิดของ list ที่ต้องการ   \n '1' สำหรับลิสต์แบบตัวเลข 'a' สำหรับตัวอักษร หรือว่างไว้สำหรับลิสต์แบบ bullet";
list_item_prompt = "กรอกลิสต์แต่ละอัน  \n กด Cancel หรือว่างไว้เมื่อกรอกข้อมูลเสร็จแล้ว";


preview_text = "คลิกเมื่อต้องการ Preview ดูรูปแบบของเอกสาร สามารถ Preview ดูได้เรื่อยๆ เพื่อตรวจสอบความถูกต้องและสามารถกลับมาแก้ไขเอกสารได้ตามปกติ";
add_text = "คลิกเมื่อใส่ข้อมูลหมดแล้วและต้องการ Add เอกสารนี้ลง Database \n";
key_text = "ใส่ keyword ที่ใช้ในการค้นหาเอกสารนี้  แต่ละ keyword เว้น 1 space เช่น \n encrypt security hacker";
name_text = "ใส่ชื่อของบทความนี้ \n";
listgroup_text = "เลือกชื่อหมวดของบทความนี้ ว่าบทความนี้จัดอยู่ในหมวดไหน ถ้ายังไม่มีหมวดที่เหมาะสม ก็สามารถสร้างหมวดใหม่ได้ โดยกรอกลงช่องด้านล่าง";
newgroup_text = "ถ้าไม่มีชื่อหมวดที่เหมาะสมสำหรับบทความนี้ สามารถสร้างหมวดใหม่ได้ โดยกรอกข้อมูลลงไปแล้วกดปุ่ม new group ด้านขวา";
submitnewgroup_text = "เพิ่มหมวดใหม่เข้าไปในฐานข้อมูล";
delgroup_text = "ลบชื่อหมวดของบทความที่ได้เลือกไว้ทางซ้ายมือทิ้ง (Alert !!!) ";
selectfile_text = "เมื่อต้องการ Upload รูปภาพเพื่อแสดงในเอกสาร คลิก Browse ขวามือ เพื่อเลือกชื่อไฟล์ แล้วคลิก ปุ่ม Upload เพื่อทำการ Upload";
uploadfile_text = "เมื่อคลิกปุ่มนี้จะทำการ Upload รูปที่เลือกไว้ช่องซ้ายมือมาไว้ที่ Server ";
ifont_text = "Click เมื่อต้องการขยายขนาดของตัวอักษรในช่องกรอกข้อความ";
dfont_text = "Click เมื่อต้องการลดขนาดของตัวอักษรในช่องกรอกข้อความ";
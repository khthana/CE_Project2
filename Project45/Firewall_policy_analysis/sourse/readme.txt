โปรแกรมแบ่งเป็นสองส่วน
สามารถติดตั้งโดยการ
แตก Traffic_gen.tar.gz ไว้หน้า FIREWALL
จากนั้นติดตั้งโดยคำสัง 
- make
- make install
ส่วน receiver.tar.gz ให้ทำเหมือนกันเพียงแต่เอาไว้ที่เครื่องหลัง FIREWALL
เพียงแต่ ฝั่งนี้ต้อง install libary libpcap ไว้ด้วย
จากนั้น ก็start โปรแกรมฝั่ง receiver ด้วย ./main
จากนั้นก็มา start ฝั่ง Traffic_gen ด้วยคำสัง ./connection 
42010229
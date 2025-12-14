#---------------------------------- Import Module ---------------------------------------------

from __future__ import division
import MySQLdb
import time

#-----------------------------------------------------------------------------------------------
#---------------------------------- Connect Databases ------------------------------------------
start_time = time.time()
connection = MySQLdb.connect('localhost','root','asdzxc','demo_project')
cursor = connection.cursor()

#-----------------------------------------------------------------------------------------------

def Delete_teacher_new():
    query = "UPDATE teacher_teach SET t_status = '0' WHERE faculty_id = '01'"
    cursor.execute(query)    

def Delete_Authorities():
    query  = "UPDATE authorities_new SET a_status = '0' WHERE faculty_id = '01'"
    cursor.execute(query)
                           
def Delete_exam_Control():
    query  = "UPDATE exam_room SET Control_ID1 = '',Control_ID2 = '' WHERE dept_id = '01'"
    cursor.execute(query)

def FindControl (Subject, Date):
    for indexSubject in Subject:
        query = "SELECT teacher_id FROM teacher_teach WHERE subject_id = '%s' AND t_status = '0'"%(indexSubject[1])
        cursor.execute(query)
        Control1 = cursor.fetchall()

        if Control1:
            query = "SELECT authorities_id FROM authorities_new WHERE dept_id = '%s' AND a_status = '0'"%(indexSubject[0])
            cursor.execute(query)
            Control2 = cursor.fetchall()
                            
            Match(indexSubject[1], Control1[0][0], Control2[0][0], indexSubject[3])
        else:
            indexDate = 0

            for SelectDate in Date:
                if str(indexSubject[2]) == str(SelectDate[0]):
                    break
                indexDate += 1
                    
            while(1):
                if indexDate == (len(Date) - 1):
                    indexDate = -1
                    
                indexDate +=1

                query = "SELECT Subject_id FROM exam_room WHERE exam_date = '%s' AND dept_id = '%s'"%(Date[indexDate][0], indexSubject[0])
                cursor.execute(query)
                Stmp = cursor.fetchall()

                if Stmp:
                    for Sindex in Stmp:

                        query = "SELECT * FROM exam_room WHERE exam_date = '%s' AND Subject_id IN "%(indexSubject[2])
                        query += "(SELECT subject_id FROM teacher_teach WHERE teacher_id = "
                        query += "(SELECT teacher_id FROM teacher_teach WHERE subject_id = '%s' AND t_status = '0'))"%(Sindex[0])
                        query += "OR Control_ID1 IN (SELECT teacher_id FROM teacher_teach WHERE subject_id = '%s')"%(Sindex[0])
                        cursor.execute(query)
                        ChkCon = cursor.fetchall()
                                                                                                    
                        if not ChkCon:
                            break                    
                    if not ChkCon:
                        query = "SELECT teacher_id FROM teacher_teach WHERE subject_id = '%s'"%(Sindex[0])
                        cursor.execute(query)
                        Control1 = cursor.fetchall()
                        query = "SELECT authorities_id FROM authorities_new WHERE dept_id = '%s' AND a_status = 0"%(indexSubject[0])
                        cursor.execute(query)
                        Control2 = cursor.fetchall()

                        Match(indexSubject[1], Control1[0][0], Control2[0][0], indexSubject[3])

                        break

def Match(Subject, Control, Control2, room_no):
    print Subject, Control, Control2, room_no
    query = "UPDATE teacher_teach SET t_status = '1' WHERE Subject_id = '%s' AND teacher_id = '%s'"%(Subject, Control)
    cursor.execute(query)
    query = "UPDATE authorities_new SET a_status = '1' WHERE authorities_id= '%s'"%(Control2)
    cursor.execute(query)
    query = "UPDATE exam_room SET Control_ID1 = '%s', Control_ID2 = '%s' WHERE Subject_id = '%s' AND room_no = '%s'"%(Control, Control2, Subject, room_no)
    cursor.execute(query)
		    
#--------------------------------------พื้นที่ สิ้นสุด Define Function-----------------------------------------------        

Delete_exam_Control()
Delete_teacher_new()
Delete_Authorities()
query = "SELECT DISTINCT exam_date FROM exam_room ORDER BY exam_date,exam_time"
cursor.execute(query)
Date = cursor.fetchall()
for loopDate in Date:
    print loopDate[0]
    query = "SELECT dept_id, subject_id, exam_date, room_no FROM exam_room "
    query += "WHERE exam_date = '%s' AND exam_time = '09:30:00'"%(loopDate[0])
    cursor.execute(query)
    Subject = cursor.fetchall()
    print Date
    FindControl(Subject, Date)
    Delete_teacher_new()

    print loopDate[0]    
    query = "SELECT dept_id, subject_id, exam_date, room_no FROM exam_room"
    query += " WHERE exam_date = '%s' AND exam_time = '13:00:00' OR exam_time = '13:30:00'"%(loopDate[0])
    cursor.execute(query)
    Subject = cursor.fetchall()
    FindControl(Subject, Date)
    Delete_teacher_new()

#---------------------------------- Diconnect Databases ----------------------------------------
 
cursor.close()
connection.close()

end_time = time.time()
time = end_time - start_time
print "โปรแกรมนี้ใช้เวลาทั้งหมด %.4f วินาที" %time
#-----------------------------------------------------------------------------------------------



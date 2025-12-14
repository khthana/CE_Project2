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

def Update_room():
    query = "UPDATE room SET state_odd = '0',state_even='0'"
    cursor.execute(query)

def Delete_exam_room() :
    query = "DELETE FROM exam_room"
    cursor.execute(query)

def FreeCall() :
    query = "DELETE FROM exam_room WHERE exam_date='0000-00-00'"
    cursor.execute(query)

def FreeCall1() :
    query = "DELETE FROM exam_room"
    cursor.execute(query)
    
def Delete_mark_subject():
    query = "DELETE FROM mark_subject"
    cursor.execute(query)

def TempSubject(Subject) :
    for i in Subject :
        query = "INSERT INTO mark_subject (faculty_id,dept_id,subject_id,amount_std,exam_date,exam_time,mark) VALUE('%s','%s','%s','%s','%s','%s','%s')"%(i[0],i[1],i[2],i[3],i[4],i[5],'0')
        cursor.execute(query)
        
def mark_subject(subject):
    query = "UPDATE mark_subject SET mark = '1' WHERE subject_id='%s' "%(subject)
    cursor.execute(query)
    
def CompRoom(odd,new) :
    a=len(odd)-1
    b=int(odd[a][9])
    c=int(new[len(new)-1][9])
    if b > c:
        return new
    else :
        return odd
    
def SetRoom_B(r_list) :
    for i in r_list :
        query = "INSERT INTO exam_room (exam_date,exam_time,faculty_id,dept_id,subject_id,building_no,room_no,line,amount_std) VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s')"%(i[0],i[1],i[2],i[3],i[4],i[5],i[6],i[7],i[8])
        cursor.execute(query) # set room
        if i[7] == '1' :
            query = "UPDATE room SET state_odd = '1' WHERE building_no = '%s' AND room_no = '%s' "%(i[5],i[6])
            cursor.execute(query) #mark room
        elif i[7] == '2' :
            query = "UPDATE room SET state_even = '1' WHERE building_no = '%s' AND room_no = '%s' "%(i[5],i[6])
            cursor.execute(query) #mark room

def SetRoom_SubjectNotExamRoom(r_list) :
    for i in r_list :
        query = "INSERT INTO subject_not_exam_room (exam_date,exam_time,faculty_id,dept_id,subject_id,building_no,room_no,line,amount_std) VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s')"%(i[0],i[1],i[2],i[3],i[4],i[5],i[6],i[7],i[8])
        cursor.execute(query) # set room




    
def FindRoom(FacID,SubID,Dept_id) :
    query = "SELECT * FROM mark_subject ORDER BY amount_std DESC"
    cursor.execute(query)
    Subject = cursor.fetchall()
    fuzzy = 0.7
    if Subject :
        for i in Subject :  # faculty_id,dept_id,subject_id,amount_std,exam_date,exam_time,mark
            if str(i[6]) == '0' :
                query = "SELECT building_no, room_no , odd , even , state_odd , state_even FROM room WHERE faculty_id = '%s' AND dept_id ='%s'"%(FacID,Dept_id)
                cursor.execute(query)
                Room = cursor.fetchall()
                room = [] # list(Room)
                
                if Room :
                    std=[]
                    std_p=[]
                    loop=0
                    for j in range(0,len(Room)) :
                        std.insert(j,i[3])
                        std_p.insert(j,0)
                        room.insert(j,[])

                    temp_room=[]
                    temp_room.append(('0','0','0','0','0','0','0','0','0','100'))
                    for k in Room :#building_no, room_no , odd , even , state_odd , state_even
                        l=0
                        a=0
                        if k[2] >= k[3] and str(k[4])=='0':
                            a=1
                        elif k[3] >= k[2] and str(k[5])=='0' :
                            a=2

                        if a:
                            while l <= loop :
                                if a == 1 :
                                    if std[l] > k[2] :
                                        room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'1',k[2],k[2]))
                                        std_p[l] = int(std[l]) / int(k[2])
                                        std[l] = int(std[l]) - int(k[2])
                                    else :
                                        std_odd = std[l] / k[2]
                                        if str(k[4]) == '0' and std_odd >= fuzzy and std_odd <= 1:
                                            room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'1',std[l],k[2]-std[l] ))                                      
                                            temp_room = CompRoom(temp_room,room[l])
                                            b = room[l]
                                            room.remove(b)
                                            room.insert(l,[])                                            
                                            std[l] = i[3]
                                        else :
                                            b = room[l]
                                            room.remove(b)
                                            room.insert(l,[])
                                            std[l] = i[3]
                                            
                                elif a==2:
                                    if std[l] > k[3] :
                                        room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'2',k[3],k[3]))
                                        std_p[l] = int(std[l]) / int(k[2])
                                        std[l] = int(std[l]) - int(k[2])
                                    else :
                                        std_even = std[l] / k[3]
                                        if str(k[5]) == '0' and std_even >= fuzzy and std_even <= 1:
                                            room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'2',std[l],k[3]-std[l]))
                                            temp_room = CompRoom(temp_room,room[l])
                                            b = room[l]
                                            room.remove(b)
                                            room.insert(l,[])                                            
                                            std[l] = i[3]
                                        else :
                                            b = room[l]
                                            room.remove(b)
                                            room.insert(l,[])                                            
                                            std[l] = i[3]
                                l=l+1
                        loop=loop+1
                    if temp_room[len(temp_room)-1][7]:
                        SetRoom_B(temp_room)
                        mark_subject(temp_room[len(temp_room)-1][4])
        query = "SELECT * FROM mark_subject WHERE mark='0' ORDER BY amount_std DESC"
        cursor.execute(query)
        Subject = cursor.fetchall()
        if Subject:
            z=0
            while(1):
                query = "SELECT * FROM mark_subject WHERE mark='0' ORDER BY amount_std DESC"
                cursor.execute(query)
                Subject = cursor.fetchall()
                
                for i in Subject :                    
                    query = "SELECT  p1,p2,p3,p4 FROM pri_building WHERE  faculty_id='%s' AND dept_id='%s'"%(FacID,Dept_id)
                    cursor.execute(query)
                    Building = cursor.fetchall()
                    query = "SELECT building_no, room_no , odd , even , state_odd , state_even FROM room WHERE faculty_id = '%s' AND building_no ='%s' AND dept_id='' "%(FacID,Building[0][a])
                    cursor.execute(query)
                    Room = cursor.fetchall()
                    room = []
                    if Room :
                        std=[]
                        std_p=[]
                        loop=0
                        for j in range(0,len(Room)) :
                            std.insert(j,i[3])
                            std_p.insert(j,0)
                            room.insert(j,[])
                        temp_room=[]
                        temp_room.append(('0','0','0','0','0','0','0','0','0','100'))
                        for k in Room :#building_no, room_no , odd , even , state_odd , state_even
                            l=0
                            a=0
                            if k[2] >= k[3] and str(k[4])=='0':
                                a=1
                            elif k[3] >= k[2] and str(k[5])=='0' :
                                a=2

                            if a:
                                while l <= loop :
                                    if a == 1 :
                                        if std[l] > k[2] :
                                            room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'1',k[2],k[2]))
                                            std_p[l] = int(std[l]) / int(k[2])
                                            std[l] = int(std[l]) - int(k[2])
                                        else :
                                            std_odd = std[l] / k[2]
                                            if str(k[4]) == '0' and std_odd >= fuzzy and std_odd <= 1:
                                                room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'1',std[l],k[2]-std[l] ))                                      
                                                temp_room = CompRoom(temp_room,room[l])
                                                b = room[l]
                                                room.remove(b)
                                                room.insert(l,[])                                            
                                                std[l] = i[3]
                                            else :
                                                b = room[l]
                                                room.remove(b)
                                                room.insert(l,[])
                                                std[l] = i[3]
                                                
                                    elif a==2:
                                        if std[l] > k[3] :
                                            room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'2',k[3],k[3]))
                                            std_p[l] = int(std[l]) / int(k[2])
                                            std[l] = int(std[l]) - int(k[2])
                                        else :
                                            std_even = std[l] / k[3]
                                            if str(k[5]) == '0' and std_even >= fuzzy and std_even <= 1:
                                                room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'2',std[l],k[3]-std[l]))
                                                temp_room = CompRoom(temp_room,room[l])
                                                b = room[l]
                                                room.remove(b)
                                                room.insert(l,[])                                            
                                                std[l] = i[3]
                                            else :
                                                b = room[l]
                                                room.remove(b)
                                                room.insert(l,[])                                            
                                                std[l] = i[3]
                                    l=l+1
                            loop=loop+1
                        if temp_room[len(temp_room)-1][7]:
                            SetRoom_B(temp_room)
                            mark_subject(temp_room[len(temp_room)-1][4])                              
                z=z+1
                if z==4 or not(Subject):
                    break

            query = "SELECT * FROM mark_subject WHERE mark='0' ORDER BY amount_std DESC"
            cursor.execute(query)
            Subject = cursor.fetchall()
            if Subject :
                for i in Subject :  # faculty_id,dept_id,subject_id,amount_std,exam_date,exam_time,mark
                    if str(i[6]) == '0' :
                        query = "SELECT building_no, room_no , odd , even , state_odd , state_even FROM room WHERE faculty_id = '%s' AND dept_id ='%s'"%(FacID,Dept_id)
                        cursor.execute(query)
                        Room = cursor.fetchall()
                        room = [] # list(Room)
                        
                        if Room :
                            std=[]
                            std_p=[]
                            loop=0
                   #         print 'len(Room)',len(Room)
                            for j in range(0,len(Room)) :
                                std.insert(j,i[3])
                                std_p.insert(j,0)
                                room.insert(j,[])

                            temp_room=[]
                            temp_room.append(('0','0','0','0','0','0','0','0','0','100'))
                            for k in Room :#building_no, room_no , odd , even , state_odd , state_even
                                l=0
                                a=0
                                if k[2] >= k[3] and str(k[4])=='0':
                                    a=1
                                elif k[3] >= k[2] and str(k[5])=='0' :
                                    a=2

                                if a:
                          #          print 'a',a
                                    while l <= loop :                                        
                                        if a == 1 :
                                            if std[l] > k[2] :
                                                room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'1',k[2],k[2]))
                                                std_p[l] = int(std[l]) / int(k[2])
                                                std[l] = int(std[l]) - int(k[2])
                                            else :
                                                std_odd = std[l] / k[2]
                                                if str(k[4]) == '0' and std_odd >= 0.5 and std_odd <= 1:
                                                    room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'1',std[l],k[2]-std[l] ))                                      
                                                    temp_room = CompRoom(temp_room,room[l])
                                                    b = room[l]
                                                    room.remove(b)
                                                    room.insert(l,[])                                            
                                                    std[l] = i[3]
                                                else :
                                                    b = room[l]
                                                    room.remove(b)
                                                    room.insert(l,[])
                                                    std[l] = i[3]
                                                    
                                        elif a==2:
                                            if std[l] > k[3] :
                                                room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'2',k[3],k[3]))
                                                std_p[l] = int(std[l]) / int(k[2])
                                                std[l] = int(std[l]) - int(k[2])
                                            else :
                                                std_even = std[l] / k[3]
                                                if str(k[5]) == '0' and std_even >= 0.5 and std_even <= 1:
                                                    room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'2',std[l],k[3]-std[l]))
                                                    temp_room = CompRoom(temp_room,room[l])
                                                    b = room[l]
                                                    room.remove(b)
                                                    room.insert(l,[])                                            
                                                    std[l] = i[3]
                                                else :
                                                    b = room[l]
                                                    room.remove(b)
                                                    room.insert(l,[])                                            
                                                    std[l] = i[3]
                                        l=l+1
                                loop=loop+1
                            if temp_room[len(temp_room)-1][7]:
                                SetRoom_B(temp_room)
                                mark_subject(temp_room[len(temp_room)-1][4])         
                query = "SELECT * FROM mark_subject WHERE mark='0' ORDER BY amount_std DESC"
                cursor.execute(query)
                Subject = cursor.fetchall()
                z=0
                if Subject:
                    while(Subject):
                        query = "SELECT * FROM mark_subject WHERE mark='0' ORDER BY amount_std DESC"
                        cursor.execute(query)
                        Subject = cursor.fetchall()
                        
                        for i in Subject :                    
                            query = "SELECT  p1,p2,p3,p4 FROM pri_building WHERE  faculty_id='%s' AND dept_id='%s'"%(FacID,Dept_id)
                            cursor.execute(query)
                            Building = cursor.fetchall()
                            query = "SELECT building_no, room_no , odd , even , state_odd , state_even FROM room WHERE faculty_id = '%s' AND building_no ='%s' AND dept_id='' "%(FacID,Building[0][a])
                            cursor.execute(query)
                            Room = cursor.fetchall()
                            
                            room = []
                            if Room :
                                std=[]
                                std_p=[]
                                loop=0
                                for j in range(0,len(Room)) :
                                    std.insert(j,i[3])
                                    std_p.insert(j,0)
                                    room.insert(j,[])
                                temp_room=[]
                                temp_room.append(('0','0','0','0','0','0','0','0','0','100'))
                                for k in Room :#building_no, room_no , odd , even , state_odd , state_even
                                    l=0
                                    a=0
                                    if k[2] >= k[3] and str(k[4])=='0':
                                        a=1
                                    elif k[3] >= k[2] and str(k[5])=='0' :
                                        a=2

                                    if a:
                                        while l <= loop :
                                            if a == 1 :
                                                if std[l] > k[2] :
                                                    room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'1',k[2],k[2]))
                                                    std_p[l] = int(std[l]) / int(k[2])
                                                    std[l] = int(std[l]) - int(k[2])
                                                else :
                                                    std_odd = std[l] / k[2]
                                                    if str(k[4]) == '0' and std_odd >= 0.5 and std_odd <= 1:
                                                        room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'1',std[l],k[2]-std[l] ))                                      
                                                        temp_room = CompRoom(temp_room,room[l])
                                                        b = room[l]
                                                        room.remove(b)
                                                        room.insert(l,[])                                            
                                                        std[l] = i[3]
                                                    else :
                                                        b = room[l]
                                                        room.remove(b)
                                                        room.insert(l,[])
                                                        std[l] = i[3]
                                                        
                                            elif a==2:
                                                if std[l] > k[3] :
                                                    room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'2',k[3],k[3]))
                                                    std_p[l] = int(std[l]) / int(k[2])
                                                    std[l] = int(std[l]) - int(k[2])
                                                else :
                                                    std_even = std[l] / k[3]
                                                    if str(k[5]) == '0' and std_even >= 0.5 and std_even <= 1:
                                                        room[l].append((i[4],i[5],i[0],i[1],i[2],k[0],k[1],'2',std[l],k[3]-std[l]))
                                                        temp_room = CompRoom(temp_room,room[l])
                                                        b = room[l]
                                                        room.remove(b)
                                                        room.insert(l,[])                                            
                                                        std[l] = i[3]
                                                    else :
                                                        b = room[l]
                                                        room.remove(b)
                                                        room.insert(l,[])                                            
                                                        std[l] = i[3]

                                            l=l+1
                                    loop=loop+1
                                if temp_room[len(temp_room)-1][7]:
                                    SetRoom_B(temp_room)
                                    mark_subject(temp_room[len(temp_room)-1][4])                              
                        query = "SELECT subject_id ,amount_std FROM mark_subject WHERE mark='0' ORDER BY amount_std DESC"
                        cursor.execute(query)
                        Subject = cursor.fetchall()                    
                        z = z+1
                        if z==4 or not(Subject):
                            break                
                    query = "SELECT * FROM mark_subject WHERE mark='0' ORDER BY amount_std DESC"
                    cursor.execute(query)
                    Subject = cursor.fetchall()
                    if Subject:
                        print 'วิชาที่ไม่สามารถจัดห้องสอบได้'
                        for x in Subject:
                            print x
                            print x[0],x[1],x[2],x[4],x[5],x[3]
                            print 'faculty_id,dept_id,subject_id,exam_date,exam_time,sum_std'
                            query = "INSERT INTO subject_not_exam_room (faculty_id,dept_id,subject_id,exam_date,exam_time,sum_std) VALUES ('%s','%s','%s','%s','%s','%s')"%(x[0],x[1],x[2],x[4],x[5],x[3])
                            cursor.execute(query)                            
        
#-----------------------------------------------------------------------------------------------

    
query = "SELECT DISTINCT exam_date,exam_time FROM subject ORDER BY exam_date,exam_time"
cursor.execute(query)
ExamDateTime = cursor.fetchall()

query = "SELECT faculty_id FROM faculty"
cursor.execute(query)
FacultyID = cursor.fetchall()

Update_room()
Delete_exam_room()
FreeCall1()

for exam in ExamDateTime :
    Date = str(exam[0])
    Time = str(exam[1])
    ss = "%"
    
    for fac in FacultyID :        
        FacID = str(fac[0])
        query = "SELECT * FROM code_subject_dept WHERE faculty_id = '%s' ORDER BY dept_id"%(FacID)
        cursor.execute(query)
        SubjectID = cursor.fetchall()
        for subject in SubjectID:  #วิชาที่อยู่ในคณะวิศวะ ที่ขึ้นต้นด้วย 01xxxxx
                Delete_mark_subject()
                SubID = str(subject[2])
                Dept_id = str(subject[1])
                query = "SELECT faculty_id,dept_id,subject_id ,sum_std,exam_date,exam_time FROM subject WHERE faculty_id = '%s' AND exam_date = '%s' AND exam_time = '%s' AND subject_id like '%s%s' GROUP BY subject_id "%(FacID,Date,Time,SubID,ss)
                print "------------------------"
                cursor.execute(query)
                Subject = cursor.fetchall()
                TempSubject(Subject)               
                FindRoom(FacID,SubID,Dept_id)

FreeCall()
#---------------------------------- Diconnect Databases ----------------------------------------
 
cursor.close()
connection.close()

end_time = time.time()
time = end_time - start_time
print "โปรแกรมนี้ใช้เวลาทั้งหมด %.4f วินาที" %time
#-----------------------------------------------------------------------------------------------

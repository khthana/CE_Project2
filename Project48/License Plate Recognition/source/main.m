%clear all;
close all;

load net.mat net;
%load thainet(2).mat thainet;
b = imread('PICT0008.jpg');
resize = imresize(b,[540,720]);
level = graythresh( resize );
picbw = ~im2bw( resize ,level);
L = medfilt2(picbw,[3 3]);
l =  bwlabel(L,8);
Cha  = regionprops(l,'all');
sC = size(Cha);

n(1) = ['1'];n(2) = ['2'];n(3) = ['3'];n(4) = ['4'];n(5) = ['5'];
n(6) = ['6'];n(7) = ['7'];n(8) = ['8'];n(9) = ['9'];n(10) = ['0'];

a(1) = ['¡'];a(2) = ['¢'];a(3) = ['£'];a(4) = ['¤'];a(5) = ['¥'];
a(6) = ['¦'];a(7) = ['§'];a(8) = ['¨'];a(9) = ['©'];a(10) = ['ª'];
a(11) = ['«'];a(12) = ['¬'];a(13) = ['­'];a(14) = ['®'];a(15) = ['¯'];
a(16) = ['°'];a(17) = ['±'];a(18) = ['²'];a(19) = ['³'];a(20) = ['´'];
a(21) = ['µ'];a(22) = ['¶'];a(23) = ['·'];a(24) = ['¸'];a(25) = ['¹'];
a(26) = ['º'];a(27) = ['»'];a(28) = ['¼'];a(29) = ['½'];a(30) = ['¾'];
a(31) = ['¿'];a(32) = ['À'];a(33) = ['Á'];a(34) = ['Â'];a(35) = ['Ã'];
a(36) = ['Å'];a(37) = ['Ç'];a(38) = ['È'];a(39) = ['É'];a(40) = ['Ê'];
a(41) = ['Ë'];a(42) = ['Ì'];a(43) = ['Í'];a(44) = ['Î'];

index = 1;
index1 = 1; 
for i = 1:sC(1)

    Data(i).height = Cha(i).BoundingBox;
    
    if(Data(i).height(1,2) > 250)
    if(Data(i).height(1,4) > Data(i).height(1,3) )
        
       if(Cha(i).Area > 210)
           
       Char.height(1,index) = i;
       
       index = index + 1;   
       end;
       end;
    end;
end;

idx = Char.height;                   
BW2 = ismember(l,idx);
L = medfilt2(BW2,[3 3]);
S =  bwlabel(L,8);
Cha1  = regionprops(S,'all');
sC1 = size(Cha1);

for i=1:sC1
 re = imresize(Cha1(i).Image,[20,15]);
 result = [];
 count = 0;

 % row -> %
 for c=1:20
    for j=1:15
       if(re(c,j) == 1)
           count = count+1;
       end;
    end;
 result(c,1) = count;
 count = 0;
 end;

 % colomn | %
 for c=1:15
    for j=1:20
       if(re(j,c) == 1)
           count = count+1;
       end;
    end;
 result(c+20,1) = count;
 count = 0;
 end;
    
  if(i==1)
        charone = result;
        alphabet1 = sim(thainet,charone);
        alp1 = alphabet1 > 0.7;
        if(alp1 == [0;0;0;0;0;1])
            alp1 = a(1);
        else if(alp1 == [0;0;0;0;1;0])
            alp1 = a(2);
            else if(alp1 == [0;0;0;0;1;1])
            alp1 = a(4);
             else if(alp1 == [0;0;0;1;0;0])
            alp1 = a(7);
             else if(alp1 == [0;0;0;1;0;1])
            alp1 = a(8);
             else if(alp1 == [0;0;0;1;1;0])
            alp1 = a(9);
             else if(alp1 == [0;0;0;1;1;1])
            alp1 = a(10);
             else if(alp1 == [0;0;1;0;0;0])
            alp1 = a(14);
             else if(alp1 == [0;0;1;0;0;1])
            alp1 = a(16);
             else if(alp1 == [0;0;1;0;1;0])
            alp1 = a(19);
             else if(alp1 == [0;0;1;0;1;1])
            alp1 = a(21);
             else if(alp1 == [0;0;1;1;0;0])
            alp1 = a(23);
             else if(alp1 == [0;0;1;1;0;1])
            alp1 = a(24);
             else if(alp1 == [0;0;1;1;1;0])
            alp1 = a(25);
             else if(alp1 == [0;0;1;1;1;1])
            alp1 = a(26);
             else if(alp1 == [0;1;0;0;0;0])
            alp1 = a(27);
             else if(alp1 == [0;1;0;0;0;1])
            alp1 = a(30);
             else if(alp1 == [0;1;0;0;1;0])
            alp1 = a(32);
             else if(alp1 == [0;1;0;0;1;1])
            alp1 = a(33);
             else if(alp1 == [0;1;0;1;0;0])
            alp1 = a(34);
             else if(alp1 == [0;1;0;1;0;1])
            alp1 = a(35);
             else if(alp1 == [0;1;0;1;1;0])
            alp1 = a(36);
             else if(alp1 == [0;1;0;1;1;1])
            alp1 = a(37);
             else if(alp1 == [0;1;1;0;0;0])
            alp1 = a(38);
             else if(alp1 == [0;1;1;0;0;1])
            alp1 = a(39);
             else if(alp1 == [0;1;1;0;1;0])
            alp1 = a(40);
             else if(alp1 == [0;1;1;0;1;1])
            alp1 = a(41);
             else if(alp1 == [0;1;1;1;0;0])
            alp1 = a(42);
             else if(alp1 == [0;1;1;1;0;1])
            alp1 = a(43);
                 else (alp1 == [0;1;1;1;1;0])
            alp1 = a(44);
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 
end;
end;

                 
    else if(i==2)
          chartwo = result;
          alphabet2 = sim(thainet,chartwo);
        alp2 = alphabet2 > 0.7;
        if(alp2 == [0;0;0;0;0;1])
            alp2 = a(1);
        else if(alp2 == [0;0;0;0;1;0])
            alp2 = a(2);
            else if(alp2 == [0;0;0;0;1;1])
            alp2 = a(4);
             else if(alp2 == [0;0;0;1;0;0])
            alp2 = a(7);
             else if(alp2 == [0;0;0;1;0;1])
            alp2 = a(8);
             else if(alp2 == [0;0;0;1;1;0])
            alp2 = a(9);
             else if(alp2 == [0;0;0;1;1;1])
            alp2 = a(10);
             else if(alp2 == [0;0;1;0;0;0])
            alp2 = a(14);
             else if(alp2 == [0;0;1;0;0;1])
            alp2 = a(16);
             else if(alp2 == [0;0;1;0;1;0])
            alp2 = a(19);
             else if(alp2 == [0;0;1;0;1;1])
            alp2 = a(21);
             else if(alp2 == [0;0;1;1;0;0])
            alp2 = a(23);
             else if(alp2 == [0;0;1;1;0;1])
            alp2 = a(24);
             else if(alp2 == [0;0;1;1;1;0])
            alp2 = a(25);
             else if(alp2 == [0;0;1;1;1;1])
            alp2 = a(26);
             else if(alp2 == [0;1;0;0;0;0])
            alp2 = a(27);
             else if(alp2 == [0;1;0;0;0;1])
            alp2 = a(30);
             else if(alp2 == [0;1;0;0;1;0])
            alp2 = a(32);
             else if(alp2 == [0;1;0;0;1;1])
            alp2 = a(33);
             else if(alp2 == [0;1;0;1;0;0])
            alp2 = a(34);
             else if(alp2 == [0;1;0;1;0;1])
            alp2 = a(35);
             else if(alp2 == [0;1;0;1;1;0])
            alp2 = a(36);
             else if(alp2 == [0;1;0;1;1;1])
            alp2 = a(37);
             else if(alp2 == [0;1;1;0;0;0])
            alp2 = a(38);
             else if(alp2 == [0;1;1;0;0;1])
            alp2 = a(39);
             else if(alp2 == [0;1;1;0;1;0])
            alp2 = a(40);
             else if(alp2 == [0;1;1;0;1;1])
            alp2 = a(41);
             else if(alp2 == [0;1;1;1;0;0])
            alp2 = a(42);
             else if(alp2 == [0;1;1;1;0;1])
            alp2 = a(43);
                 else (alp2 == [0;1;1;1;1;0])
            alp2 = a(44);
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 end;
                 
end;
end;

        else if(i==3)
             charthree = result;
             number1 = sim(net,charthree);
             num1 = number1 > 0.7 ;
             if(num1 == [0;0;0;0;0;1])
                num1 = n(1);
            else if(num1 == [0;0;0;0;1;0])
            num1 = n(2);
            else if(num1 == [0;0;0;0;1;1])
            num1 = n(3);
            else if(num1 == [0;0;0;1;0;0])
            num1 = n(4);
            else if(num1 == [0;0;0;1;0;1])
            num1 = n(5);
            else if(num1 == [0;0;0;1;1;0])
            num1 = n(6);
            else if(num1 == [0;0;0;1;1;1])
            num1 = n(7);
            else if(num1 == [0;0;1;0;0;0])
            num1 = n(8);
            else if(num1 == [0;0;1;0;0;1])
            num1 = n(9);
                else (num1 == [0;0;0;0;0;0])
            num1 = n(10);
                end;
                end;
                end;
                end;
                end;
                end;
                end;
               
                
        end;
end;
            else if(i==4)
                charfour = result;
                number2 = sim(net,charfour);
                num2 = number2 > 0.7 ;
                if(num2 == [0;0;0;0;0;1])
                num2 = n(1);
            else if(num2 == [0;0;0;0;1;0])
            num2 = n(2);
            else if(num2 == [0;0;0;0;1;1])
            num2 = n(3);
            else if(num2 == [0;0;0;1;0;0])
            num2 = n(4);
            else if(num2 == [0;0;0;1;0;1])
            num2 = n(5);
            else if(num2 == [0;0;0;1;1;0])
            num2 = n(6);
            else if(num2 == [0;0;0;1;1;1])
            num2 = n(7);
            else if(num2 == [0;0;1;0;0;0])
            num2 = n(8);
            else if(num2 == [0;0;1;0;0;1])
            num2 = n(9);
                else (num2 == [0;0;0;0;0;0])
            num2 = n(10);
                end;
                end;
                end;
                end;
                end;
                end;
                end;
        end;
end;
                else if(i==5)
                        charfive = result;
                        number3 = sim(net,charfive);
                        num3 = number3 > 0.7 ;
                        if(num3 == [0;0;0;0;0;1])
                num3 = n(1);
            else if(num3 == [0;0;0;0;1;0])
            num3 = n(2);
            else if(num3 == [0;0;0;0;1;1])
            num3 = n(3);
            else if(num3 == [0;0;0;1;0;0])
            num3 = n(4);
            else if(num3 == [0;0;0;1;0;1])
            num3 = n(5);
            else if(num3 == [0;0;0;1;1;0])
            num3 = n(6);
            else if(num3 == [0;0;0;1;1;1])
            num3 = n(7);
            else if(num3 == [0;0;1;0;0;0])
            num3 = n(8);
            else if(num3 == [0;0;1;0;0;1])
            num3 = n(9);
                else (num3 == [0;0;0;0;0;0])
            num3 = n(10);
                end;
                end;
                end;
                end;
                end;
                end;
                end;
        end;
end;
                    else(i==6)
                        charsix = result;
                        number4 = sim(net,charsix);
                        num4 = number4 > 0.7 ;
                        if(num4 == [0;0;0;0;0;1])
                num4 = n(1);
            else if(num4 == [0;0;0;0;1;0])
            num4 = n(2);
            else if(num4 == [0;0;0;0;1;1])
            num4 = n(3);
            else if(num4 == [0;0;0;1;0;0])
            num4 = n(4);
            else if(num4 == [0;0;0;1;0;1])
            num4 = n(5);
            else if(num4 == [0;0;0;1;1;0])
            num4 = n(6);
            else if(num4 == [0;0;0;1;1;1])
            num4 = n(7);
            else if(num4 == [0;0;1;0;0;0])
            num4 = n(8);
            else if(num4 == [0;0;1;0;0;1])
            num4 = n(9);
                else (num4 == [0;0;0;0;0;0])
            num4 = n(10);
                end;
                end;
                end;
                end;
                end;
                end;
                end;
        end;
end;
                    end;
                end;
            end;
        end;
  end;
 end;

if (sC1(1) == 3)
    License = [alp1,alp2,num1];
else if (sC1(1) == 4)
        License = [alp1,alp2,num1,num2];
        else if (sC1(1) == 5)
        License = [alp1,alp2,num1,num2,num3];
            else  (sC1(1) == 6)
        License = [alp1,alp2,num1,num2,num3,num4];
            end;
    end;
end;








 
 

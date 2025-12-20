function varargout = main2(varargin)
% MAIN2 M-file for main2.fig
%      MAIN2, by itself, creates a new MAIN2 or raises the existing
%      singleton*.
%
%      H = MAIN2 returns the handle to a new MAIN2 or the handle to
%      the existing singleton*.
%
%      MAIN2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN2.M with the given input arguments.
%
%      MAIN2('Property','Value',...) creates a new MAIN2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main2_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main2

% Last Modified by GUIDE v2.5 16-Jan-2007 13:20:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main2_OpeningFcn, ...
                   'gui_OutputFcn',  @main2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main2 is made visible.
function main2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main2 (see VARARGIN)

global p_image;
try
    global vid;
    vid = videoinput('winvideo', 1, 'RGB24_640x480');

    global vid_src; 
    vid_src = getselectedsource(vid);
    vid_src.ZoomMode = 'manual';

    vidRes = get(vid, 'VideoResolution');
    nBands = get(vid, 'NumberOfBands');
    hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
    preview(vid, hImage);
catch
    msgbox('กรุณาตรวจสอบการเชื่อมต่อกับกล้อง','เกิดข้อผิดผลาด','none');
    close;
end
% Choose default command line output for main2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% Get default command line output from handles structure
varargout{1} = handles.output;

%///////////////////////////////////////////////////////////////////
%************************** Function *******************************
%*******************************************************************
%-------------------------------------------------------------------
function About()
    msgbox('Scoring Multiple Choices Project for KMITL','About');
%-------------------------------------------------------------------
function [chk] = checkans(answers)
conn = database('store','','');
curs = exec(conn,'select * from answers ORDER BY `id_ans`');
curs = fetch(curs);
dataans = curs.data;
close(conn);
chk = 0;
for i = 1:100
    datachar(i,1) = char(dataans(i,2));
    dataint(i) = str2num(datachar(i,1));
    if dataint(i) == answers(i) % เปรียบเทียบข้อมมูลจากที่เช็คออกมาจากกระดาษคำตอบกับคำตอบในฐานข้อมูล
        chk = chk + 1;          % นับจำนวนข้อที่ถูก
    end
end 
%--------------------------------------------------------------------
function IP_pi1=white_image(p_image)
%global p_image;
level = graythresh(p_image);
bw = im2bw(p_image,level);
pi1 = imcrop(bw,[min(find(sum(bw,1)>0)) ...				% start X
		      min(find(sum(bw,2)>0)) ...				% start Y
		     (max(find(sum(bw,1)>0))-min(find(sum(bw,1)>0))) ...	% Stop  X
		     (max(find(sum(bw,2)>0))-min(find(sum(bw,2)>0)))]);

[h l]=size(pi1);

left  = min(find(pi1(1:end,50)==1));%ซ้าย
right = min(find(pi1(1:end,550)==1));%ขวา
if ((left-right)<=(-4))|((left-right)>=(4))
    if (left<right)
        PIG = imrotate(p_image,((atand((min(find(pi1(1:end,l-3)==1)))/(l-(min(find(pi1(1:end,l-3)==1))))))),'bilinear');
        bw = im2bw(PIG,level);
        pi1 = imcrop(PIG,[min(find(sum(bw,1)>0)) ...				% start X
                    min(find(sum(bw,2)>0)) ...				% start Y
                    (max(find(sum(bw,1)>0))-min(find(sum(bw,1)>0))) ...	% Stop  X
                    (max(find(sum(bw,2)>0))-min(find(sum(bw,2)>0)))]);
    elseif (left>right)
        PIG = imrotate(p_image,(-(atand(min(find(pi1(1:end,50)==1))/(max(find(pi1(2,1:end)))-50)))),'bilinear');
        bw = im2bw(PIG,level);
        pi1 = imcrop(PIG,[min(find(sum(bw,1)>0)) ...				% start X
                    min(find(sum(bw,2)>0)) ...				% start Y
                    (max(find(sum(bw,1)>0))-min(find(sum(bw,1)>0))) ...	% Stop  X
                    (max(find(sum(bw,2)>0))-min(find(sum(bw,2)>0)))]);
    end
else
    pi1 = imcrop(p_image,[min(find(sum(bw,1)>0)) ...				% start X
                 min(find(sum(bw,2)>0)) ...				% start Y
                 (max(find(sum(bw,1)>0))-min(find(sum(bw,1)>0))) ...	% Stop  X
                 (max(find(sum(bw,2)>0))-min(find(sum(bw,2)>0)))]);
end

%clear I;
[h l z]=size(pi1);
if (h>414)&(l>625)
    pi1 = im2double(imcrop(pi1,[3 3 623 411]));
    h =412;
    l =624;
else
    pi1 = im2double(pi1);
end
%imwrite(BW,'01.jpg'); 
IP_pi1=pi1;

IP_pi1(1:194,1:271,1) = pi1(1:194,1:271,1)*(0.90/(sum(pi1([(((l*h)*0)+((18-1)*h+24)) (((l*h)*0)+((22-1)*h+144)) (((l*h)*0)+((26-1)*h+92)) (((l*h)*0)+((250-1)*h+26)) (((l*h)*0)+((244-1)*h+150))]))/5));
IP_pi1(1:194,1:271,2) = pi1(1:194,1:271,2)*(0.90/(sum(pi1([(((l*h)*1)+((18-1)*h+24)) (((l*h)*1)+((22-1)*h+144)) (((l*h)*1)+((26-1)*h+92)) (((l*h)*1)+((250-1)*h+26)) (((l*h)*1)+((244-1)*h+150))]))/5));
IP_pi1(1:194,1:271,3) = pi1(1:194,1:271,3)*(0.90/(sum(pi1([(((l*h)*2)+((18-1)*h+24)) (((l*h)*2)+((22-1)*h+144)) (((l*h)*2)+((26-1)*h+92)) (((l*h)*2)+((250-1)*h+26)) (((l*h)*2)+((244-1)*h+150))]))/5));

IP_pi1(1:82,535:l,1) = pi1(1:82,535:l,1)*(0.90/(sum(pi1([(((l*h)*0)+((567-1)*h+22)) (((l*h)*0)+((612-1)*h+17)) (((l*h)*0)+((616-1)*h+75)) (((l*h)*0)+((614-1)*h+76))]))/4));
IP_pi1(1:82,535:l,2) = pi1(1:82,535:l,2)*(0.90/(sum(pi1([(((l*h)*1)+((567-1)*h+22)) (((l*h)*1)+((612-1)*h+17)) (((l*h)*1)+((616-1)*h+75)) (((l*h)*1)+((614-1)*h+76))]))/4));
IP_pi1(1:82,535:l,3) = pi1(1:82,535:l,3)*(0.90/(sum(pi1([(((l*h)*2)+((567-1)*h+22)) (((l*h)*2)+((612-1)*h+17)) (((l*h)*2)+((616-1)*h+75)) (((l*h)*2)+((614-1)*h+76))]))/4));

IP_pi1(82:164,535:l,1) = pi1(82:164,535:l,1)*(0.90/(sum(pi1([(((l*h)*0)+((616-1)*h+89)) (((l*h)*0)+((617-1)*h+115)) (((l*h)*0)+((617-1)*h+155))]))/3));
IP_pi1(82:164,535:l,2) = pi1(82:164,535:l,2)*(0.90/(sum(pi1([(((l*h)*1)+((616-1)*h+89)) (((l*h)*1)+((617-1)*h+115)) (((l*h)*1)+((617-1)*h+155))]))/3));
IP_pi1(82:164,535:l,3) = pi1(82:164,535:l,3)*(0.90/(sum(pi1([(((l*h)*2)+((616-1)*h+89)) (((l*h)*2)+((617-1)*h+115)) (((l*h)*2)+((617-1)*h+155))]))/3));

IP_pi1(164:246,535:l,1) = pi1(164:246,535:l,1)*(0.90/(sum(pi1([(((l*h)*0)+((618-1)*h+229)) (((l*h)*0)+((616-1)*h+176)) (((l*h)*0)+((617-1)*h+171))]))/3));
IP_pi1(164:246,535:l,2) = pi1(164:246,535:l,2)*(0.90/(sum(pi1([(((l*h)*1)+((618-1)*h+229)) (((l*h)*1)+((616-1)*h+176)) (((l*h)*1)+((617-1)*h+171))]))/3));
IP_pi1(164:246,535:l,3) = pi1(164:246,535:l,3)*(0.90/(sum(pi1([(((l*h)*2)+((618-1)*h+229)) (((l*h)*2)+((616-1)*h+176)) (((l*h)*2)+((617-1)*h+171))]))/3));

IP_pi1(246:328,535:l,1) = pi1(246:328,535:l,1)*(0.90/(sum(pi1([(((l*h)*0)+((615-1)*h+252)) (((l*h)*0)+((615-1)*h+264)) (((l*h)*0)+((615-1)*h+268)) (((l*h)*0)+((617-1)*h+272))]))/4));
IP_pi1(246:328,535:l,2) = pi1(246:328,535:l,2)*(0.90/(sum(pi1([(((l*h)*1)+((615-1)*h+252)) (((l*h)*1)+((615-1)*h+264)) (((l*h)*1)+((615-1)*h+268)) (((l*h)*1)+((617-1)*h+272))]))/4));
IP_pi1(246:328,535:l,3) = pi1(246:328,535:l,3)*(0.90/(sum(pi1([(((l*h)*2)+((615-1)*h+252)) (((l*h)*2)+((615-1)*h+264)) (((l*h)*2)+((615-1)*h+268)) (((l*h)*2)+((617-1)*h+272))]))/4));

IP_pi1(328:h,535:l,1) = pi1(328:h,535:l,1)*(0.90/(sum(pi1([(((l*h)*0)+((560-1)*h+406)) (((l*h)*0)+((609-1)*h+407)) (((l*h)*0)+((618-1)*h+322)) (((l*h)*0)+((617-1)*h+333))]))/4));
IP_pi1(328:h,535:l,2) = pi1(328:h,535:l,2)*(0.90/(sum(pi1([(((l*h)*1)+((560-1)*h+406)) (((l*h)*1)+((609-1)*h+407)) (((l*h)*1)+((618-1)*h+322)) (((l*h)*1)+((617-1)*h+333))]))/4));
IP_pi1(328:h,535:l,3) = pi1(328:h,535:l,3)*(0.90/(sum(pi1([(((l*h)*2)+((560-1)*h+406)) (((l*h)*2)+((609-1)*h+407)) (((l*h)*2)+((618-1)*h+322)) (((l*h)*2)+((617-1)*h+333))]))/4));

IP_pi1(1:82,447:535,1) = pi1(1:82,447:535,1)*(0.90/(sum(pi1([(((l*h)*0)+((461-1)*h+20)) (((l*h)*0)+((512-1)*h+22)) (((l*h)*0)+((529-1)*h+79)) (((l*h)*0)+((528-1)*h+78))]))/4));
IP_pi1(1:82,447:535,2) = pi1(1:82,447:535,2)*(0.90/(sum(pi1([(((l*h)*1)+((461-1)*h+20)) (((l*h)*1)+((512-1)*h+22)) (((l*h)*1)+((529-1)*h+79)) (((l*h)*1)+((528-1)*h+78))]))/4));
IP_pi1(1:82,447:535,3) = pi1(1:82,447:535,3)*(0.90/(sum(pi1([(((l*h)*2)+((461-1)*h+20)) (((l*h)*2)+((512-1)*h+22)) (((l*h)*2)+((529-1)*h+79)) (((l*h)*2)+((528-1)*h+78))]))/4));

IP_pi1(82:164,447:535,1) = pi1(82:164,447:535,1)*(0.90/(sum(pi1([(((l*h)*0)+((444-1)*h+110)) (((l*h)*0)+((444-1)*h+152)) (((l*h)*0)+((530-1)*h+150)) (((l*h)*0)+((530-1)*h+100))]))/4));
IP_pi1(82:164,447:535,2) = pi1(82:164,447:535,2)*(0.90/(sum(pi1([(((l*h)*1)+((444-1)*h+110)) (((l*h)*1)+((444-1)*h+152)) (((l*h)*1)+((530-1)*h+150)) (((l*h)*1)+((530-1)*h+100))]))/4));
IP_pi1(82:164,447:535,3) = pi1(82:164,447:535,3)*(0.90/(sum(pi1([(((l*h)*2)+((444-1)*h+110)) (((l*h)*2)+((444-1)*h+152)) (((l*h)*2)+((530-1)*h+150)) (((l*h)*2)+((530-1)*h+100))]))/4));

IP_pi1(164:246,447:535,1) = pi1(164:246,447:535,1)*(0.90/(sum(pi1([(((l*h)*0)+((445-1)*h+204)) (((l*h)*0)+((444-1)*h+240)) (((l*h)*0)+((531-1)*h+170)) (((l*h)*0)+((530-1)*h+230))]))/4));
IP_pi1(164:246,447:535,2) = pi1(164:246,447:535,2)*(0.90/(sum(pi1([(((l*h)*1)+((445-1)*h+204)) (((l*h)*1)+((444-1)*h+240)) (((l*h)*1)+((531-1)*h+170)) (((l*h)*1)+((530-1)*h+230))]))/4));
IP_pi1(164:246,447:535,3) = pi1(164:246,447:535,3)*(0.90/(sum(pi1([(((l*h)*2)+((445-1)*h+204)) (((l*h)*2)+((444-1)*h+240)) (((l*h)*2)+((531-1)*h+170)) (((l*h)*2)+((530-1)*h+230))]))/4));

IP_pi1(246:328,447:535,1) = pi1(246:328,447:535,1)*(0.90/(sum(pi1([(((l*h)*0)+((444-1)*h+291)) (((l*h)*0)+((444-1)*h+277)) (((l*h)*0)+((530-1)*h+277)) (((l*h)*0)+((530-1)*h+300))]))/4));
IP_pi1(246:328,447:535,2) = pi1(246:328,447:535,2)*(0.90/(sum(pi1([(((l*h)*1)+((444-1)*h+291)) (((l*h)*1)+((444-1)*h+277)) (((l*h)*1)+((530-1)*h+277)) (((l*h)*1)+((530-1)*h+300))]))/4));
IP_pi1(246:328,447:535,3) = pi1(246:328,447:535,3)*(0.90/(sum(pi1([(((l*h)*2)+((444-1)*h+291)) (((l*h)*2)+((444-1)*h+277)) (((l*h)*2)+((530-1)*h+277)) (((l*h)*2)+((530-1)*h+300))]))/4));

IP_pi1(328:h,447:535,1) = pi1(328:h,447:535,1)*(0.90/(sum(pi1([(((l*h)*0)+((492-1)*h+407)) (((l*h)*0)+((465-1)*h+407)) (((l*h)*0)+((449-1)*h+341)) (((l*h)*0)+((527-1)*h+352))]))/4));
IP_pi1(328:h,447:535,2) = pi1(328:h,447:535,2)*(0.90/(sum(pi1([(((l*h)*1)+((492-1)*h+407)) (((l*h)*1)+((465-1)*h+407)) (((l*h)*1)+((449-1)*h+341)) (((l*h)*1)+((527-1)*h+352))]))/4));
IP_pi1(328:h,447:535,3) = pi1(328:h,447:535,3)*(0.90/(sum(pi1([(((l*h)*2)+((492-1)*h+407)) (((l*h)*2)+((465-1)*h+407)) (((l*h)*2)+((449-1)*h+341)) (((l*h)*2)+((527-1)*h+352))]))/4));

IP_pi1(1:82,359:447,1) = pi1(1:82,359:447,1)*(0.90/(sum(pi1([(((l*h)*0)+((368-1)*h+17)) (((l*h)*0)+((422-1)*h+16)) (((l*h)*0)+((361-1)*h+72)) (((l*h)*0)+((441-1)*h+78))]))/4));
IP_pi1(1:82,359:447,2) = pi1(1:82,359:447,2)*(0.90/(sum(pi1([(((l*h)*1)+((368-1)*h+17)) (((l*h)*1)+((422-1)*h+16)) (((l*h)*1)+((361-1)*h+72)) (((l*h)*1)+((441-1)*h+78))]))/4));
IP_pi1(1:82,359:447,3) = pi1(1:82,359:447,3)*(0.90/(sum(pi1([(((l*h)*2)+((368-1)*h+17)) (((l*h)*2)+((422-1)*h+16)) (((l*h)*2)+((361-1)*h+72)) (((l*h)*2)+((441-1)*h+78))]))/4));

IP_pi1(82:164,359:447,1) = pi1(82:164,359:447,1)*(0.90/(sum(pi1([(((l*h)*0)+((358-1)*h+109)) (((l*h)*0)+((441-1)*h+86)) (((l*h)*0)+((359-1)*h+153)) (((l*h)*0)+((443-1)*h+145))]))/4));
IP_pi1(82:164,359:447,2) = pi1(82:164,359:447,2)*(0.90/(sum(pi1([(((l*h)*1)+((358-1)*h+109)) (((l*h)*1)+((441-1)*h+86)) (((l*h)*1)+((359-1)*h+153)) (((l*h)*1)+((443-1)*h+145))]))/4));
IP_pi1(82:164,359:447,3) = pi1(82:164,359:447,3)*(0.90/(sum(pi1([(((l*h)*2)+((358-1)*h+109)) (((l*h)*2)+((441-1)*h+86)) (((l*h)*2)+((359-1)*h+153)) (((l*h)*2)+((443-1)*h+145))]))/4));

IP_pi1(164:246,359:447,1) = pi1(164:246,359:447,1)*(0.90/(sum(pi1([(((l*h)*0)+((444-1)*h+206)) (((l*h)*0)+((357-1)*h+180)) (((l*h)*0)+((358-1)*h+234)) (((l*h)*0)+((444-1)*h+234))]))/4));
IP_pi1(164:246,359:447,2) = pi1(164:246,359:447,2)*(0.90/(sum(pi1([(((l*h)*1)+((444-1)*h+206)) (((l*h)*1)+((357-1)*h+180)) (((l*h)*1)+((358-1)*h+234)) (((l*h)*1)+((444-1)*h+234))]))/4));
IP_pi1(164:246,359:447,3) = pi1(164:246,359:447,3)*(0.90/(sum(pi1([(((l*h)*2)+((444-1)*h+206)) (((l*h)*2)+((357-1)*h+180)) (((l*h)*2)+((358-1)*h+234)) (((l*h)*2)+((444-1)*h+234))]))/4));

IP_pi1(246:328,359:447,1) = pi1(246:328,359:447,1)*(0.90/(sum(pi1([(((l*h)*0)+((445-1)*h+282)) (((l*h)*0)+((446-1)*h+254)) (((l*h)*0)+((358-1)*h+256)) (((l*h)*0)+((358-1)*h+295))]))/4));
IP_pi1(246:328,359:447,2) = pi1(246:328,359:447,2)*(0.90/(sum(pi1([(((l*h)*1)+((445-1)*h+282)) (((l*h)*1)+((446-1)*h+254)) (((l*h)*1)+((358-1)*h+256)) (((l*h)*1)+((358-1)*h+295))]))/4));
IP_pi1(246:328,359:447,3) = pi1(246:328,359:447,3)*(0.90/(sum(pi1([(((l*h)*2)+((445-1)*h+282)) (((l*h)*2)+((446-1)*h+254)) (((l*h)*2)+((358-1)*h+256)) (((l*h)*2)+((358-1)*h+295))]))/4));

IP_pi1(328:h,359:447,1) = pi1(328:h,359:447,1)*(0.90/(sum(pi1([(((l*h)*0)+((442-1)*h+332)) (((l*h)*0)+((442-1)*h+406)) (((l*h)*0)+((382-1)*h+407)) (((l*h)*0)+((362-1)*h+353))]))/4));
IP_pi1(328:h,359:447,2) = pi1(328:h,359:447,2)*(0.90/(sum(pi1([(((l*h)*1)+((442-1)*h+332)) (((l*h)*1)+((442-1)*h+406)) (((l*h)*1)+((382-1)*h+407)) (((l*h)*1)+((362-1)*h+353))]))/4));
IP_pi1(328:h,359:447,3) = pi1(328:h,359:447,3)*(0.90/(sum(pi1([(((l*h)*2)+((442-1)*h+332)) (((l*h)*2)+((442-1)*h+406)) (((l*h)*2)+((382-1)*h+407)) (((l*h)*2)+((362-1)*h+353))]))/4));

IP_pi1(1:82,271:359,1) = pi1(1:82,271:359,1)*(0.90/(sum(pi1([(((l*h)*0)+((281-1)*h+19)) (((l*h)*0)+((341-1)*h+18)) (((l*h)*0)+((276-1)*h+93)) (((l*h)*0)+((341-1)*h+20))]))/4));
IP_pi1(1:82,271:359,2) = pi1(1:82,271:359,2)*(0.90/(sum(pi1([(((l*h)*1)+((281-1)*h+19)) (((l*h)*1)+((341-1)*h+18)) (((l*h)*1)+((276-1)*h+93)) (((l*h)*1)+((341-1)*h+20))]))/4));
IP_pi1(1:82,271:359,3) = pi1(1:82,271:359,3)*(0.90/(sum(pi1([(((l*h)*2)+((281-1)*h+19)) (((l*h)*2)+((341-1)*h+18)) (((l*h)*2)+((276-1)*h+93)) (((l*h)*2)+((341-1)*h+20))]))/4));

IP_pi1(82:164,271:359,1) = pi1(82:164,271:359,1)*(0.90/(sum(pi1([(((l*h)*0)+((276-1)*h+126)) (((l*h)*0)+((276-1)*h+141)) (((l*h)*0)+((355-1)*h+110)) (((l*h)*0)+((355-1)*h+150))]))/4));
IP_pi1(82:164,271:359,2) = pi1(82:164,271:359,2)*(0.90/(sum(pi1([(((l*h)*1)+((276-1)*h+126)) (((l*h)*1)+((276-1)*h+141)) (((l*h)*1)+((355-1)*h+110)) (((l*h)*1)+((355-1)*h+150))]))/4));
IP_pi1(82:164,271:359,3) = pi1(82:164,271:359,3)*(0.90/(sum(pi1([(((l*h)*2)+((276-1)*h+126)) (((l*h)*2)+((276-1)*h+141)) (((l*h)*2)+((355-1)*h+110)) (((l*h)*2)+((355-1)*h+150))]))/4));

IP_pi1(164:246,271:359,1) = pi1(164:246,271:359,1)*(0.90/(sum(pi1([(((l*h)*0)+((274-1)*h+176)) (((l*h)*0)+((275-1)*h+223)) (((l*h)*0)+((354-1)*h+172)) (((l*h)*0)+((354-1)*h+228))]))/4));
IP_pi1(164:246,271:359,2) = pi1(164:246,271:359,2)*(0.90/(sum(pi1([(((l*h)*1)+((274-1)*h+176)) (((l*h)*1)+((275-1)*h+223)) (((l*h)*1)+((354-1)*h+172)) (((l*h)*1)+((354-1)*h+228))]))/4));
IP_pi1(164:246,271:359,3) = pi1(164:246,271:359,3)*(0.90/(sum(pi1([(((l*h)*2)+((274-1)*h+176)) (((l*h)*2)+((275-1)*h+223)) (((l*h)*2)+((354-1)*h+172)) (((l*h)*2)+((354-1)*h+228))]))/4));

IP_pi1(246:328,271:359,1) = pi1(246:328,271:359,1)*(0.90/(sum(pi1([(((l*h)*0)+((275-1)*h+266)) (((l*h)*0)+((275-1)*h+288)) (((l*h)*0)+((354-1)*h+256)) (((l*h)*0)+((354-1)*h+288))]))/4));
IP_pi1(246:328,271:359,2) = pi1(246:328,271:359,2)*(0.90/(sum(pi1([(((l*h)*1)+((275-1)*h+266)) (((l*h)*1)+((275-1)*h+288)) (((l*h)*1)+((354-1)*h+256)) (((l*h)*1)+((354-1)*h+288))]))/4));
IP_pi1(246:328,271:359,3) = pi1(246:328,271:359,3)*(0.90/(sum(pi1([(((l*h)*2)+((275-1)*h+266)) (((l*h)*2)+((275-1)*h+288)) (((l*h)*2)+((354-1)*h+256)) (((l*h)*2)+((354-1)*h+288))]))/4));

IP_pi1(328:h,271:359,1) = pi1(328:h,271:359,1)*(0.90/(sum(pi1([(((l*h)*0)+((274-1)*h+335)) (((l*h)*0)+((277-1)*h+407)) (((l*h)*0)+((354-1)*h+343)) (((l*h)*0)+((352-1)*h+408))]))/4));
IP_pi1(328:h,271:359,2) = pi1(328:h,271:359,2)*(0.90/(sum(pi1([(((l*h)*1)+((274-1)*h+335)) (((l*h)*1)+((277-1)*h+407)) (((l*h)*1)+((354-1)*h+343)) (((l*h)*1)+((352-1)*h+408))]))/4));
IP_pi1(328:h,271:359,3) = pi1(328:h,271:359,3)*(0.90/(sum(pi1([(((l*h)*2)+((274-1)*h+335)) (((l*h)*2)+((277-1)*h+407)) (((l*h)*2)+((354-1)*h+343)) (((l*h)*2)+((352-1)*h+408))]))/4));



IP_pi1(194:298,1:271,1) = pi1(194:298,1:271,1)*(0.90/(sum(pi1([(((l*h)*0)+((119-1)*h+264)) (((l*h)*0)+((115-1)*h+288)) (((l*h)*0)+((212-1)*h+208)) (((l*h)*0)+((266-1)*h+233)) (((l*h)*0)+((264-1)*h+294))]))/5));
IP_pi1(194:298,1:271,2) = pi1(194:298,1:271,2)*(0.90/(sum(pi1([(((l*h)*1)+((119-1)*h+264)) (((l*h)*1)+((115-1)*h+288)) (((l*h)*1)+((212-1)*h+208)) (((l*h)*1)+((266-1)*h+233)) (((l*h)*1)+((264-1)*h+294))]))/5));
IP_pi1(194:298,1:271,3) = pi1(194:298,1:271,3)*(0.90/(sum(pi1([(((l*h)*2)+((119-1)*h+264)) (((l*h)*2)+((115-1)*h+288)) (((l*h)*2)+((212-1)*h+208)) (((l*h)*2)+((266-1)*h+233)) (((l*h)*2)+((264-1)*h+294))]))/5));

IP_pi1(298:h,1:116,1) = pi1(298:h,1:116,1)*(0.90/(sum(pi1([(((l*h)*0)+((9-1)*h+405)) (((l*h)*0)+((14-1)*h+331)) (((l*h)*0)+((105-1)*h+407)) (((l*h)*0)+((110-1)*h+407))]))/4));
IP_pi1(298:h,1:116,2) = pi1(298:h,1:116,2)*(0.90/(sum(pi1([(((l*h)*1)+((9-1)*h+405)) (((l*h)*1)+((14-1)*h+331)) (((l*h)*1)+((105-1)*h+407)) (((l*h)*1)+((110-1)*h+407))]))/4));
IP_pi1(298:h,1:116,3) = pi1(298:h,1:116,3)*(0.90/(sum(pi1([(((l*h)*2)+((9-1)*h+405)) (((l*h)*2)+((14-1)*h+331)) (((l*h)*2)+((105-1)*h+407)) (((l*h)*2)+((110-1)*h+407))]))/4));

IP_pi1(298:h,116:271,1) = pi1(298:h,116:271,1)*(0.90/(sum(pi1([(((l*h)*0)+((118-1)*h+350)) (((l*h)*0)+((260-1)*h+374)) (((l*h)*0)+((260-1)*h+307)) (((l*h)*0)+((194-1)*h+407))]))/4));
IP_pi1(298:h,116:271,2) = pi1(298:h,116:271,2)*(0.90/(sum(pi1([(((l*h)*1)+((118-1)*h+350)) (((l*h)*1)+((260-1)*h+374)) (((l*h)*1)+((260-1)*h+307)) (((l*h)*1)+((194-1)*h+407))]))/4));
IP_pi1(298:h,116:271,3) = pi1(298:h,116:271,3)*(0.90/(sum(pi1([(((l*h)*2)+((118-1)*h+350)) (((l*h)*2)+((260-1)*h+374)) (((l*h)*2)+((260-1)*h+307)) (((l*h)*2)+((194-1)*h+407))]))/4));
p_image=IP_pi1;
%--------------------------------------------------------------------

function Check()
clear answer;
clear student;
clear student_point;
clear prow;
global vid;
global p_image;
%close all;
tic
% ====================== Input Picture =================
p_image = getsnapshot(vid);
%imwrite(p_image,'er04.jpg'); 
%p_image=imread('er02.jpg');
stoppreview(vid);

%stoppreview(vid, hImage);
%p_image = imread('Picture 1.jpg');
% ============== Convert Color to Bina ==================
thres = graythresh(p_image);

p_image = white_image(p_image); %call white_image

thres_2 = graythresh(p_image);

autothresh1=0.09;
rowrunup =393;
count = 0;
count_check = 0;
count_check2 = 0;
count_check3 = 0;
S_error = 0;
C_error = 0;
%=================== Check Barcode ===================== 
while(true)
    if S_error == 20
        break;
    end
    %thres = thres+0.19;
    %pbina = im2bw(p_image,thres-autothresh1);
    pbina = im2bw(p_image,((thres+thres_2)/2)-autothresh1);
    %figure,imshow(pbina);
    % ====================== find markpoint==================
    while(true)
        if rowrunup < 383
            S_error = S_error+1;
            rowrunup =393;
            break;
        end
        m_bar_0=find( pbina(rowrunup,1:end)== 0 );
        m_bar_1=(find( pbina(rowrunup,1:end)== 1 )-1);
        m_bar = intersect(m_bar_0,m_bar_1);
        markpoint = m_bar(find(m_bar>12 & m_bar<610));
        count=size(markpoint,2);
        if count < 48
                             %disp('Barcode ไม่ถึง 48 ขีด เกิดความผิดพลาด');
            rowrunup = rowrunup-1;
            count = 0;
        else 
            rowrunup =393;
            break;
        end
    end
    if count ~= 48
                     %disp('Barcode เกิน 48 ขีด เกิดความผิดพลาด');
        if C_error == 4
            %autothersh1=0.08;
            %pbina = imrotate(pbina,180,'bilinear');
        elseif C_error > 20
            S_error = 20;
            break;
        end
        autothresh1=autothresh1-0.01;
        count = 0;
        C_error = C_error+1;
    else
        break;
    end       
end
try
if S_error == 0
    
    while(true)
        % ====================== Filter ==========================   
        t = 1;
    
        answers = 0;
        tmp_rowup = [];
        tmp_rowdown = [];
        %pbina = im2bw(p_image,thres-autothresh1);
        pbina = im2bw(p_image,thres+0.05);
        pbina_label = bwlabel(~pbina);
        Areachoice = regionprops(pbina_label,'Area','Centroid');
        idx = find([Areachoice.Area] > 5 & [Areachoice.Area]<110);
        pbina = ismember(pbina_label,idx);
        pbina = ~pbina;
        %     figure:imshow(pbina);
        % ========================= crop Coloum ====================   
        pcolumn1 = imcrop(pbina,[markpoint(22+(0*7)) 24 markpoint(27+(0*7))-markpoint(22+(0*7)) 352]);
        pcolumn2 = imcrop(pbina,[markpoint(22+(1*7)) 24 markpoint(27+(1*7))-markpoint(22+(1*7)) 352]);
        pcolumn3 = imcrop(pbina,[markpoint(22+(2*7)) 24 markpoint(27+(2*7))-markpoint(22+(2*7)) 352]);
        pcolumn4 = imcrop(pbina,[markpoint(22+(3*7)) 24 markpoint(27+(3*7))-markpoint(22+(3*7)) 352]);
        %         figure:imshow(pcolumn1);
        %         figure:imshow(pcolumn2);
        %         figure:imshow(pcolumn3);
        %     figure:imshow(pcolumn4);           
        % =========================== Position choice =================
        for j=0:3   
            rowup = 0;
            rowdown = 0;
            choice1(j+1)=markpoint(23+j*7)-markpoint(22+j*7)+5;                
            choice2(j+1)=markpoint(24+j*7)-markpoint(22+j*7)+5;
            choice3(j+1)=markpoint(25+j*7)-markpoint(22+j*7)+5;
            choice4(j+1)=markpoint(26+j*7)-markpoint(22+j*7)+5;        
            % =========================== Check จำนวนข้อ ====================
            if j==0 ptranspost = pcolumn1'; pcolumn = pcolumn1;
            elseif j==1 ptranspost = pcolumn2'; pcolumn = pcolumn2;
            elseif j==2 ptranspost = pcolumn3'; pcolumn = pcolumn3;
            elseif j==3 ptranspost = pcolumn4'; pcolumn = pcolumn4;
            end
            [check_circle_num,num3] = bwlabel(sum(~ptranspost));
            %         figure:imshow(~check_circle_num);
            if num3 ~= 28 && j <3 && count_check2 < 4 && count_check3==0
                %             disp(' check 28 ');
                autothresh1 = autothresh1+0.015;
                count_check2 =count_check2+1;
                break;        
            elseif num3~=16 && j==3 && count_check3<3
                %             disp(' check 16 ');
                autothresh1 = autothresh1+0.01;
                count_check3 =count_check3+1;
                break;       
            end
            size_pcolumn = size(ptranspost);
        
            sum_ptranspost = sum(~ptranspost);
            count2=0;
            for i=2:size_pcolumn(2)
                if sum_ptranspost(i-1)==0 & sum_ptranspost(i)>0
                    count2=count2+1;
                    rowup(count2)=i-1;%??????????????????????????????????????????
                end
                if sum_ptranspost(i-1)>0 & sum_ptranspost(i)==0       
                    rowdown(count2)=i;
                end 
            
                if count2 > 1 & rowup(count2)-rowup(count2-1)>60
                    tmp1 = rowup(count2);               
                    for v=1:4
                        rowup(count2) = rowup(count2-1)+(rowup(count2-2)-rowup(count2-3));            
                        count2 = count2+1;
                        rowdown(count2-2) = rowdown(count2-3)+(rowdown(count2-3)-rowdown(count2-4));
                    end
                    rowup(count2)=tmp1;
                    rowdown(count2-1) = rowup(count2)-3;        
                elseif count2 > 1 & rowup(count2)-rowup(count2-1)>48
                    tmp1 = rowup(count2); 
                    for v=1:3
                        rowup(count2) = rowup(count2-1)+(rowup(count2-2)-rowup(count2-3));
                        count2 = count2+1;
                        rowdown(count2-2) = rowdown(count2-3)+(rowdown(count2-3)-rowdown(count2-4));
                    end
                    rowup(count2)=tmp1;
                    rowdown(count2-1) = rowup(count2)-3;
                
                elseif count2 > 1 & rowup(count2)-rowup(count2-1)>35
                    tmp1 = rowup(count2);  
                    if count2 < 4
                        break;
                    else
                        for v=1:2
                            rowup(count2) = rowup(count2-1)+(rowup(count2-2)-rowup(count2-3));
                            count2 = count2+1;
                            rowdown(count2-2) = rowdown(count2-3)+(rowdown(count2-3)-rowdown(count2-4));
                        end
                        rowup(count2)=tmp1;
                        rowdown(count2-1) = rowup(count2)-3;        
                    end    
                elseif count2 > 1 & rowup(count2)-rowup(count2-1)>20
                    tmp1 = rowup(count2);
                    rowup(count2) = rowdown(count2-1)+3;        
                    count2=count2+1;
                    rowup(count2)=tmp1;        
                    rowdown(count2-1) = rowup(count2)-3;
                end
            end
            %         count3 = 1;
            %         for i = 1:num3
            %             if i~=num3
            %                 if i==8 
            %                     disp(' ');
            %                 end
            %                 if rowup(1)>12
            %                     tmp_rowup(count3)=5;
            %                     tmp_rowdown(count3)=15;
            %                     
            %                 elseif (rowup(i+1)-rowup(i))>17
            %                     tmp_rowup(count3) = rowup(i)+13;
            %                     tmp_rowdown(count3) = rowdown(i)+13;
            %                     count3 = count3+1;
            %                 end
            %             end
            %         end
            %         rowup = [rowup tmp_rowup];
            %         rowdown = [rowdown tmp_rowdown];
            %         rowup = sort(rowup);
            %         rowdown = sort(rowdown);       
            if length(rowup) == 16 || length(rowup) == 28 || count_check3==4 || count_check2==4
                if j==3 
                    count2=16;
                elseif j==1
                    rowup_tmp = rowup;
                    count2=28;
                else  
                    count2=28;
                end
                for i=2:count2+1
                    prow=imcrop(pcolumn,[1 rowup(i-1) size_pcolumn(1) (rowdown(i-1)-rowup(i-1))]);
                    %                                                 figure:imshow(prow);
                    sum_row = sum(~prow);        
                    [checkrow,num_circle]=bwlabel(sum_row );        
                    cnt1=0;cnt2=0;cnt3=0;cnt4=0;
                    if num_circle>0
                        for ii = 1:num_circle                     
                            zzz = find(checkrow==ii);    
                            if choice1(j+1)>zzz(1) answers(t)=1; cnt1 = 1; 
                            elseif choice2(j+1)>zzz(1) answers(t)=2; cnt2 = 1;
                            elseif choice3(j+1)>zzz(1) answers(t)=3; cnt3 = 1;
                            elseif choice4(j+1)>zzz(1) answers(t)=4; cnt4 = 1; 
                            %                         else answers(t)=0;
                            end
                        end
                    else
                        answers(t)=0;
                    end
                    if (cnt1+cnt2+cnt3+cnt4)>1
                        answers(t)=0;
                        %                     disp('มีข้อที่คะแนน 0 อยู่');                   
                    end
                    t=t+1;
                end          
            end         
        end 
        if count_check3 == 4
            break;
        end
        if count_check3 == 3 
            count_check3 = count_check3+1;
        end
    
        if t-1 ~= 100    
            %         disp('จำนวนข้อเกิน 100 ข้อ เกิดการผิดพลาด');
            autothresh1 = autothresh1+0.01;            
        else
            break;
        end
    end

    % ==========================check code ==============================
    autothresh2 = .15;
    rowup = rowup_tmp; 
    while(true)
        %     code_start = find(arrangecode == 17);
        code_start = rowup(17)+24;
        code_zero = rowup(18)+24;
        code_one = rowup(19)+24;
        code_two = rowup(20)+24;
        code_three = rowup(21)+24;
        code_four = rowup(22)+24;
        code_five = rowup(23)+24;
        code_six = rowup(24)+24;
        code_seven = rowup(25)+24;
        code_eight = rowup(26)+24;
        code_nine = rowup(27)+24;
        code_end = rowup(28)+24;
    
        %pbina = im2bw(p_image,thres-autothresh2);
        pbina = im2bw(p_image,thres);
        %     figure:imshow(pbina);
        pbina = bwlabel(~pbina);
        pbina_filter = regionprops(pbina,'Area');
        idx = find([pbina_filter.Area] > 20 & [pbina_filter.Area] < 100);
        pbina2 = ismember(pbina,idx);
        pbina2 = ~pbina2;
        %     figure:imshow(pbina2);     
        pcode = imcrop(pbina2,[markpoint(9) code_start(1) markpoint(20)-markpoint(9) code_end(1)-code_start(1)]);
        [pcode_label,num] = bwlabel(~pcode);
        %         figure:imshow(~pcode_label);
        student_point = regionprops(pcode_label,'Centroid');
        code_zero=code_zero-code_start;
        code_one =code_one-code_start;
        code_two=code_two-code_start;
        code_three=code_three-code_start;
        code_four=code_four-code_start;
        code_five=code_five-code_start;
        code_six=code_six-code_start;
        code_seven=code_seven-code_start;
        code_eight=code_eight-code_start;
        code_nine=code_nine-code_start;
        if num == 8 
            for k = 1:num
                student_num = student_point(k).Centroid;
                round_num = round(student_num(2));
                if round_num>code_nine student(k)=9; 
                elseif round_num>code_eight student(k)=8;
                elseif round_num>code_seven student(k)=7;
                elseif round_num>code_six student(k)=6;
                elseif round_num>code_five student(k)=5;
                elseif round_num>code_four student(k)=4;
                elseif round_num>code_three student(k)=3;
                elseif round_num>code_two student(k)=2;
                elseif round_num>code_one student(k)=1;
                elseif round_num>code_zero student(k)=0;                 
                end
            end
            disp('Finish');
            break;
        elseif num>8
            msgbox('มีความผิดพลาดรหัสนักศึกษาเกิน','error รหัสนักศึกษา','none');
            break;
        else
            %         disp('หารหัสนักศึกษาไม่ได้ เกิดความผิดพลาด');
            autothresh2 = autothresh2-.02;
        end
    end
    % ============================= check answer ==========================
    disp('แสดงเวลาที่ใช้');
    clocks = toc
    disp('แสดงรหัสนักศึกษา');
    student
    % disp('แสดงจำนวนข้อทั้งหมดที่ทำ'); t=t-1
    disp('แสดงข้อที่ได้ 0 ');
    z = find(answers == 0)
    % disp('แสดงคำตอบทั้งหมด'); answers


    % checkans(answers);
    %------------------------ ตรวจคำตอบ --------------------------
    student_point = checkans(answers);
    %---------------------- แสดงผลของการตรวจ -----------------------
    % student = [4 5 0 1 5 3 6 4];
    % student_point = 45; 
    students = '';
    for i = 1 : 8
        students(i) = int2str(student(i));
    end
    p_std = students;
    p_ans = student_point; 
    p_txans = int2str(p_ans);
    shmsg = strcat('รหัส :',p_std,' คะแนนที่ได้ :',p_txans,' คะแนน');
    msgbox(shmsg,'ผลการตรวจ','none');

    %------------------------ ตรวจสอบว่ามีข้อมมูลยัง ----------------------
    conn = database('store','','');
    curs = exec(conn,'select * from point');
    curs = fetch(curs);
    datachk = curs.data;
    rowschk = rows(curs);
    close(conn);
    have_id = '';
    for i = 1:rowschk
        cc = datachk(i,1);
        if p_std ==  num2str(cc{1}); % ตรวจสอบว่ามีข้อมูลที่ฐานข้อมมูลหรือไม่  if p_std == char(datachk(i,1))
            have_id = 1;
            break;
        end
    end
    if have_id == 1
        %msgbox('เคยตรวจไปแล้ว...','ตรวจสอบว่ามีการตรวจยัง','none');
        %UPDATE `point` SET `points` = '71' WHERE `point`.`std_id`=45015389
        si = '''';
        sqlstate=strcat('UPDATE `point` SET `points` = ',si,p_txans,si,' WHERE `point`.`std_id`=',p_std);
        conn = database('store','','');
        curs = exec(conn,sqlstate);
        curs = fetch(curs);
        close(conn);
    else
        % --------------------- เก็บรหัสกับคะแนนลงฐานข้อมูล -------------------
        si = '''';
        cm = ',';
        fi = ')';
        is = 'insert into point values ('
        sqlstate = strcat(is,si,p_std,si,cm,si,p_txans,si,fi);
        conn = database('store','','');
        curs = exec(conn,sqlstate);
        curs = fetch(curs);
        close(conn);
        close;   
        msgbox('บันทึกข้อมูลงฐานข้อมูลเรียบร้อย','จัดเก็บข้อมูล','none');
    end
else
    %imwrite(p_image,'error Barcode.jpg');
    msgbox('กระดาษไม่พร้อมที่จะตรวจ','ERROR Check Barcode','none');
end
catch
    %imwrite(p_image,'error Check.jpg');
    msgbox('เกิดข้อผิดผลาดระหว่างการตรวจ','เกิดข้อผิดผลาด','none');
    %close;
end
%--------------------------------------------------------------------


% --- Executes on button press in CheckButton.
function CheckButton_Callback(hObject, eventdata, handles)
% hObject    handle to CheckButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid;

Check();
preview(vid);

%global vid;
%closepreview
%vid = videoinput('winvideo', 1, 'RGB24_640x480');
%vid_src = getselectedsource(vid);
%vid_src.ZoomMode = 'manual';
%vidRes = get(vid, 'VideoResolution');
%nBands = get(vid, 'NumberOfBands');
%hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
%preview(vid, hImage);

%x = input('YOU EXIT PASS Q :','s');
%vid.FramesPerTrigger = 300;
%wait(vid,1);

%h = waitbar(0,'Please wait...');
%for i=1:100, % computation here %
%waitbar(i/100)
%end
%close(h) ;

%frame = getsnapshot(vid);
%frame = getframe(newvid);
%frame=rgb2gray(frame(:,:,:));
%pro = frame;
%figure , imshow(pro);
%closepreview(newvid)
%prog(frame);
% fig2 = imread('untitled.jpg');
% figure , imshow(frame);

% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ShowPoint;

% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m_showdata;

% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;


% --- Executes on button press in AddButton.
function AddButton_Callback(hObject, eventdata, handles)
% hObject    handle to AddButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
add_d

% --- Executes on button press in UpdateBotton.
function UpdateBotton_Callback(hObject, eventdata, handles)
% hObject    handle to UpdateBotton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
update_d

% --- Executes on button press in DeleteButton.
function DeleteButton_Callback(hObject, eventdata, handles)
% hObject    handle to DeleteButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
del_d


% --------------------------------------------------------------------
function M_menu_Callback(hObject, eventdata, handles)
% hObject    handle to M_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function M_about_Callback(hObject, eventdata, handles)
% hObject    handle to M_about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
About();

% --------------------------------------------------------------------
function M_Check_Callback(hObject, eventdata, handles)
% hObject    handle to M_Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid;

Check();
preview(vid);

% --------------------------------------------------------------------
function M_showpoint_Callback(hObject, eventdata, handles)
% hObject    handle to M_showpoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ShowPoint;

% --------------------------------------------------------------------
function M_exit_Callback(hObject, eventdata, handles)
% hObject    handle to M_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


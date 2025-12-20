function varargout = update_d(varargin)
% UPDATE_D M-file for update_d.fig
%      UPDATE_D, by itself, creates a new UPDATE_D or raises the existing
%      singleton*.
%
%      H = UPDATE_D returns the handle to a new UPDATE_D or the handle to
%      the existing singleton*.
%
%      UPDATE_D('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UPDATE_D.M with the given input arguments.
%
%      UPDATE_D('Property','Value',...) creates a new UPDATE_D or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before update_d_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to update_d_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help update_d

% Last Modified by GUIDE v2.5 07-Nov-2006 22:42:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @update_d_OpeningFcn, ...
                   'gui_OutputFcn',  @update_d_OutputFcn, ...
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


% --- Executes just before update_d is made visible.
function update_d_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to update_d (see VARARGIN)

% Choose default command line output for update_d
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes update_d wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = update_d_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
varargout{1} = handles.output;
conn = database('store','','');
curs = exec(conn,'select * from question');
curs = fetch(curs);
datatest = curs.data;
numrows = rows(curs);
set(handles.all_qt,'string',numrows);
close(conn);
% Get default command line output from handles structure
varargout{1} = handles.output;



function ed_id_Callback(hObject, eventdata, handles)
% hObject    handle to ed_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_id as text
%        str2double(get(hObject,'String')) returns contents of ed_id as a double


% --- Executes during object creation, after setting all properties.
function ed_id_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_ans_Callback(hObject, eventdata, handles)
% hObject    handle to ed_ans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_ans as text
%        str2double(get(hObject,'String')) returns contents of ed_ans as a double


% --- Executes during object creation, after setting all properties.
function ed_ans_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_ans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_ch4_Callback(hObject, eventdata, handles)
% hObject    handle to ed_ch4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_ch4 as text
%        str2double(get(hObject,'String')) returns contents of ed_ch4 as a double


% --- Executes during object creation, after setting all properties.
function ed_ch4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_ch4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_ch3_Callback(hObject, eventdata, handles)
% hObject    handle to ed_ch3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_ch3 as text
%        str2double(get(hObject,'String')) returns contents of ed_ch3 as a double


% --- Executes during object creation, after setting all properties.
function ed_ch3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_ch3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_ch2_Callback(hObject, eventdata, handles)
% hObject    handle to ed_ch2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_ch2 as text
%        str2double(get(hObject,'String')) returns contents of ed_ch2 as a double


% --- Executes during object creation, after setting all properties.
function ed_ch2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_ch2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_ch1_Callback(hObject, eventdata, handles)
% hObject    handle to ed_ch1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_ch1 as text
%        str2double(get(hObject,'String')) returns contents of ed_ch1 as a double


% --- Executes during object creation, after setting all properties.
function ed_ch1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_ch1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_qt_Callback(hObject, eventdata, handles)
% hObject    handle to ed_qt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_qt as text
%        str2double(get(hObject,'String')) returns contents of ed_qt as a double


% --- Executes during object creation, after setting all properties.
function ed_qt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_qt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CancelButton.
function CancelButton_Callback(hObject, eventdata, handles)
% hObject    handle to CancelButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;

% --- Executes on button press in FindButton.
function FindButton_Callback(hObject, eventdata, handles)
% hObject    handle to FindButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
update_id = get(handles.ed_id,'string');
si = '''';
find = char(update_id);
is = 'select * from question where id = ';
sqlfind = strcat(is,si,find,si);
conn = database('store','','');
curs = exec(conn,sqlfind);
% curs = exec(conn,'select * from question where id =''2''');
curs = fetch(curs);
col = columnnames(curs);
qt = curs.Data(:,2);
ch1 = curs.Data(:,3);
ch2 = curs.Data(:,4);
ch3 = curs.Data(:,5);
ch4 = curs.Data(:,6);
ans = curs.Data(:,7);

% set(handles.ed_id,'string','');
set(handles.ed_qt,'string',qt);
set(handles.ed_ch1,'string',ch1);
set(handles.ed_ch2,'string',ch2);
set(handles.ed_ch3,'string',ch3);
set(handles.ed_ch4,'string',ch4);
set(handles.ed_ans,'string',ans);
close(conn);

% --- Executes on button press in AddButton.
function AddButton_Callback(hObject, eventdata, handles)
% hObject    handle to AddButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
update_id = get(handles.ed_id,'String');
update_qt = get(handles.ed_qt,'String');
update_ch1 = get(handles.ed_ch1,'String');
update_ch2 = get(handles.ed_ch2,'String');
update_ch3 = get(handles.ed_ch3,'String');
update_ch4 = get(handles.ed_ch4,'String');
update_ans = get(handles.ed_ans,'String');
bank = get(handles.bank_char,'String');
if strcmp(char(update_qt),bank) == 1 || strcmp(char(update_ch1),bank) == 1 || strcmp(char(update_ch2),bank) == 1 || strcmp(char(update_ch3),bank) == 1 || strcmp(char(update_ch4),bank) == 1 || strcmp(char(update_qt),'') == 1 || strcmp(char(update_ch1),'') == 1 || strcmp(char(update_ch2),'') == 1 || strcmp(char(update_ch3),'') == 1 || strcmp(char(update_ch4),'') == 1
    msgbox('กรอกข้อมูลคำถาม-คำตอบให้ครบกรุณาตรวจสอบอีกที','กรุณากรอก','none');
elseif strcmp(char(update_ans),bank) == 1
    msgbox('กรอกข้อมูลเฉลยด้วยกรุณาตรวจสอบอีกที','กรุณากรอก','none');      
elseif strcmp(update_ans,'1') == 1 || strcmp(update_ans,'2') == 1 || strcmp(update_ans,'3') == 1 || strcmp(update_ans,'4') == 1
    % Cascade String SQL 
    si = '''';
    is = 'update question set quest = ';
    edch1 = ', choice1 = '
    edch2 = ', choice2 = '
    edch3 = ', choice3 = '
    edch4 = ', choice4 = '
    edans = ', answer = '
    condi = ' where id = '
    sqlstate = strcat(is,si,update_qt,si,edch1,si,update_ch1,si,edch2,si,update_ch2,si,edch3,si,update_ch3,si,edch4,si,update_ch4,si,edans,si,update_ans,si,condi,si,update_id,si);
    sqlstate = char(sqlstate);
    % Connect Database for Insert Data
    conn = database('store','','');
    curs = exec(conn,sqlstate);
    curs = fetch(curs);
    close(conn);
    close;
    %mainmenu;
    msgbox('ข้อมูลแก้ไขเรียบร้อย','สถานะ','none'); 
else           
    msgbox('ป้อนตัวเลข 1-4 เท่านั้น','กรุณากรอก','none');    
end


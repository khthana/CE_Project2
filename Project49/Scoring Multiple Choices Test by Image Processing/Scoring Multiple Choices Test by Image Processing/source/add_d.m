function varargout = add_d(varargin)
% ADD_D M-file for add_d.fig
%      ADD_D, by itself, creates a new ADD_D or raises the existing
%      singleton*.
%
%      H = ADD_D returns the handle to a new ADD_D or the handle to
%      the existing singleton*.
%
%      ADD_D('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADD_D.M with the given input arguments.
%
%      ADD_D('Property','Value',...) creates a new ADD_D or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before add_d_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to add_d_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help add_d

% Last Modified by GUIDE v2.5 07-Nov-2006 22:15:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @add_d_OpeningFcn, ...
                   'gui_OutputFcn',  @add_d_OutputFcn, ...
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


% --- Executes just before add_d is made visible.
function add_d_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to add_d (see VARARGIN)

% Choose default command line output for add_d
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes add_d wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = add_d_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
conn = database('store','','');
curs = exec(conn,'select * from question');
curs = fetch(curs);
datatest = curs.data;
numrows = rows(curs);
% set(handles.ed_id,'string',numrows+1);
set(handles.tx_id,'string',numrows+1);
close(conn);
% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in AddButton.
function AddButton_Callback(hObject, eventdata, handles)
% hObject    handle to AddButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
add_id = get(handles.tx_id,'String');
add_qt = get(handles.ed_qt,'String');
add_ch1 = get(handles.ed_ch1,'String');
add_ch2 = get(handles.ed_ch2,'String');
add_ch3 = get(handles.ed_ch3,'String');
add_ch4 = get(handles.ed_ch4,'String');
add_ans = get(handles.ed_ans,'String');
bank = get(handles.bank_char,'String');
if strcmp(add_qt,bank) == 1 || strcmp(add_ch1,bank) == 1 || strcmp(add_ch2,bank) == 1 || strcmp(add_ch3,bank) == 1 || strcmp(add_ch4,bank) == 1 || strcmp(add_qt,bank) == 1 || strcmp(add_ch1,'') == 1 || strcmp(add_ch2,'') == 1 || strcmp(add_ch3,'') == 1 || strcmp(add_ch4,'') == 1    
    msgbox('กรอกข้อมูลคำถาม-คำตอบให้ครบกรุณาตรวจสอบอีกที','กรุณากรอก','none');
elseif strcmp(add_ans,bank) == 1 || strcmp(add_ans,'') == 1
    msgbox('กรอกข้อมูลเฉลยด้วยกรุณาตรวจสอบอีกที','กรุณากรอก','none');    
elseif strcmp(add_ans,'1') == 1 || strcmp(add_ans,'2') == 1 || strcmp(add_ans,'3') == 1 || strcmp(add_ans,'4') == 1
    % Cascade String SQL 
    si = '''';
    cm = ',';
    fi = ')';
    is = 'insert into question values ('
    sqlstate = strcat(is,si,add_id,si,cm,si,add_qt,si,cm,si,add_ch1,si,cm,si,add_ch2,si,cm,si,add_ch3,si,cm,si,add_ch4,si,cm,si,add_ans,si,fi);
    % Connect Database for Insert Data
    sqlstate = char(sqlstate);
    conn = database('store','','');
    curs = exec(conn,sqlstate);
    curs = fetch(curs);
    close(conn);
    close;
    %mainmenu;
    msgbox('ข้อมูลจัดเก็บเรียบร้อย','สถานะ','none'); 
    
    %ต้องลบออก
%     conn = database('store','','');
%     curs = exec(conn,'select * from question');
%     curs = fetch(curs);
%     datatest = curs.data;
%     numrows = rows(curs);
%     set(handles.tx_id,'string',numrows+1);
%     close(conn);

    %---------------
else           
    msgbox('ป้อนตัวเลข 1-4 เท่านั้น','กรุณากรอก','none');
end

% --- Executes on button press in ClearButton.
function ClearButton_Callback(hObject, eventdata, handles)
% hObject    handle to ClearButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ed_qt,'string','');
set(handles.ed_ch1,'string','');
set(handles.ed_ch2,'string','');
set(handles.ed_ch3,'string','');
set(handles.ed_ch4,'string','');
set(handles.ed_ans,'string','');

% --- Executes on button press in CancelButton.
function CancelButton_Callback(hObject, eventdata, handles)
% hObject    handle to CancelButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;

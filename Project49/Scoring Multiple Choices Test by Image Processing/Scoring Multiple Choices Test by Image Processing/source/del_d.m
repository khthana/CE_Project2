function varargout = del_d(varargin)
% DEL_D M-file for del_d.fig
%      DEL_D, by itself, creates a new DEL_D or raises the existing
%      singleton*.
%
%      H = DEL_D returns the handle to a new DEL_D or the handle to
%      the existing singleton*.
%
%      DEL_D('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEL_D.M with the given input arguments.
%
%      DEL_D('Property','Value',...) creates a new DEL_D or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before del_d_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to del_d_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help del_d

% Last Modified by GUIDE v2.5 07-Nov-2006 23:05:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @del_d_OpeningFcn, ...
                   'gui_OutputFcn',  @del_d_OutputFcn, ...
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


% --- Executes just before del_d is made visible.
function del_d_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to del_d (see VARARGIN)
global numrows;
conn = database('store','','');
curs = exec(conn,'select * from question');
curs = fetch(curs);
datatest = curs.data;
numrows = rows(curs);
set(handles.all_qt,'string',numrows);
close(conn);
% Choose default command line output for del_d
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes del_d wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = del_d_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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



function tx_ans_Callback(hObject, eventdata, handles)
% hObject    handle to tx_ans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tx_ans as text
%        str2double(get(hObject,'String')) returns contents of tx_ans as a double


% --- Executes during object creation, after setting all properties.
function tx_ans_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tx_ans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tx_ch4_Callback(hObject, eventdata, handles)
% hObject    handle to tx_ch4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tx_ch4 as text
%        str2double(get(hObject,'String')) returns contents of tx_ch4 as a double


% --- Executes during object creation, after setting all properties.
function tx_ch4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tx_ch4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tx_ch3_Callback(hObject, eventdata, handles)
% hObject    handle to tx_ch3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tx_ch3 as text
%        str2double(get(hObject,'String')) returns contents of tx_ch3 as a double


% --- Executes during object creation, after setting all properties.
function tx_ch3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tx_ch3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tx_ch2_Callback(hObject, eventdata, handles)
% hObject    handle to tx_ch2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tx_ch2 as text
%        str2double(get(hObject,'String')) returns contents of tx_ch2 as a double


% --- Executes during object creation, after setting all properties.
function tx_ch2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tx_ch2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tx_ch1_Callback(hObject, eventdata, handles)
% hObject    handle to tx_ch1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tx_ch1 as text
%        str2double(get(hObject,'String')) returns contents of tx_ch1 as a double


% --- Executes during object creation, after setting all properties.
function tx_ch1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tx_ch1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tx_qt_Callback(hObject, eventdata, handles)
% hObject    handle to tx_qt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tx_qt as text
%        str2double(get(hObject,'String')) returns contents of tx_qt as a double


% --- Executes during object creation, after setting all properties.
function tx_qt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tx_qt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in DelateButton.
function DelateButton_Callback(hObject, eventdata, handles)
% hObject    handle to DelateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global numrows;
del_id = get(handles.ed_id,'String');
% Cascade String SQL 
%--------------dele------
si = '''';
find = char(del_id);
is = 'delete from question where id = '
sqlstate = strcat(is,si,find,si);
% Connect Database for Insert Data
conn = database('store','','');
curs = exec(conn,sqlstate);
curs = fetch(curs);
close;
%---------------------------------

%---------------UP DATE ------------------
for i=str2num(del_id):numrows
    %UPDATE `question` SET `id` = '2' WHERE `question`.`id` =3
    sqlstate =strcat('UPDATE `question` SET `id` = ',si, num2str(i),si,' WHERE `question`.`id` =',si, num2str(i+1),si);
    conn = database('store','','');
    curs = exec(conn,sqlstate);
    curs = fetch(curs);
    close;
end
%-----------------------------------------

%mainmenu;
msgbox('ข้อมูลถูกลบเรียบร้อย','สถานะ','none'); 

% --- Executes on button press in FindButton.
function FindButton_Callback(hObject, eventdata, handles)
% hObject    handle to FindButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
del_id = get(handles.ed_id,'string');
si = '''';
find = char(del_id);
is = 'select * from question where id = ';
sqlfind = strcat(is,si,find,si);
conn = database('store','','');
curs = exec(conn,sqlfind);
% curs = exec(conn,'select * from question where id =''2''');
curs = fetch(curs);
col = columnnames(curs);
numrows = rows(curs)
qt = curs.Data(:,2);
ch1 = curs.Data(:,3);
ch2 = curs.Data(:,4);
ch3 = curs.Data(:,5);
ch4 = curs.Data(:,6);
ans = curs.Data(:,7);

% set(handles.ed_id,'string','');
set(handles.tx_qt,'string',qt);
set(handles.tx_ch1,'string',ch1);
set(handles.tx_ch2,'string',ch2);
set(handles.tx_ch3,'string',ch3);
set(handles.tx_ch4,'string',ch4);
set(handles.tx_ans,'string',ans);
close(conn);


% --- Executes on button press in CancelButton.
function CancelButton_Callback(hObject, eventdata, handles)
% hObject    handle to CancelButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


function varargout = m_showdata(varargin)
% M_SHOWDATA M-file for m_showdata.fig
%      M_SHOWDATA, by itself, creates a new M_SHOWDATA or raises the existing
%      singleton*.
%
%      H = M_SHOWDATA returns the handle to a new M_SHOWDATA or the handle to
%      the existing singleton*.
%
%      M_SHOWDATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in M_SHOWDATA.M with the given input arguments.
%
%      M_SHOWDATA('Property','Value',...) creates a new M_SHOWDATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before m_showdata_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to m_showdata_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help m_showdata

% Last Modified by GUIDE v2.5 10-Feb-2007 15:14:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @m_showdata_OpeningFcn, ...
                   'gui_OutputFcn',  @m_showdata_OutputFcn, ...
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


% --- Executes just before m_showdata is made visible.
function m_showdata_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to m_showdata (see VARARGIN)

% Choose default command line output for m_showdata
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes m_showdata wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = m_showdata_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function showdata(datatest,numrows,numcols,count,chut)


bgcolor = 'black';
fgcolor = 'white';
m_name = strcat('แสดงผลคลังข้อสอบชุดที่ ',int2str(chut));
scrsz = get(0,'ScreenSize');
figure('Position',[5 65 scrsz(3)*4/5 scrsz(4)-105])
set(gcf, ...
    'NumberTitle','off', ...
    'Name',m_name, ...
    'backingstore','off',...
    'Units','normalized',...
    'Color',fgcolor);

% ch(1,1) = {'ก.'};ch(1,2) = {'ข.'};ch(1,3) = {'ค.'};ch(1,4) = {'ง.'};ch(1,5) = {'จ.'};
ch = {'ก.' 'ข.' 'ค.' 'ง.' 'จ.'};
%count = 0;
top = 0.95;
left = 0.05;
width = 0.6;
hight = 0.03;

topc2 = 0.95;
leftc2 = 0.53;

m = numrows;
n = numcols-1;
for i = 1:m         
    k = 0;
    if i <= 6
        count = count + 1;
%         datainfo1 = char(datatest(i,1));      
        uicontrol(...
            'Style','text',...
            'Units','normalized',...
            'Position',[left-0.03 top width hight],...
            'BackgroundColor',fgcolor,...
            'ForegroundColor','Black',...
            'HorizontalAlignment','left',...
            'FontSize',10.0,...
            'String',count);    
        for j = 2:n  
            datainfo = char(datatest(i,j));
            if j == 2
                uicontrol(...
                    'Style','text',...
                    'Units','normalized',...
                    'Position',[left top width hight],...
                    'BackgroundColor',fgcolor,...
                    'ForegroundColor','Black',...
                    'HorizontalAlignment','left',...
                    'FontSize',10.0,...
                    'String',datainfo);
            else
                uicontrol(...
                    'Style','text',...
                    'Units','normalized',...
                    'Position',[left+0.01 top width hight],...
                    'BackgroundColor',fgcolor,...
                    'ForegroundColor','Black',...
                    'HorizontalAlignment','left',...
                    'FontSize',10.0,...
                    'String',ch(1,k));
                uicontrol(...
                    'Style','text',...
                    'Units','normalized',...
                    'Position',[left+0.03 top width hight],...
                    'BackgroundColor',fgcolor,...
                    'ForegroundColor','Black',...
                    'HorizontalAlignment','left',...
                    'FontSize',10.0,...
                    'String',datainfo);
            end
            k = k + 1;          
            top = top - 0.03;
        end
        top = top - 0.01;
    else
%         datainfo1 = char(datatest(i,1));    
        count = count + 1;
        uicontrol(...
            'Style','text',...
            'Units','normalized',...
            'Position',[leftc2-0.03 topc2 width hight],...
            'BackgroundColor',fgcolor,...
            'ForegroundColor','Black',...
            'HorizontalAlignment','left',...
            'FontSize',10.0,...
            'String',count);    
        for j = 2:n  
            datainfo = char(datatest(i,j));
            if j == 2
                uicontrol(...
                    'Style','text',...
                    'Units','normalized',...
                    'Position',[leftc2 topc2 width hight],...
                    'BackgroundColor',fgcolor,...
                    'ForegroundColor','Black',...
                    'HorizontalAlignment','left',...
                    'FontSize',10.0,...
                    'String',datainfo);
            else
                uicontrol(...
                    'Style','text',...
                    'Units','normalized',...
                    'Position',[leftc2+0.01 topc2 width hight],...
                    'BackgroundColor',fgcolor,...
                    'ForegroundColor','Black',...
                    'HorizontalAlignment','left',...
                    'FontSize',10.0,...
                    'String',ch(1,k));
                uicontrol(...
                    'Style','text',...
                    'Units','normalized',...
                    'Position',[leftc2+0.03 topc2 width hight],...
                    'BackgroundColor',fgcolor,...
                    'ForegroundColor','Black',...
                    'HorizontalAlignment','left',...
                    'FontSize',10.0,...
                    'String',datainfo);
            end
            k = k + 1;
            topc2 = topc2 - 0.03;
        end
        topc2 = topc2 - 0.01;
    end   
end

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
if (get(hObject,'Value') == get(hObject,'Max'))
    % then checkbox is checked-take approriate action
    set(handles.edit1,'visible','on');
    set(handles.text1,'visible','on');
else
    % checkbox is not checked-take approriate action
    set(handles.edit1,'visible','off');
    set(handles.text1,'visible','off');
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

conn = database('store','','');
curs = exec(conn,'select * from question');
curs = fetch(curs);
datatest = curs.data;
numrows = rows(curs);
numcols = cols(curs);

num_c = str2num(get(handles.edit1,'String'));
if (num_c<1) ||(num_c>5)
    msgbox('ห้ามใส่เลขน้อยกว่า 1 และมากกว่า 5','เกิดข้อผิดผลาด','none');
else
    for inde=1:num_c
        if num_c>1
            datatest = sortrows(datatest,(inde+1));
        end

        count = 0;
        m=fix(numrows/12);
        for i=1:m
            data_c=datatest((1+(i-1)*12):(12+(i-1)*12),:);
            showdata(data_c,12,numcols,count,inde);
            count=count+12;
        end
        if m*12<numrows
            data_c=datatest((m*12+1):numrows,:);
            showdata(data_c,numrows-m*12,numcols,count,inde);
        end
    end
    close(m_showdata);
end

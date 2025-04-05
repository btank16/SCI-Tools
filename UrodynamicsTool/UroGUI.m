function varargout = UroGUI(varargin)
% UROGUI MATLAB code for UroGUI.fig
%      UROGUI, by itself, creates a new UROGUI or raises the existing
%      singleton*.
%
%      H = UROGUI returns the handle to a new UROGUI or the handle to
%      the existing singleton*.
%
%      UROGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UROGUI.M with the given input arguments.
%
%      UROGUI('Property','Value',...) creates a new UROGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UroGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UroGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UroGUI

% Last Modified by GUIDE v2.5 03-Sep-2021 16:48:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UroGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @UroGUI_OutputFcn, ...
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


% --- Executes just before UroGUI is made visible.
function UroGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UroGUI (see VARARGIN)

% Choose default command line output for UroGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UroGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UroGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[fileName,pathName] = uigetfile('*.txt');

file = fullfile(pathName,fileName);
data_file = importdata(file);

zero_marks = find(data_file(:,1)==0);
Baseline_count = size(zero_marks,1);
time_points = size(data_file,1);
time_int = data_file(4,1)-data_file(3,1);

r = zeros(1,Baseline_count);
for a=1:Baseline_count
    if a<Baseline_count
        r(1,a) = zero_marks(a+1,1)-zero_marks(a,1);
    else
        r(1,a) = time_points-zero_marks(a,1)+1;
    end
end


plot_sets = mat2cell(data_file,r);

setappdata(handles.pushbutton1,'bsln1',plot_sets{1,1})
setappdata(handles.pushbutton1,'bsln2',plot_sets{2,1})
setappdata(handles.pushbutton1,'bsln3',plot_sets{3,1})
setappdata(handles.pushbutton1,'bsln4',plot_sets{4,1})
setappdata(handles.pushbutton1,'bsln5',plot_sets{5,1})
setappdata(handles.pushbutton1,'bsln6',plot_sets{6,1})
setappdata(handles.pushbutton1,'bsln7',plot_sets{7,1})
setappdata(handles.pushbutton1,'bsln8',plot_sets{8,1})
setappdata(handles.pushbutton1,'bsln9',plot_sets{9,1})
setappdata(handles.pushbutton1,'bsln10',plot_sets{10,1})



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

% Determine the selected data set.
str = get(hObject, 'String');
val = get(hObject,'Value');
% Set current data to the selected data set.
switch str{val}
    case 'Set 1'
        uro_data = getappdata(handles.pushbutton1, 'bsln1');
        min_volt = min(uro_data(:,2));
        uro_size = size(uro_data,1);
        for x=1:uro_size
            uro_data(x,2) = uro_data(x,2)+abs(min_volt);
        end
        setappdata(handles.pushbutton1,'uro_data',uro_data);
        axes(handles.axes1);
        cla
        plot(uro_data(:,1),uro_data(:,2));
        
        axes(handles.axes2);
        cla
        plot(uro_data(:,1),uro_data(:,3));
    case 'Set 2'
        uro_data = getappdata(handles.pushbutton1, 'bsln2');
        min_volt = min(uro_data(:,2));
        uro_size = size(uro_data,1);
        for x=1:uro_size
            uro_data(x,2) = uro_data(x,2)+abs(min_volt);
        end
        setappdata(handles.pushbutton1,'uro_data',uro_data);
        axes(handles.axes1);
        cla
        plot(uro_data(:,1),uro_data(:,2));
        
        axes(handles.axes2);
        cla
        plot(uro_data(:,1),uro_data(:,3));
    case 'Set 3'
        uro_data = getappdata(handles.pushbutton1, 'bsln3');
        min_volt = min(uro_data(:,2));
        uro_size = size(uro_data,1);
        for x=1:uro_size
            uro_data(x,2) = uro_data(x,2)+abs(min_volt);
        end
        setappdata(handles.pushbutton1,'uro_data',uro_data);
        axes(handles.axes1);
        cla
        plot(uro_data(:,1),uro_data(:,2));
        
        axes(handles.axes2);
        cla
        plot(uro_data(:,1),uro_data(:,3));
    case 'Set 4'
        uro_data = getappdata(handles.pushbutton1, 'bsln4');
        min_volt = min(uro_data(:,2));
        uro_size = size(uro_data,1);
        for x=1:uro_size
            uro_data(x,2) = uro_data(x,2)+abs(min_volt);
        end
        setappdata(handles.pushbutton1,'uro_data',uro_data);
        axes(handles.axes1);
        cla
        plot(uro_data(:,1),uro_data(:,2));
        
        axes(handles.axes2);
        cla
        plot(uro_data(:,1),uro_data(:,3));
    case 'Set 5'
        uro_data = getappdata(handles.pushbutton1, 'bsln5');
        min_volt = min(uro_data(:,2));
        uro_size = size(uro_data,1);
        for x=1:uro_size
            uro_data(x,2) = uro_data(x,2)+abs(min_volt);
        end
        setappdata(handles.pushbutton1,'uro_data',uro_data);
        axes(handles.axes1);
        cla
        plot(uro_data(:,1),uro_data(:,2));
        
        axes(handles.axes2);
        cla
        plot(uro_data(:,1),uro_data(:,3));
    case 'Set 6'
        uro_data = getappdata(handles.pushbutton1, 'bsln6');
        min_volt = min(uro_data(:,2));
        uro_size = size(uro_data,1);
        for x=1:uro_size
            uro_data(x,2) = uro_data(x,2)+abs(min_volt);
        end
        setappdata(handles.pushbutton1,'uro_data',uro_data);
        axes(handles.axes1);
        cla
        plot(uro_data(:,1),uro_data(:,2));
        
        axes(handles.axes2);
        cla
        plot(uro_data(:,1),uro_data(:,3));
    case 'Set 7'
        uro_data = getappdata(handles.pushbutton1, 'bsln7');
        min_volt = min(uro_data(:,2));
        uro_size = size(uro_data,1);
        for x=1:uro_size
            uro_data(x,2) = uro_data(x,2)+abs(min_volt);
        end
        setappdata(handles.pushbutton1,'uro_data',uro_data);
        axes(handles.axes1);
        cla
        plot(uro_data(:,1),uro_data(:,2));
        
        axes(handles.axes2);
        cla
        plot(uro_data(:,1),uro_data(:,3));
    case 'Set 8'
        uro_data = getappdata(handles.pushbutton1, 'bsln8');
        min_volt = min(uro_data(:,2));
        uro_size = size(uro_data,1);
        for x=1:uro_size
            uro_data(x,2) = uro_data(x,2)+abs(min_volt);
        end
        setappdata(handles.pushbutton1,'uro_data',uro_data);
        axes(handles.axes1);
        cla
        plot(uro_data(:,1),uro_data(:,2));
        
        axes(handles.axes2);
        cla
        plot(uro_data(:,1),uro_data(:,3));
    case 'Set 9'
        uro_data = getappdata(handles.pushbutton1, 'bsln9');
        min_volt = min(uro_data(:,2));
        uro_size = size(uro_data,1);
        for x=1:uro_size
            uro_data(x,2) = uro_data(x,2)+abs(min_volt);
        end
        setappdata(handles.pushbutton1,'uro_data',uro_data);
        axes(handles.axes1);
        cla
        plot(uro_data(:,1),uro_data(:,2));
        
        axes(handles.axes2);
        cla
        plot(uro_data(:,1),uro_data(:,3));
    case 'Set 10'
        uro_data = getappdata(handles.pushbutton1, 'bsln10');
        min_volt = min(uro_data(:,2));
        uro_size = size(uro_data,1);
        for x=1:uro_size
            uro_data(x,2) = uro_data(x,2)+abs(min_volt);
        end
        setappdata(handles.pushbutton1,'uro_data',uro_data);
        axes(handles.axes1);
        cla
        plot(uro_data(:,1),uro_data(:,2));
        
        axes(handles.axes2);
        cla
        plot(uro_data(:,1),uro_data(:,3));
end


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Takes the array for the entire baseline
uro_data = getappdata(handles.pushbutton1,'uro_data');
%Sets the void markers as a variable
setappdata(handles.pushbutton2,'void_data',evalin('base','void_data'));
void_data = getappdata(handles.pushbutton2,'void_data');
%matrix of the position  of markers within 'uro_data'
point_position = [void_data.DataIndex];
point_position = flip(point_position);
%numbe of markers
point_count = size(point_position,2);
%time at the first marker
start_time = point_position(1,1);

%Initialize variables for while loop
a=2;
c=1;
void_table = [];
peak_pos = [];

while a<=(point_count-1)
    b=a+1;
    %Position markers of interest in 'uro_data'
    time_a = point_position(1,a);
    time_b = point_position(1,b);
    %calculates void duration
    int = uro_data(time_b,1)-uro_data(time_a,1);
    void_table(c,3) = int;
    %finds mamaximum voltage in the void 
    [max_volt,max_pt] = max(uro_data(time_a:time_b,2));
    max_pt2 = time_a+(max_pt-1);
    void_table(c,1) = uro_data(time_a,2);
    void_table(c,2) = max_volt;
    peak_pos(c,1) = max_pt2;
    %finds the time to void for each void
    if a==2
        %time to first void
        void_period = uro_data(time_a,1)-uro_data(point_position(1,1),1);
    else
        %peak-to-peak time measurement
        void_period = uro_data(peak_pos(c,1),1)-uro_data(peak_pos(c-1,1),1);
    end
    void_table(c,4) = void_period;
    
    c=c+1;
    a = a+2;
end

%changes seconds to minutes
void_table(:,4) = void_table(:,4)/60;
%displays values in the gui table
set(handles.uitable1,'data',void_table);



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Takes the array for the entire baseline
uro_data = getappdata(handles.pushbutton1,'uro_data');
%Sets the non-void markers as a variable
setappdata(handles.pushbutton3,'NV_data',evalin('base','NV_data'));
NV_data = getappdata(handles.pushbutton3,'NV_data');
%matrix of the position  of markers within 'uro_data'
point_position = [NV_data.DataIndex];
point_position = flip(point_position);
%numbe of markers
point_count = size(point_position,2);
%time at the first marker
start_time = point_position(1,1);
start_int = uro_data(start_time,1);

%Initialize variables for while loop
a=2;
c=1;
NV_table = [];

while a<=(point_count-1)
    b=a+1;
    %Position markers of interest in 'uro_data'
    time_a = point_position(1,a);
    time_b = point_position(1,b);
    NV_table(c,3)=time_a;
    %calculates void duration
    int = uro_data(time_b,1)-uro_data(time_a,1);
    NV_table(c,2) = int;
    %peak voltage of non-void
    peak_v = max(uro_data(time_a:time_b,2));
    volt_diff = peak_v-uro_data(time_a,2);
    NV_table(c,1) = volt_diff;
    
    a=a+2;
    c=c+1;
end

peak_count = size(NV_table,1);
NV_final = [];
y=1;
NV_req = 0.425;

%Filtering all the 'peaks' to see which meet the NV requirement
for x=1:peak_count
    if NV_table(x,1)>NV_req
        NV_final(y,:) = NV_table(x,:);
        y=y+1;
    end
end

NV_export=[];
NV_export(:,:)=NV_final(:,1:2);
set(handles.uitable1,'data',NV_export);

ttfNV=(uro_data(NV_final(1,3),1)-start_int)/60

    


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.axes2.XLim = handles.axes1.XLim;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%EMG Function Button
% Takes the array for the entire baseline
uro_data = getappdata(handles.pushbutton1,'uro_data');
%Gets the burst data from datapoints
setappdata(handles.pushbutton5,'burst_data',evalin('base','burst_data'));
burst_data = getappdata(handles.pushbutton5,'burst_data');
point_position = [burst_data.DataIndex];
point_position = flip(point_position);
%number of markers
point_count = size(point_position,2);
%time at the first marker
start_time = point_position(1,1);

a=1;
c=1;
d=1;
burst_amp=[];
burst_int=[];

while a<=(point_count-1)
    b=a+1;
    if b<point_count
        int = uro_data(point_position(1,b+1),1)-uro_data(point_position(1,a+1),1);
        burst_int(d,1)=int;
        d=d+1;
    else
    end
    burst_max = max(uro_data(point_position(1,a):point_position(1,b),3));
    burst_min = min(uro_data(point_position(1,a):point_position(1,b),3));
    burst_diff = burst_max-burst_min;
    burst_amp(c,1)=burst_diff;
    a=a+2;
    c=c+1;
end
burst_interval = uro_data(point_position(1,point_count),1)-uro_data(point_position(1,1),1)
set(handles.uitable1,'data',burst_amp);
set(handles.uitable2,'data',burst_int);



    
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zoom_in = [2 -2];
handles.axes1.XLim = handles.axes1.XLim+zoom_in;
handles.axes2.XLim = handles.axes2.XLim+zoom_in;


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_back = [-1 -1];
handles.axes1.XLim = handles.axes1.XLim+set_back;
handles.axes2.XLim = handles.axes2.XLim+set_back;


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_fwd = [1 1];
handles.axes1.XLim = handles.axes1.XLim+set_fwd;
handles.axes2.XLim = handles.axes2.XLim+set_fwd;

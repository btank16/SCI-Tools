function varargout = guiIntensity(varargin)
% guiIntensity MATLAB code for guiIntensity.fig
%      guiIntensity, by itself, creates a new guiIntensity or raises the existing
%      singleton*.
%
%      H = guiIntensity returns the handle to a new guiIntensity or the handle to
%      the existing singleton*.
%
%      guiIntensity('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in guiIntensity.M with the given input arguments.
%
%      guiIntensity('Property','Value',...) creates a new guiIntensity or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiIntensity_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiIntensity_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiIntensity

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiIntensity_OpeningFcn, ...
                   'gui_OutputFcn',  @guiIntensity_OutputFcn, ...
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


% --- Executes just before guiIntensity is made visible.
function guiIntensity_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiIntensity (see VARARGIN)

% Choose default command line output for guiIntensity
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiIntensity wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiIntensity_OutputFcn(hObject, eventdata, handles) 
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
setappdata(handles.pushbutton1,'rawImage',[]);
setappdata(handles.pushbutton1,'fileName',[]);
[fileName,pathName] = uigetfile('*.tif');

I = fullfile(pathName,fileName);
rawImage = imread(I);
red = rawImage(:,:,2); %isolate red channel
% green = 2, red = 1
axes(handles.axes1);
imshow(red);
setappdata(handles.pushbutton1,'fileName',fileName);
setappdata(handles.pushbutton1,'rawImage',red);
% getappdata(handles.pushbutton1,'rawImage');
% handles.output = hObject;
% guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setappdata(handles.pushbutton2,'netArea',[]);
setappdata(handles.pushbutton2,'netIntensity',[]);
tempArea = 0;

thresh = str2double(get(handles.edit3,'String'));
pixelConv = str2double(get(handles.edit2,'String'));
I = getappdata(handles.pushbutton1,'rawImage');
for m = 1:size(I,1)
    for n = 1:size(I,2)
        if I(m,n) <= thresh
            I(m,n) = 0;
        else
            tempArea = tempArea + 1;   
        end
    end
end
netArea = tempArea*(pixelConv);
netIntensity = sum(sum(I,1),2);
setappdata(handles.pushbutton2,'netArea',netArea);
setappdata(handles.pushbutton2,'netIntensity',netIntensity);
axes(handles.axes2);
imshow(I);

results = {};
























results{end+1,1} = getappdata(handles.pushbutton1,'fileName');
results{end+1,1} = 'Sum Area (um^2)';
results{end+1,1} = 'Sum Intensity';
results{2,2} = netArea;
results{3,2} = netIntensity;
set(handles.uitable1,'data',results);



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)

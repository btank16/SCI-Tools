function varargout = guiGait(varargin)
% GUIGAIT MATLAB code for guiGait.fig
%      GUIGAIT, by itself, creates a new GUIGAIT or raises the existing
%      singleton*.
%
%      H = GUIGAIT returns the handle to a new GUIGAIT or the handle to
%      the existing singleton*.
%
%      GUIGAIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIGAIT.M with the given input arguments.
%
%      GUIGAIT('Property','Value',...) creates a new GUIGAIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiGait_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiGait_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiGait

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @guiGait_OpeningFcn, ...
    'gui_OutputFcn',  @guiGait_OutputFcn, ...
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


% --- Executes just before guiGait is made visible.
function guiGait_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiGait (see VARARGIN)

% Choose default command line output for guiGait
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiGait wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiGait_OutputFcn(hObject, eventdata, handles)
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

% setappdata(handles.pushbutton1,'time',[]);
% setappdata(handles.pushbutton1,'rightx',[]);
% setappdata(handles.pushbutton1,'righty',[]);
% setappdata(handles.pushbutton1,'leftx',[]);
% setappdata(handles.pushbutton1,'lefty',[]);
% setappdata(handles.pushbutton1,'data',[]);
[fileName,pathName] = uigetfile('*.txt');

file = fullfile(pathName,fileName);
temp = importdata(file);
data = temp.data;


setappdata(handles.pushbutton1,'time',data(:,1));
setappdata(handles.pushbutton1,'rightx',data(:,2));
setappdata(handles.pushbutton1,'righty',data(:,3));
setappdata(handles.pushbutton1,'leftx',data(:,4));
setappdata(handles.pushbutton1,'lefty',data(:,5));

axes(handles.axes1);
cla
plot(data(:,1),data(:,2));
axes(handles.axes2);
cla
plot(data(:,1),data(:,3));
axes(handles.axes3);
cla
plot(data(:,1),data(:,4));
axes(handles.axes4);
cla
plot(data(:,1),data(:,5));
axes(handles.axes5);
cla
plot(data(:,2),data(:,3));
axes(handles.axes6);
cla
plot(data(:,4),data(:,5));

% axes(handles.axes1);
% imshow(data);
% setappdata(handles.pushbutton1,'fileName',fileName);2
% setappdata(handles.pushbutton1,'rawImage',data);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[x,y] = ginput;
% results = [];
% results(end+1,1) = x;
% results(end,2) = y;
axes(handles.axes2);
hold on
plot(x,y,'o');
% % % % %
% hBrushLine = findall(gca,'tag','Brushing');
% brushedData = get(hBrushLine, {'Xdata','Ydata'});
% brushedIdx = ~isnan(brushedData{1});
% brushedXData = brushedData{1}(brushedIdx);
% brushedYData = brushedData{2}(brushedIdx);
% % % % %

% set(handles.uitable1,'data',results);
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



time = getappdata(handles.pushbutton1,'time');
rightx = getappdata(handles.pushbutton1,'rightx');
leftx = getappdata(handles.pushbutton1,'leftx');
righty = getappdata(handles.pushbutton1,'righty');
lefty = getappdata(handles.pushbutton1,'lefty');



tempCalc = zeros(size(time,1),3);
tempCalc(:,1) = time;
tempCalc(:,2) = rightx;
tempCalc(:,3) = leftx;

setappdata(handles.pushbutton6,'Bmin',evalin('base','Bmin'));
Bmin = getappdata(handles.pushbutton6,'Bmin');
b1 = Bmin(1,1).Position(1,1);
b2 = Bmin(1,size(Bmin,2)).Position(1,1);
B1 = 0;
B2 = 0;
for n = 1:size(time,1)
    if time(n) == b1
        B2 = n;
    end
    if time(n) == b2
        B1 = n;
    end
end

setappdata(handles.pushbutton6,'Dmin',evalin('base','Dmin'));
Dmin = getappdata(handles.pushbutton6,'Dmin');
d1 = Dmin(1,1).Position(1,1);
d2 = Dmin(1,size(Dmin,2)).Position(1,1);
D1 = 0;
D2 = 0;
for n = 1:size(time,1)
    if time(n) == d1
        D2 = n;
    elseif time(n) == d2
        D1 = n;
    end
end



axes(handles.axes1);
cla
refresh
plot(time(B1:B2),rightx(B1:B2));
axes(handles.axes2);
cla
refresh
plot(time(B1:B2),righty(B1:B2));
axes(handles.axes3);
cla
refresh
plot(time(D1:D2),leftx(D1:D2));
axes(handles.axes4);
cla
refresh
plot(time(D1:D2),lefty(D1:D2));

RmaxX=max(rightx(B1:B2));
RmaxY=max(righty(B1:B2));
RminX=min(rightx(B1:B2));
RminY=min(righty(B1:B2));
LmaxX=max(leftx(D1:D2));
LmaxY=max(lefty(D1:D2));
LminX=min(leftx(D1:D2));
LminY=min(lefty(D1:D2));

array_size = size(time,1);
for aa=1:array_size
    rightx(aa)=(rightx(aa)-RminX)+3;
    righty(aa)=(righty(aa)-RminY)+3;
    leftx(aa)=(leftx(aa)-LminX)+3;
    lefty(aa)=(lefty(aa)-LminY)+3;
end

axes(handles.axes5);
cla
refresh
plot(rightx(B1:B2),righty(B1:B2));
% export x,y 1
tempXY = [];
tempXY(1,:) = rightx(B1:B2);
tempXY(2,:) = righty(B1:B2);
rXY = tempXY';
dlmwrite('rXY2.txt',rXY);
% morec=dlmread('rXY.txt',',');
% plot(morec(:,1),morec(:,2));
% morec1=dlmread('rXY1.txt',',');
% plot(morec1(:,1),morec1(:,2));

axes(handles.axes6);
cla
refresh
plot(leftx(D1:D2),lefty(D1:D2));
% export x,y 2
tempXY = [];
tempXY(1,:) = leftx(D1:D2);
tempXY(2,:) = lefty(D1:D2);
lXY = tempXY';
dlmwrite('lXY.txt',lXY);

resultsR = {};
resultsR{1,1} = '# steps';
resultsR{1,2} = 'step period';
resultsR{1,3} = 'stance duration';
resultsR{1,4} = 'swing duration';
resultsR{1,5} = 'step length';
resultsR{1,6} = 'max step length';
resultsR{1,7} = 'step height';
resultsR{1,8} = 'max step height';

resultsL = {};
resultsL{1,1} = '# steps';
resultsL{1,2} = 'step period';
resultsL{1,3} = 'stance duration';
resultsL{1,4} = 'swing duration';
resultsL{1,5} = 'step length';
resultsL{1,6} = 'max step length';
resultsL{1,7} = 'step height';
resultsL{1,8} = 'max step height';

tempArray = [];
tempArray2 = [];
% Peaks
if evalin('base','isnumeric(Bpks(1,1).Position)') == 1
    setappdata(handles.pushbutton6,'Bpks',evalin('base','Bpks'));
    Bpk = getappdata(handles.pushbutton6,'Bpks');
    for n = 1:size(Bpk,2)
        axes(handles.axes2);
        hold on
        plot(Bpk(1,n).Position(1,1),Bpk(1,n).Position(1,2),'go');
        %         7R step height
        resultsR{n+1,7} = Bpk(1,n).Position(1,2) - Bmin(1,2*n).Position(1,2);
    end
    %     1R # steps
    resultsR{2,1} = size(Bpk,2);
    %     2R step period
    for n = 1:size(Bpk,2)-1
        resultsR{n+1,2} = Bpk(1,n).Position(1,1) - Bpk(1,n+1).Position(1,1);
    end
end

if evalin('base','isnumeric(Dpks(1,1).Position)') == 1
    setappdata(handles.pushbutton6,'Dpks',evalin('base','Dpks'));
    Dpk = getappdata(handles.pushbutton6,'Dpks');
    for n = 1:size(Dpk,2)
        axes(handles.axes4);
        hold on
        plot(Dpk(1,n).Position(1,1),Dpk(1,n).Position(1,2),'go');
        %          7R step height
        resultsL{n+1,7} = Dpk(1,n).Position(1,2) - Dmin(1,2*n).Position(1,2);
    end
    %     1L # steps
    resultsL{2,1} = size(Dpk,2);
    %     2L step period
    for n = 1:size(Dpk,2)-1
        resultsL{n+1,2} = Dpk(1,n).Position(1,1) - Dpk(1,n+1).Position(1,1);
    end
end


% pre/post peak
if evalin('base','isnumeric(Bmin(1,1).Position)') == 1
    for n = 1:size(Bmin,2)
        axes(handles.axes2);
        hold on
        plot(Bmin(1,n).Position(1,1),Bmin(1,n).Position(1,2),'ro');
        axes(handles.axes1);
        hold on
        %         project time position pre/post pk to rightx
        for m = 1:size(time,1)
            if tempCalc(m,1) == Bmin(1,n).Position(1,1)
                tempx = tempCalc(m,2);
                tempx2 = tempCalc(m,1);
                tempArray(end+1,1) = tempx;
                tempArray2(end+1,1) = tempx2;
            end
        end
        plot(Bmin(1,n).Position(1,1),tempx,'ro');
    end
    %  3R stance duration
    %     4R swing duration
    for n = 1:size(Bpk,2)-1
        resultsR{n+1,3} = Bmin(1,n+1+(n-1)).Position(1,1)-Bmin(1,n+2+(n-1)).Position(1,1);
        resultsR{n+1,4} = Bmin(1,n+(n-1)).Position(1,1)-Bmin(1,n+1+(n-1)).Position(1,1);
    end
    
    %     5R step length
    tempMax = 0;
    tempMin = 0;
    for n = 1:size(tempArray2,1)/2
        if (n+(n-1)) < size(tempArray2,1)
            for m = find(tempCalc(:,1)==tempArray2(2*n)):find(tempCalc(:,1)==tempArray2(2*n-1))
                if m == find(tempCalc(:,1)==tempArray2(2*n))
                    tempMax = tempCalc(m,2);
                    tempMin = tempCalc(m,2);
                end
                if tempCalc(m,2) > tempMax
                    tempMax = tempCalc(m,2);
                elseif tempCalc(m,2) < tempMin
                    tempMin = tempCalc(m,2);
                end            
            end
            resultsR{n+1,5} = tempMax - tempMin;
        end
    end
end

tempArray = [];
tempArray2 = [];
if evalin('base','isnumeric(Dmin(1,1).Position)') == 1
    for n = 1:size(Dmin,2)
        axes(handles.axes4);
        hold on
        plot(Dmin(1,n).Position(1,1),Dmin(1,n).Position(1,2),'ro');
        axes(handles.axes3);
        hold on
        %         project time position pre/pofst pk to leftx
        for m = 1:size(time,1)
            if tempCalc(m,1) == Dmin(1,n).Position(1,1)
                tempx = tempCalc(m,3);
                tempx2 = tempCalc(m,1);
                tempArray(end+1,1) = tempx;
                tempArray2(end+1,1) = tempx2;
            end
        end
        plot(Dmin(1,n).Position(1,1),tempx,'ro');
    end
    %  3L stance duration
    %  4L swing duration
    for n = 1:size(Dpk,2)-1
        resultsL{n+1,3} = Dmin(1,n+1+(n-1)).Position(1,1)-Dmin(1,n+2+(n-1)).Position(1,1);
        resultsL{n+1,4} = Dmin(1,n+(n-1)).Position(1,1)-Dmin(1,n+1+(n-1)).Position(1,1);
    end
    
    %     5L step length
    tempMax = 0;
    tempMin = 0;
    for n = 1:size(tempArray2,1)/2
        if (n+(n-1)) < size(tempArray2,1)
            for m = find(tempCalc(:,1)==tempArray2(2*n)):find(tempCalc(:,1)==tempArray2(2*n-1))
                if m == find(tempCalc(:,1)==tempArray2(2*n))
                    tempMax = tempCalc(m,3);
                    tempMin = tempCalc(m,3);
                end
                if tempCalc(m,3) > tempMax
                    tempMax = tempCalc(m,3);
                elseif tempCalc(m,3) < tempMin
                    tempMin = tempCalc(m,3);
                end            
            end
            resultsL{n+1,5} = tempMax - tempMin;
        end
    end
end



% 6L max step length
% 8L max step height
resultsR{2,6} = resultsR{2,5};
resultsR{2,8} = resultsR{2,7};
for n = 2:size(resultsR,1)-1
    if resultsR{n+1,5} > resultsR{2,6}
        resultsR{2,6} = resultsR{n+1,5};
    end
    if resultsR{n+1,7} > resultsR{2,8}
        resultsR{2,8} = resultsR{n+1,7};
    end
end

% 6R max step length
% 8R max step height
resultsL{2,6} = resultsL{2,5};
resultsL{2,8} = resultsL{2,7};
for n = 2:size(resultsL,1)-1
    if resultsL{n+1,5} > resultsL{2,6}
        resultsL{2,6} = resultsL{n+1,5};
    end
    if resultsL{n+1,7} > resultsL{2,8}
        resultsL{2,8} = resultsL{n+1,7};
    end
end


%     if rX(minResults(n+1+(n-1),3))-rX(minResults(n+(n-1),3)) > resultsL(1,6)
%         resultsL(1,6) = rX(minResults(n+1+(n-1),3))-rX(minResults(n+(n-1),3));
%     end
%     resultsL(n,7) = pks(n,1)-minResults(n+(n-1),2);
%     if pks(n) > resultsL(1,8)
%         resultsL(1,8) = pks(n);
%     end
% end

set(handles.uitable1,'data',resultsR);
set(handles.uitable2,'data',resultsL);


%
% results = NaN(8,size(Bpk,1));
% results(1,1) = '# Steps';
% results(1,2) = size(Bpk,1);
% % results(1,3) = size(Dpk,2);
%
% resultsL{6,2} = rX(minResults(2,3))-rX(minResults(1,3));
% resultsL{6,3} = rX(minResults(2,3))-rX(minResults(1,3));
% resultsL{8,2} = pks(1);
% resultsL{8,3} = pks(1);
%
% for n = 1:size(Apk,1)
%     if n < size(Apk,1)
%         resultsL(n,2) = rT(locs(n+1,1))-rT(locs(n,1));
%         resultsL(n,3) = minResults(n+2+(n-1),1)-minResults(n+1+(n-1),1);
%     end
%     resultsL(n,4) = minResults(n+1+(n-1),1)-minResults(n+(n-1),1);
%     resultsL(n,5) = rX(minResults(n+1+(n-1),3))-rX(minResults(n+(n-1),3));
%     if rX(minResults(n+1+(n-1),3))-rX(minResults(n+(n-1),3)) > resultsL(1,6)
%         resultsL(1,6) = rX(minResults(n+1+(n-1),3))-rX(minResults(n+(n-1),3));
%     end
%     resultsL(n,7) = pks(n,1)-minResults(n+(n-1),2);
%     if pks(n) > resultsL(1,8)
%         resultsL(1,8) = pks(n);
%     end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% right leg %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calc AVG Trajectory
% 1st step
% SAVE TO ARRAY

stepArray = [];
for n = 1:size(Bpk,2)
    stepStart = Bmin(1,size(Bmin,2)-(2*n-2)).DataIndex - (Bmin(1,size(Bmin,2)).DataIndex - 1);
    stepEnd = Bmin(1,size(Bmin,2)-(2*n-1)).DataIndex - (Bmin(1,size(Bmin,2)).DataIndex - 1);
    temp = size(stepStart:stepEnd,2);
    if size(stepArray,1) < temp && size(stepArray,1) > 0 %ZERO BUFFER 1
        for m = size(stepArray,1)+1:temp
            stepArray(m,:) = 0;
        end
    end
    if size(stepArray,1) > temp %ZERO BUFFER 2
        temp1 = rXY(stepStart:stepEnd,1);
        temp2 = rXY(stepStart:stepEnd,2);
        for j = temp:size(stepArray,1)
            temp1(j,:) = 0;
            temp2(j,:) = 0;
        end
        stepArray(:,2*n-1) = temp1;
        stepArray(:,2*n) = temp2;
    else
        stepArray(:,2*n-1) = rXY(stepStart:stepEnd,1);
        stepArray(:,2*n) = rXY(stepStart:stepEnd,2);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% PAUSE FOR R %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
setappdata(handles.pushbutton6,'stepArray',stepArray);
set(handles.uitable3,'data',stepArray);
% import = stepArray;
% GaitPCAalt


% CALC + PLOT AVG TRAJ
avgArray = [];
for n = 1:size(stepArray,2)
    avgTemp = [];
    tempSize = 0;
    k=1;
    while k < size(stepArray(:,n),1)
        if stepArray(k,n) == 0
            tempSize = k-1;
            k = size(stepArray(:,n))+1;
        end
        k = k+1;
        if k == size(stepArray(:,n),1)
            tempSize = k;
        end
    end
    counter = 1;
    %     sizeCheck = 999999;
    while counter <= tempSize
        avgTemp(end+1,1) = stepArray(counter,n);
        if counter+round(0.02*tempSize) > tempSize && size(avgTemp,1)<size(avgArray,1)
            avgTemp(end+1,1) = stepArray(tempSize,n);
        end
        counter = counter + round(0.02*tempSize);
    end
    if size(avgTemp,1) > size(avgArray,1) && size(avgArray,1) > 0
        for l = 1:(size(avgTemp,1) - size(avgArray,1))
            avgTemp(size(avgTemp,1),:) = [];
        end
        counter = tempSize + 1;
    end
    if size(avgTemp,1) < size(avgArray,1) && size(avgArray,1) > 0
        while size(avgTemp,1) < size(avgArray,1)
            avgTemp(end+1,1) = avgTemp(end,1);
        end
    end
    avgArray(:,n) = avgTemp;
    %     sizeCheck = size(avgArray,1);
end
avgFinalarray = [];
temp1 = [];
temp2 = [];
for n = 1:size(avgArray,1)
    for m = 1:size(avgArray,2)/2
        temp1(n,m) = avgArray(n,2*m-1);
        temp2(n,m) = avgArray(n,2*m);
    end
end
for n = 1:size(temp1,1)
    avgFinalarray(n,1) = mean(temp1(n,:));
    avgFinalarray(n,2) = mean(temp2(n,:));
end

% axes(handles.axes5);
% hold on
% plot(avgFinalarray(:,1),avgFinalarray(:,2),'r','linewidth',3);

% syntax for defining plot axes constraints
    % axis([xMin xMax yMin yMax])
    % example for x-axis range from 1-10 and y-axis range from 2-20
%     axis([-40 120 -20 60]);

%%%%%%%%%%%%%%%%%%%%%%%%%% left leg %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

stepArray2 = [];
for n = 1:size(Dpk,2)
    stepStart = Dmin(1,size(Dmin,2)-(2*n-2)).DataIndex - (Dmin(1,size(Dmin,2)).DataIndex - 1);
    stepEnd = Dmin(1,size(Dmin,2)-(2*n-1)).DataIndex - (Dmin(1,size(Dmin,2)).DataIndex - 1);
    temp = size(stepStart:stepEnd,2);
    if size(stepArray2,1) < temp && size(stepArray2,1) > 0 %ZERO BUFFER 1
        for m = size(stepArray2,1)+1:temp
            stepArray2(m,:) = 0;
        end
    end
    if size(stepArray2,1) > temp %ZERO BUFFER 2
        temp1 = lXY(stepStart:stepEnd,1);
        temp2 = lXY(stepStart:stepEnd,2);
        for j = temp:size(stepArray2,1)
            temp1(j,:) = 0;
            temp2(j,:) = 0;
        end
        stepArray2(:,2*n-1) = temp1;
        stepArray2(:,2*n) = temp2;
    else
        stepArray2(:,2*n-1) = lXY(stepStart:stepEnd,1);
        stepArray2(:,2*n) = lXY(stepStart:stepEnd,2);
    end
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% PAUSE FOR L %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
setappdata(handles.pushbutton6,'stepArray',stepArray2);
set(handles.uitable5,'data',stepArray2);
% import = stepArr      
% GaitPCAalt



% CALC + PLOT AVG TRAJ
avgArray = [];
for n = 1:size(stepArray2,2)
    avgTemp = [];
    tempSize = 0;
    k=1;
    while k < size(stepArray2(:,n),1)
        if stepArray2(k,n) == 0
            tempSize = k-1;
            k = size(stepArray2(:,n))+1;
        end
        k = k+1;
        if k == size(stepArray2(:,n),1)
            tempSize = k;
        end
    end
    counter = 1;
    %     sizeCheck = 999999;
    while counter <= tempSize
        avgTemp(end+1,1) = stepArray2(counter,n);
        if counter+round(0.02*tempSize) > tempSize && size(avgTemp,1)<size(avgArray,1)
            avgTemp(end+1,1) = stepArray2(tempSize,n);
        end
        counter = counter + round(0.02*tempSize);
    end
    if size(avgTemp,1) > size(avgArray,1) && size(avgArray,1) > 0
        for l = 1:(size(avgTemp,1) - size(avgArray,1))
            avgTemp(size(avgTemp,1),:) = [];
        end
        counter = tempSize + 1;
    end
    if size(avgTemp,1) < size(avgArray,1) && size(avgArray,1) > 0
        while size(avgTemp,1) < size(avgArray,1)
            avgTemp(end+1,1) = avgTemp(end,1);
        end
    end
    avgArray(:,n) = avgTemp; %check avg stepArray2 size inaccuracy
    %     sizeCheck = size(avgArray,1);
end
avgFinalarray2 = [];
temp1 = [];
temp2 = [];
for n = 1:size(avgArray,1)
    for m = 1:size(avgArray,2)/2
        temp1(n,m) = avgArray(n,2*m-1);
        temp2(n,m) = avgArray(n,2*m);
    end
end
for n = 1:size(temp1,1)
    avgFinalarray2(n,1) = mean(temp1(n,:));
    avgFinalarray2(n,2) = mean(temp2(n,:));
end

% %ALL IF STATEMENTS CHOOSE BETWEEN LEFT/RIGHT
% %x-axis max boundary
% if RmaxX>LmaxX
%     X_ax_max = RmaxX;
% else
%     X_ax_max = LmaxX;
% end
% %x-axis minimum boundary
% if RminX<LminX
%     X_ax_min = RminX;
% else
%     X_ax_min = LminX;
% end
% %y-axis max boundary
% if RmaxY>LmaxY
%     y_ax_max = RmaxY;
% else
%     y_ax_max = LmaxY;
% end
% %y-axis minimum boundary
% if RminY<LminY
%     y_ax_min = RminY;
% else
%     y_ax_min = LminY;
% end
% 
% %Rounds each bound to the nearest interval of 5
% y_ax_min = 5*floor(y_ax_min/5)-2;
% X_ax_min = 5*floor(X_ax_min/5)-2;
% y_ax_max = 5*ceil(y_ax_max/5)+2;
% X_ax_max = 5*ceil(X_ax_max/5)+2;

y_ax_min = 0;
y_ax_max = 60;
X_ax_min = 0;
X_ax_max = 80;

%Find the median of the selected data
% RMX=median(rightx(B1:B2));
% RMY=median(righty(B1:B2));
% LMX=median(leftx(D1:D2));
% LMY=median(lefty(D1:D2));

% NrightXY = [];
% NleftXY = [];
% 
% %Shift data so the median is (0,0)
% for zz=1:array_size
%     NrightXY(zz,1)=rightx(zz)-RMX;
%     NrightXY(zz,2)=righty(zz)-RMY;
%     NleftXY(zz,1)=leftx(zz)-LMX;
%     NleftXY(zz,2)=lefty(zz)-LMY;
% end
%     
% right_pol = [];
% left_pol = [];
% %Change the data from cartesian to polar coordiantes
% [right_pol(:,1),right_pol(:,2)]=cart2pol(NrightXY(B1:B2,1),NrightXY(B1:B2,2));
% [left_pol(:,1),left_pol(:,2)]=cart2pol(NleftXY(D1:D2,1),NleftXY(D1:D2,2));
% right_pol=sortrows(right_pol,2);
% left_pol=sortrows(left_pol,2);
% 
% AVGright=[];
% AVGleft=[];
% polar_size=size(right_pol,1);
% b=1;
% b_int=1;
% end_loop=polar_size-5;
% 
% while b<=end_loop
%     end_pt=array_size-b;
%     if end_pt>6
%         c=b+4;
%         x_val=mean(right_pol(b:c,1));  
%         y_val=mean(right_pol(b:c,2));
%     else
%         x_val=mean(right_pol(b:array_size,1));
%         y_val=mean(right_pol(b:array_size,2));
%     end
%     AVGright(b_int,1)=x_val;
%     AVGright(b_int,2)=y_val;
%     b_int=b_int+1;
%     b=b+5;
% end
% 
% for b=1:100:polar_size
%     c=b+99;
%     if c<polar_size
%         x_val=mean(right_pol(b:c,1));  
%         y_val=mean(right_pol(b:c,2)); 
%     else
%         x_val=mean(right_pol(b:polar_size,1));
%         y_val=mean(right_pol(b:polar_size,2));
%     end
%     AVGright(b_int,1)=x_val;
%     AVGright(b_int,2)=y_val;
%     b_int=b_int+1;
% end
% AVG_FinalRight=[];
% [AVG_FinalRight(:,1),AVG_FinalRight(:,2)]=pol2cart(AVGright(:,1),AVGright(:,2));

    
axes(handles.axes5);
hold on
plot(avgFinalarray(:,1),avgFinalarray(:,2),'r','linewidth',3);
    axis([X_ax_min X_ax_max y_ax_min y_ax_max])
% plot(AVG_FinalRight(:,1),AVG_FinalRight(:,2),'r','linewidth',3);
    

axes(handles.axes6);
hold on
plot(avgFinalarray2(:,1),avgFinalarray2(:,2),'r','linewidth',3);
    axis([X_ax_min X_ax_max y_ax_min y_ax_max])


% axes(handles.axes6);
% hold on
% plot(avgFinalarray(:,1),avgFinalarray(:,2),'r','linewidth',3);

% syntax for defining plot axes constraints
    % axis([xMin xMax yMin yMax])
%     % example for x-axis range from 1-10 and y-axis range from 2-20
%     axis([-40 120 -20 60]);
%  

% a=a;
% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


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


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Bmin = getappdata(handles.pushbutton6,'Bmin');
set(handles.edit1,'String',Bmin(1,size(Bmin,2)).Position(1,1));
set(handles.edit2,'String',Bmin(1,1).Position(1,1));


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
time = getappdata(handles.pushbutton1,'time');
righty = getappdata(handles.pushbutton1,'righty');
lefty = getappdata(handles.pushbutton1,'lefty');
t1 = str2double(handles.edit1.String);
t2 = str2double(handles.edit2.String);
time1=0;
time2=0;
for n = 1:size(time,1)
    if round(time(n),3) == round(t1,3)
        time1 = n;
    elseif round(time(n),3) == round(t2,3)
        time2 = n;
    end
end
tempR = 0;
tempL = 0;
% for n = time1:time2
%     if n == time1
%         tempR = righty(time1);
%         righty(n) = righty(n) - tempR;
%         tempL = lefty(time1);
%         lefty(n) = lefty(n) - tempL;
%     else
%         righty(n) = righty(n) - tempR;
%         lefty(n) = lefty(n) - tempL;
%     end
% end

%Sets the valus in their own vector to plot
right_graph = righty(time1:time2);
left_graph = lefty(time1:time2);
%Finds minimum value in each vector
MIN_left = min(left_graph);
MIN_right = min(right_graph);

% if MIN_left>MIN_right
%     MINval = MIN_right;
% else
%     MINval = MIN_left;
% end

%Adjusts the vector so the min is at 0 on the y-axis
right_graph = right_graph - MIN_right;
left_graph = left_graph - MIN_left;

%plots vectors
axes(handles.axes10);
cla
plot(right_graph,'r','linewidth',3);
hold on
plot(left_graph,'b','linewidth',3);

% axes(handles.axes10);
% cla
% plot(righty(time1:time2),'r','linewidth',3);
% hold on
% plot(lefty(time1:time2),'b','linewidth',3);

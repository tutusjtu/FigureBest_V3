function varargout = FigureBestV3(varargin)
% FIGUREBESTV3 MATLAB code for FigureBestV3.fig
%      FIGUREBESTV3, by itself, creates a new FIGUREBESTV3 or raises the existing
%      singleton*.%
%      H = FIGUREBESTV3 returns the handle to a new FIGUREBESTV3 or the handle to
%      the existing singleton*.%
%      FIGUREBESTV3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIGUREBESTV3.M with the given input arguments.%
%      FIGUREBESTV3('Property','Value',...) creates a new FIGUREBESTV3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FigureBestV3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FigureBestV3_OpeningFcn via varargin.%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help FigureBestV3
% Last Modified by GUIDE v2.5 30-Jan-2021 21:53:08
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @FigureBestV3_OpeningFcn, ...
    'gui_OutputFcn',  @FigureBestV3_OutputFcn, ...
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
% --- Executes just before FigureBestV3 is made visible.
function FigureBestV3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FigureBestV3 (see VARARGIN)
% Choose default command line output for FigureBestV3
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes FigureBestV3 wait for user response (see UIRESUME)
% uiwait(handles.FB);
% --- Outputs from this function are returned to the command line.
function varargout = FigureBestV3_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
addpath [pwd '\style3'];
set(handles.remind,'String','美化进行中......');
iNumberVector=str2num(handles.iNumber.String);
global iColor;
global idrawType;
global name;
global Dimention;
global isOut;
iColor=getappdata(handles.color,'Color');
idrawType=getappdata(handles.iDrawType,'iDrawType');
name=getappdata(handles.name,'name');
Dimention= 2;
isOut=getappdata(handles.isOut,'isOut');
if ~isempty(iNumberVector)
    for i=1:length(iNumberVector)
        if idrawType == 1 | idrawType == 2
            controlAll(iNumberVector(i));
        elseif  idrawType == 3 % add a new style
            disp('调用新风格')
            style3(iNumberVector(i),idrawType,iColor)
        end
    end
else
    if idrawType == 1 | idrawType == 2
        f=gcf;
        controlAll(f.Number);
    elseif idrawType == 3 % add a new style
        disp('调用新风格')
        f=gcf;
        style3(f,idrawType,iColor)
    end
end
if isOut==1
    set(handles.remind,'String',['美化已经完成！','并且已经保存！']);
else
    set(handles.remind,'String',['美化已经完成！','但是未保存！如需保存，请勾选“输出”']);
end
function iNumber_Callback(hObject, eventdata, handles)
% hObject    handle to iNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of iNumber as text
%        str2double(get(hObject,'String')) returns contents of iNumber as a double
% --- Executes during object creation, after setting all properties.
function iNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(findall(0,'tag','Msgbox_ '));
% --------------------------------------------------------------------
function ICON1_Callback(hObject, eventdata, handles)
% hObject    handle to ICON1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=imshow('tutu.jpg');
f=h.Parent.Parent;
f.Name='开发者信息:微信公众号';
f.Resize='off';
f.Position=[100 100 400 400];
f.NumberTitle='off';
f.MenuBar='none'
shg;
% axis off;
% --- Executes on selection change in iDrawType.
function iDrawType_Callback(hObject, eventdata, handles)
% hObject    handle to iDrawType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns iDrawType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from iDrawType
T=0;
switch hObject.Value
    case 1
        T=2;
        
    case 2
        T=1;
    case 3
        T=2;
    case 4
        T = 3;
end
setappdata(hObject,'iDrawType',T);
% --- Executes during object creation, after setting all properties.
function iDrawType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iDrawType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
setappdata(hObject,'iDrawType',2);
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'Visible','on');
% --- Executes on selection change in color.
function color_Callback(hObject, eventdata, handles)
% hObject    handle to color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns color contents as cell array
%        contents{get(hObject,'Value')} returns selected item from color
switch hObject.Value
    case 1
        C=42;
    case 2
        C=20;
    case 3
        C=21;
    case 4
        C=30;
    case 5
        C=31;
    case 6
        C=32;
    case 7
        C=40;
    case 8
        C=41;
    case 9
        C=42;
    case 10
        C=43;
    case 11
        C=50;
    case 12
        C=60;
    case 13
        C=70;
end
setappdata(hObject,'Color',C);
% --- Executes during object creation, after setting all properties.
function color_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
setappdata(hObject,'Color',42);
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');    
end
set(hObject,'Visible','on');
% --- Executes on button press in result.
function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filePath=[pwd '\Results'];
winopen(filePath);
function name_Callback(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of name as text
%        str2double(get(hObject,'String')) returns contents of name as a double
%输入名字
name=handles.name.String;
setappdata(hObject,'name',name);
% --- Executes during object creation, after setting all properties.
function name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
setappdata(hObject,'name','FigureFromTuTu');
set(hObject,'Visible','on');
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in YesOut.
function YesOut_Callback(hObject, eventdata, handles)
% hObject    handle to YesOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of YesOut
Yes=handles.YesOut.Value;
if Yes==1
    set(handles.result,'Visible','on');
    set(handles.name,'Visible','on');
    % set(handles.tips_name,'Visible','on');
    set(handles.NoOut,'Value',0);
    % else
    %     set(handles.result,'Visible','off');
    %     set(handles.name,'Visible','off');
    %     set(handles.tips_name,'Visible','off');
end
% --- Executes during object creation, after setting all properties.
function YesOut_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YesOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% --- Executes on button press in isOut.
function isOut_Callback(hObject, eventdata, handles)
% hObject    handle to isOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of isOut
if hObject.Value==1;
    %set(handles.name,'Visible','on');
    %set(handles.tips_name,'Visible','on');
    set(handles.result,'Visible','on');
    setappdata(hObject,'isOut',1);
    set(handles.remind,'String','图片将以指定名称被保存！');
    set(handles.uibuttongroup6,'Visible','on');
    set(handles.expert,'Visible','on');
else
    %set(handles.name,'Visible','off');
    %set(handles.tips_name,'Visible','off');
    %set(handles.result,'Visible','off');
    setappdata(hObject,'isOut',0);
    set(handles.remind,'String','当前美化不/未保存！');
    set(handles.uibuttongroup6,'Visible','off');
    set(handles.expert,'Visible','off');    
end
% --- Executes on button press in is3D.
function is3D_Callback(hObject, eventdata, handles)
% hObject    handle to is3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of is3D
if hObject.Value==1
    setappdata(hObject,'is3D',3);
    set(handles.remind,'String','用于控制三维视图的角度')
else
    setappdata(hObject,'is3D',2);
    set(handles.remind,'String','二维作图模式')
end
% --- Executes during object creation, after setting all properties.
function isOut_CreateFcn(hObject, eventdata, handles)
% hObject    handle to isOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
setappdata(hObject,'isOut',0);
set(hObject,'Visible','on');
% --- Executes during object creation, after setting all properties.
function is3D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to is3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
setappdata(hObject,'is3D',2);
set(hObject,'Visible','off');
% --- Executes during object creation, after setting all properties.
function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% --- Executes during object creation, after setting all properties.
function tips_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tips_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% --- Executes on button press in test.
function test_Callback(hObject, eventdata, handles)
% hObject    handle to test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.remind,'String','正在生成一些用于测试效果的图片......');
test;
set(handles.remind,'String','测试图片生成——>已完成');
% --- Executes on button press in singlecolumn.
function singlecolumn_Callback(hObject, eventdata, handles)
% hObject    handle to singlecolumn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.remind,'String',{'正在设置双栏格式'});
iNumberVector=str2num(handles.iNumber.String);
for i=1:length(iNumberVector)
    handleMyFigure=findall(groot,'Type','figure','Number',iNumberVector(i))
    handleMyFigure.Name='图图的绘图格式-双栏';
    handleMyFigure.Units='centimeters';     %改为厘米为单位
    %设置图片的大小，双栏选择[10, 10, 9, 6.75]cm，[相对位置 宽度高度]
    handleMyFigure.Position=[1, 1, 9, 6.75];
    handleMyFigure.Resize='on';
    handleMyFigure.Color='w';               %将图形背景设置为白色
    %打印属性 和图片属性相仿
    handleMyFigure.PaperUnits='centimeters';
    handleMyFigure.PaperPosition=[1, 1, 9, 6.75];
    handleMyFigure.InvertHardcopy='off';%保存图像坐标背景色
    Frame = get(handleMyFigure,'JavaFrame');
    set(Frame,'FigureIcon',javax.swing.ImageIcon('tutu.png'));
end
set(handles.remind,'String',{'双栏格式设置完成，图片已规范化！'});
shg
% --- Executes on button press in doublecolumn.
function doublecolumn_Callback(hObject, eventdata, handles)
% hObject    handle to doublecolumn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.remind,'String',{'正在设置单栏格式'});
iNumberVector=str2num(handles.iNumber.String);
for i=1:length(iNumberVector)
    handleMyFigure=findall(groot,'Type','figure','Number',iNumberVector(i))
    handleMyFigure.Name='图图的绘图格式-单栏';
    handleMyFigure.Units='centimeters';     %改为厘米为单位
    %设置图片的大小，单栏选择[10, 4, 19, 14.25]cm，[相对位置 宽度高度]
    handleMyFigure.Position=[1, 1, 19, 14.25];
    handleMyFigure.Resize='on';
    handleMyFigure.Color='w';               %将图形背景设置为白色
    %打印属性 和图片属性相仿
    handleMyFigure.PaperUnits='centimeters';
    handleMyFigure.PaperPosition=[1, 1, 19, 14.25];
    handleMyFigure.InvertHardcopy='off';%保存图像坐标背景色
    Frame = get(handleMyFigure,'JavaFrame');
    set(Frame,'FigureIcon',javax.swing.ImageIcon('tutu.png'));
end
set(handles.remind,'String',{'单栏格式设置完成，图片已规范化！'});
shg
% --- Executes on button press in expert.
function expert_Callback(hObject, eventdata, handles)
% hObject    handle to expert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
iformat = get(handles.listbox2,'Value')
switch iformat
    case 1
        format = '-dpng';
    case 2
        format = '-djpeg';
    case 3
        format = '-dtiff';
    case 4
        format = '-depsc';
end
name=getappdata(handles.name,'name');
if ~strcmp(name,'FigureFromTuTu')
    disp('正在导出');
    set(handles.remind,'String',{['正在导出+复制到剪切板，格式为' format(3:end)]});
    iNumberVector=str2num(handles.iNumber.String);
    for i=1:length(iNumberVector)
        handleMyFigure=findall(groot,'Type','figure','Number',iNumberVector(i));
        tuExport(handleMyFigure,name,format,'on');
    end
    disp('导出成功')
    set(handles.remind,'String',{'已经成功导出，可以点击快速看图！'});
    set(handles.show,'Visible','on');
    set(handles.show,'Enable','on');
else
    disp('请先打开输出开关,并输入名字')
    set(handles.remind,'String',{'请先打开输出开关，并输入图片名！'});
end
% --- Executes on button press in show.
function show_Callback(hObject, eventdata, handles)
% hObject    handle to show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filePath=[pwd '\results'];
fid=fopen([filePath, '\' 'name_append.txt'],'r');
i=1;
while feof(fid)~=1
    nameMatrix{i}=fgetl(fid);
    i=i+1;
end
fclose(fid);
iformat = get(handles.listbox2,'Value')
switch iformat
    case 1
        format = '.png';
    case 2
        format = '.jpg';
    case 3
        format = '.tif';
    case 4
        format = '.eps';
end

for i=1:length(nameMatrix)
    name=nameMatrix{i};
    if ~isempty(name)
        winopen([filePath,'\',name,format ]);
    else
        disp('请先打开输出开关,并输入名字');
        set(handles.remind,'String','请先打开输出开关,并输入名字');
    end
end
function remind_Callback(hObject, eventdata, handles)
% hObject    handle to remind (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of remind as text
%        str2double(get(hObject,'String')) returns contents of remind as a double
% --- Executes during object creation, after setting all properties.
function remind_CreateFcn(hObject, eventdata, handles)
% hObject    handle to remind (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.%       See ISPC and COMPUTER.
set(hObject,'String','欢迎使用图图的软件');
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'Visible','on');
% --- Executes on button press in addlegend.
function addlegend_Callback(hObject, eventdata, handles)
% hObject    handle to addlegend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.remind,'String','为某个figure添加图例');
modifyLegendRecognize(fignum2handle(str2num(handles.iNumber.String)));
set(handles.remind,'String','添加图例完成');
% --- Executes on button press in font.
function font_Callback(hObject, eventdata, handles)
% hObject    handle to font (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figNum=str2num(handles.iNumber.String);
%(figNum,fontSize,fontName,boldType,latexType)
% prompt = {'输入字号（数字）:','输入字体','输入是否加粗(bold/normal):','输入解释器(latex/none)'};
% dlgtitle = '字体相关参数设置';
% dims = [1 35];
% definput = {'12','Arial','bold','none'};
% answer = inputdlg(prompt,dlgtitle,dims,definput)
% fontSize=str2num(answer{1});
% fontName=answer{2} ;
% boldType=answer{3} ;
temp = uisetfont;
fontSize = temp.FontSize;
fontName = temp.FontName;
boldType = temp.FontWeight;
if handles.radiobutton12.Value == 0
    latexType='none' ;
else
    latexType='latex' ;    
end
fontsizenamebold(figNum,fontSize,fontName,boldType,latexType);
function XL_Callback(hObject, eventdata, handles)
% hObject    handle to XL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of XL as text
%        str2double(get(hObject,'String')) returns contents of XL as a double
% --- Executes during object creation, after setting all properties.
function XL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
set(hObject,'Visible','off');
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end% --- Executes on button press in fill.
function fill_Callback(hObject, eventdata, handles)
% hObject    handle to fill (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.remind,'String','此功能慎用~');
axesfillfigure(str2num(handles.iNumber.String));
shg;
% --- Executes on button press in label.
function label_Callback(hObject, eventdata, handles)
% hObject    handle to label (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.XL,'Visible','on');
set(handles.YL,'Visible','on');
set(handles.ZL,'Visible','on');
set(handles.TI,'Visible','on');
set(handles.XB,'Visible','on');
set(handles.YB,'Visible','on');
set(handles.ZB,'Visible','on');
set(handles.TB,'Visible','on');
set(handles.addXYZT,'Visible','on');
set(handles.pushbutton15,'Visible','on');
set(handles.uibuttongroup9,'Visible','on');
function YL_Callback(hObject, eventdata, handles)
% hObject    handle to YL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of YL as text
%        str2double(get(hObject,'String')) returns contents of YL as a double
% --- Executes during object creation, after setting all properties.
function YL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function ZL_Callback(hObject, eventdata, handles)
% hObject    handle to ZL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of ZL as text
%        str2double(get(hObject,'String')) returns contents of ZL as a double
% --- Executes during object creation, after setting all properties.
function ZL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ZL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Ti_Callback(hObject, eventdata, handles)
% hObject    handle to Ti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Ti as text
%        str2double(get(hObject,'String')) returns contents of Ti as a double
% --- Executes during object creation, after setting all properties.
function Ti_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in addXYZT.
function addXYZT_Callback(hObject, eventdata, handles)
% hObject    handle to addXYZT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.remind,'String','添加坐标轴文字中...！如果有子图，会提示您选择坐标轴');
axess=findall(fignum2handle(str2num(handles.iNumber.String)),'Type','axes');
if length(axess)>=2
    set(handles.remind,'String','因为有子图，所以你有5秒钟的时间单击你要选择的坐标轴！');
    pause(5);
    myAxesHandle=gca;
    if strcmp(myAxesHandle.Type,'axes')
        set(handles.remind,'String','选择错误，请重试一次');pause(1);
        set(handles.remind,'String','因为有子图，所以你有5秒钟的时间单击你要选择的坐标轴！');
        pause(5);
        myAxesHandle=gca;
        if myAxesHandle.Type~='axes'
            set(handles.remind,'String','再次错误，请重新来');return
        end
    end
elseif length(axess)==1
    myAxesHandle=axess;
else
    myAxesHandle=gca;
end
myAxesHandle.XLabel.String=handles.XL.String;
myAxesHandle.YLabel.String=handles.YL.String;
myAxesHandle.ZLabel.String=handles.ZL.String;
myAxesHandle.Title.String=handles.TI.String;
%myAxesHandle.Ti.String=handles.Ti.String;
set(handles.remind,'String','添加已完成！');
% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.XL,'Visible','off');
set(handles.YL,'Visible','off');
set(handles.ZL,'Visible','off');
set(handles.TI,'Visible','off');
set(handles.XB,'Visible','off');
set(handles.YB,'Visible','off');
set(handles.ZB,'Visible','off');
set(handles.TB,'Visible','off');
set(handles.addXYZT,'Visible','off');
set(hObject,'Visible','off');
set(handles.uibuttongroup9,'Visible','off');
% --- Executes during object creation, after setting all properties.
function addXYZT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to addXYZT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
myAxesHandle.XLabel.String='defaultX';
myAxesHandle.YLabel.String='defaultY';
myAxesHandle.ZLabel.String='defaultZ';
function TI_Callback(hObject, eventdata, handles)
% hObject    handle to TI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of TI as text
%        str2double(get(hObject,'String')) returns contents of TI as a double
% --- Executes during object creation, after setting all properties.
function TI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes during object creation, after setting all properties.
function label_CreateFcn(hObject, eventdata, handles)
% hObject    handle to label (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% set(handles.XL,'Visible','off');
% set(handles.YL,'Visible','off');
% set(handles.ZL,'Visible','off');
% set(handles.TI,'Visible','off');
% set(handles.XB,'Visible','off');
% set(handles.YB,'Visible','off');
% set(handles.ZB,'Visible','off');
% set(handles.TB,'Visible','off');
% set(handles.addXYZT,'Visible','off');
% set(handles.pushbutton15,'Visible','off');
% --- Executes during object creation, after setting all properties.
function pushbutton15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% --- Executes during object creation, after setting all properties.
function XB_CreateFcn(hObject, eventdata, handles)
set(hObject,'Visible','off');
% hObject    handle to XB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% --- Executes during object creation, after setting all properties.
function YB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% --- Executes during object creation, after setting all properties.
function ZB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ZB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% --- Executes during object creation, after setting all properties.
function TB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% --- Executes during object creation, after setting all properties.
function show_CreateFcn(hObject, eventdata, handles)
% hObject    handle to show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Enable','off');
set(hObject,'Visible','off');
% --------------------------------------------------------------------
function ICON2_Callback(hObject, eventdata, handles)
% hObject    handle to ICON2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=imshow('持续说明.png');
f=h.Parent.Parent;
f.Name='关于软件的说明';
f.Resize='off';
f.Position=[100 100 400 400];
f.NumberTitle='off';
f.MenuBar='none'
shg;
% --------------------------------------------------------------------
function ICON4_Callback(hObject, eventdata, handles)
% hObject    handle to ICON4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% if password()==1;
set(handles.uibuttongroup4,'Visible','on');
set(handles.uibuttongroup5,'Visible','on');
set(handles.isOut,'Visible','on');
set(handles.test,'Visible','on');
set(handles.remind,'Visible','on');
set(handles.is3D,'Visible','on');
set(handles.color,'Visible','on');
set(handles.iDrawType,'Visible','on');
% else
%     set(handles.remind,'String','密码错误！');
%     myicon = imread('tutu.jpg');
%     h=msgbox('请关注微信公众号“tutongdao”图通道回复“FBPW”获取最新密码','密码错误','custom',myicon);
% end
% --------------------------------------------------------------------
function ICON3_Callback(hObject, eventdata, handles)
% hObject    handle to ICON3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uibuttongroup4,'Visible','off');
set(handles.uibuttongroup5,'Visible','off');
set(handles.isOut,'Visible','on');
set(handles.test,'Visible','off');
set(handles.remind,'Visible','on');
set(handles.color,'Visible','off');
set(handles.iDrawType,'Visible','off');
set(handles.is3D,'Visible','off');
set(handles.name,'Visible','off');
% set(handles.tips_name,'Visible','off');
set(handles.result,'Visible','off');
% --- Executes during object creation, after setting all properties.
function ICON3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ICON3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% --------------------------------------------------------------------
function ICON4_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to ICON4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function uibuttongroup4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% --- Executes during object creation, after setting all properties.
function uibuttongroup5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% --- Executes during object creation, after setting all properties.
function test_CreateFcn(hObject, eventdata, handles)
% hObject    handle to test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','on');
% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------
function closeall_Callback(hObject, eventdata, handles)
% hObject    handle to closeall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;clc;
% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2
% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
iNumberVector=str2num(handles.iNumber.String);
axeslist = [];
for i=1:length(iNumberVector)
    axeslist = [axeslist;findobj('Type','axes','Parent',iNumberVector(i))];
end
for i = 1:length(axeslist)
    Axes3DView(axeslist(i));
end
% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
iNumberVector=str2num(handles.iNumber.String);
axeslist = [];
for i=1:length(iNumberVector)
    axeslist = [axeslist;findobj('Type','axes','Parent',iNumberVector(i))];
end
for i = 1:length(axeslist)
    set(axeslist(i),'View',[0 90]);
    axeslist(i).XLabel.Rotation=0;
    axeslist(i).YLabel.Rotation=90;
    axeslist(i).ZLabel.Rotation=0;
    axeslist(i).XLabel.HorizontalAlignment='center';
    axeslist(i).YLabel.HorizontalAlignment='center';
end
% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton7
% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function uibuttongroup9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function uibuttongroup6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% --- Executes during object creation, after setting all properties.
function expert_CreateFcn(hObject, eventdata, handles)
% hObject    handle to expert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% --- Executes during object creation, after setting all properties.
function FB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
Frame = get(hObject,'JavaFrame');
set(Frame,'FigureIcon',javax.swing.ImageIcon('tutu.png'));
% hObject.Units = 'characters';
% hObject.Position = [135.8182 -95.1034 75 50];
hObject.Name = 'FigureBest (Version 3.0)';
clc
disp('----------------------------------------')
disp('----------------------------------------')
disp('【软件说明】')
disp('* 开发者唯一指定的获取渠道是：微信公众号“图通道”')
disp('* 公众号后台回复“FBPW”可以获取”')
disp('* 其它渠道获取/使用的将追责！”')
disp('* 软著warning：请勿私自传播，后果自负！”')
disp('----------------------------------------')
disp('----------------------------------------')
%% 显示图片% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel2,'Visible','on');
set(handles.uipanel6,'Visible','off');
set(handles.uipanel6,'Visible','off');
% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel2,'Visible','off');
set(handles.uipanel6,'Visible','on');
set(handles.uipanel8,'Visible','off');
image(handles.axes14,imread('tutu.jpg'));
axis(handles.axes14,'off')
% --- Executes during object creation, after setting all properties.
function uipanel6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% --- Executes on button press in pushbutton39.
function pushbutton39_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(handles.remind,'String','更改配色中......');%
% iNumberVector=str2num(handles.iNumber.String);
% global iColor;%
% iColor=getappdata(handles.color,'Color');%
% for i=1:length(iNumberVector)
%     colorchange(iNumberVector(i),iColor,iColor)
% end
function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double
set(hObject,'String','这里是FigureBest的微调与扩展功能')
% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','这里是FigureBest的扩展功能，使用前需看介绍')
% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton11
% --- Executes on button press in pushbutton42.
function pushbutton42_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton43.
function pushbutton43_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)% --- Executes on button press in pushbutton49.
function pushbutton49_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function pushbutton39_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% --- Executes on button press in pushbutton54.
function pushbutton54_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
iNumberVector=str2num(handles.iNumber.String);
lines = [];
for i = 1:length(iNumberVector)
    lines = [lines;findobj(iNumberVector(i),'Type','line')];
end
for i =1:length(lines)
    lines(i).Color = 'k';
end
% --- Executes on button press in pushbutton55.
function pushbutton55_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
iNumberVector=str2num(handles.iNumber.String);
lines = [];
for i = 1:length(iNumberVector)
    lines = [lines;findobj(iNumberVector(i),'Type','line')];
end
for i =1:length(lines)
    lines(i).Marker = 'none';
end
% --- Executes on button press in pushbutton56.
function pushbutton56_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
iNumberVector=str2num(handles.iNumber.String);
lines = [];
for i = 1:length(iNumberVector)
    lines = [lines;findobj(iNumberVector(i),'Type','line')];
end
for i =1:length(lines)
    lines(i).LineStyle = '-';
end
% --- Executes on button press in pushbutton58.
function pushbutton58_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
iNumberVector=str2num(handles.iNumber.String);
lines = [];
for i = 1:length(iNumberVector)
    lines = [lines;findobj(iNumberVector(i),'Type','line')];
end

for i =1:length(lines)
    lines(i).LineStyle = '--';
end
% --- Executes on button press in pushbutton59.
function pushbutton59_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.remind,'String',{'正在设置4:3'});
iNumberVector=str2num(handles.iNumber.String);
for i=1:length(iNumberVector)
    handleMyFigure=findall(groot,'Type','figure','Number',iNumberVector(i))
    handleMyFigure.Name='图图的绘图格式-4:3';
    handleMyFigure.Units='centimeters';     %改为厘米为单位
    %设置图片的大小，双栏选择[10, 10, 9, 6.75]cm，[相对位置 宽度高度]
    handleMyFigure.Position=[1, 1, 20, 15];
    handleMyFigure.Resize='off';
    handleMyFigure.Color='w';               %将图形背景设置为白色
    %打印属性 和图片属性相仿
    handleMyFigure.PaperUnits='centimeters';
    handleMyFigure.PaperPosition=[1, 1, 20, 15];
    handleMyFigure.InvertHardcopy='off';%保存图像坐标背景色
    Frame = get(handleMyFigure,'JavaFrame');
    set(Frame,'FigureIcon',javax.swing.ImageIcon('tutu.png'));
end
set(handles.remind,'String',{'4:3设置完成，图片已规范化！'});
shg
% --- Executes on button press in pushbutton60.
function pushbutton60_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.remind,'String',{'正在设置16:9'});
iNumberVector=str2num(handles.iNumber.String);
for i=1:length(iNumberVector)
    handleMyFigure=findall(groot,'Type','figure','Number',iNumberVector(i))
    handleMyFigure.Name='图图的绘图格式-16:9';
    handleMyFigure.Units='centimeters';     %改为厘米为单位
    %设置图片的大小，双栏选择[10, 10, 9, 6.75]cm，[相对位置 宽度高度]
    handleMyFigure.Position=[1, 1, 16*1.5, 9*1.5];
    handleMyFigure.Resize='off';
    handleMyFigure.Color='w';               %将图形背景设置为白色
    %打印属性 和图片属性相仿
    handleMyFigure.PaperUnits='centimeters';
    handleMyFigure.PaperPosition=[1, 1, 16*1.5, 9*1.5];
    handleMyFigure.InvertHardcopy='off';%保存图像坐标背景色
    Frame = get(handleMyFigure,'JavaFrame');
    set(Frame,'FigureIcon',javax.swing.ImageIcon('tutu.png'));
end
set(handles.remind,'String',{'16:8设置完成，图片已规范化！'});
shg
% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton12
% --- Executes on button press in pushbutton61.
function pushbutton61_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
path = [pwd '\extend\tuzoom'];
addpath(path);
iNumberVector=str2num(handles.iNumber.String);
for i = 1:length(iNumberVector)
    zoominout(iNumberVector(i));
end
% --- Executes on button press in pushbutton62.
function pushbutton62_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
iNumberVector=str2num(handles.iNumber.String);
for i = 1:length(iNumberVector)
    axesfillfigure(iNumberVector(i))
end
% --- Executes on button press in pushbutton63.
function pushbutton63_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldpath = pwd;
newpath = [pwd '\extend'];
addpath(newpath);
ax = gca;
tempXLim = ax.XLim;
tempYLim = ax.YLim;
tempPos = ax.Position;
p0 = ginput(1);
p1 = ginput(1);
color = uisetcolor;
drawArrow(p0,p1,color);
ax = gca;
ax.XLim = tempXLim;
ax.YLim = tempYLim;
ax.Position = tempPos ;
% --- Executes on button press in pushbutton64.
function pushbutton64_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldpath = pwd;
newpath = [pwd '\extend'];
addpath(newpath);
global cplotPara
STR = ['cplot(' cplotPara ')'];
clc
disp('请在命令行窗口执行下列命令 : ')
disp('----------------------------')
disp(['>>figure;'  STR])
disp('----------------------------')
set(handles.edit20,'String','还差一步!请根据命令行窗口的内容完成最后的绘制！')
shg
function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit27 as text
%        str2double(get(hObject,'String')) returns contents of edit27 as a double
global cplotPara
cplotPara = hObject.String;
% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on key press with focus on edit27 and none of its controls.
function edit27_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton65.
function pushbutton65_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbarPara
sbarPara = hObject.String;
function edit28_Callback(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit28 as text
%        str2double(get(hObject,'String')) returns contents of edit28 as a double
global sbarPara
sbarPara = hObject.String;
% --- Executes during object creation, after setting all properties.
function edit28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in pushbutton66.
function pushbutton66_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldpath = pwd;
newpath = [pwd '\extend']
addpath(newpath);
global sbarPara
eval(['sbar(' sbarPara ')'])
shg
% --- Executes on button press in pushbutton67.
function pushbutton67_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton67 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('https://www.bilibili.com/video/BV1Dp4y1W7DX')
% --- Executes on button press in pushbutton68.
function pushbutton68_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton68 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton69.
function pushbutton69_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton69 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% cd 'C:\FigureBest (Version 3.0)'
mkdir([pwd '\Results']);
addpath([pwd '\extend\autoPPT']);
global templatename;
global isOpen;
set(handles.edit20,'String','请在命令行窗口继续操作！');
temp1  = get(handles.edit20,'BackgroundColor');
temp2  = get(handles.edit20,'ForegroundColor');
set(handles.edit20,'BackgroundColor','r');
set(handles.edit20,'ForegroundColor','w');
pptgen
set(handles.edit20,'String','导出PPT已完成！');
set(handles.edit20,'BackgroundColor',temp1);
set(handles.edit20,'ForegroundColor',temp2);
% --- Executes on selection change in popupmenu9.
function popupmenu9_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu9
global templatename
switch hObject.Value
    case 1
        templatename = 'blue_16_9.pptx';
    case 2
        templatename = 'blue_4_3.pptx';
    case 3
        templatename = 'sjtu_red.pptx';
end
% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global templatename
templatename = 'blue_16_9.pptx';
% --- Executes on button press in pushbutton72.
function pushbutton72_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in radiobutton14.
function radiobutton14_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton14
global isOpen;
if hObject.Value == 0
    isOpen = 0;
else
    isOpen = 2;
end% --- Executes during object creation, after setting all properties.
function radiobutton14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global isOpen;isOpen = 0;
% --- Executes on button press in pushbutton74.
function pushbutton74_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('https://www.bilibili.com/video/BV12v411B7rL')
% --- Executes on button press in pushbutton75.
function pushbutton75_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton75 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('https://www.bilibili.com/video/BV13h41127j7')
% --- Executes on button press in pushbutton77.
function pushbutton77_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('https://www.bilibili.com/video/BV13h41127j7');
% --- Executes on button press in pushbutton88.
function pushbutton88_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton87.
function pushbutton87_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton86.
function pushbutton86_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton85.
function pushbutton85_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function edit33_Callback(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit33 as text
%        str2double(get(hObject,'String')) returns contents of edit33 as a double
% --- Executes during object creation, after setting all properties.
function edit33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit34_Callback(hObject, eventdata, handles)
% hObject    handle to edit34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit34 as text
%        str2double(get(hObject,'String')) returns contents of edit34 as a double
% --- Executes during object creation, after setting all properties.
function edit34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in pushbutton78.
function pushbutton78_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton78 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function edit35_Callback(hObject, eventdata, handles)
% hObject    handle to edit35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit35 as text
%        str2double(get(hObject,'String')) returns contents of edit35 as a double
% --- Executes during object creation, after setting all properties.
function edit35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in pushbutton79.
function pushbutton79_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton80.
function pushbutton80_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton80 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton81.
function pushbutton81_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on selection change in popupmenu11.
function popupmenu11_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu11 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu11
% --- Executes during object creation, after setting all properties.
function popupmenu11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in radiobutton15.
function radiobutton15_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton15
% --- Executes on button press in pushbutton82.
function pushbutton82_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel2,'Visible','off');
set(handles.uipanel6,'Visible','off');
set(handles.uipanel8,'Visible','on');
image(handles.axes15,imread('explan.png'));
axis(handles.axes15,'off')
image(handles.axes16,imread('sug.png'));
axis(handles.axes16,'off')
% --- Executes on button press in pushbutton90.
function pushbutton90_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('https://www.bilibili.com/video/BV13h41127j7');
% --- Executes during object creation, after setting all properties.
function pushbutton90_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% --- Executes on button press in pushbutton92.
function pushbutton92_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton93.
function pushbutton93_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function pushbutton93_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','on')
% --- Executes on button press in pushbutton94.
function pushbutton94_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('https://space.bilibili.com/223755925/dynamic','-new','-notoolbar')
% --- Executes during object creation, after setting all properties.
function pushbutton94_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% --- Executes on button press in pushbutton95.
function pushbutton95_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton96.
function pushbutton96_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton96 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function axes9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes9
% --- Executes during object creation, after setting all properties.
function axes10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes10
% --- Executes during object creation, after setting all properties.
function axes7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes7
image(hObject,imread('explan.png'));
axis(hObject,'off')
% --- Executes during object creation, after setting all properties.
function axes8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes8
image(hObject,imread('sug.png'));
axis(hObject,'off')
% --- Executes during object creation, after setting all properties.
function axes11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes11
% --- Executes during object creation, after setting all properties.
function axes12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes12
image(hObject,imread('explan.png'));
axis(hObject,'off')
% --- Executes during object creation, after setting all properties.
function axes13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes13
image(hObject,imread('sug.png'));
axis(hObject,'off')
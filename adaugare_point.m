function varargout = adaugare_point(varargin)
% ADAUGARE_POINT MATLAB code for adaugare_point.fig
%      ADAUGARE_POINT, by itself, creates a new ADAUGARE_POINT or raises the existing
%      singleton*.
%
%      H = ADAUGARE_POINT returns the handle to a new ADAUGARE_POINT or the handle to
%      the existing singleton*.
%
%      ADAUGARE_POINT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADAUGARE_POINT.M with the given input arguments.
%
%      ADAUGARE_POINT('Property','Value',...) creates a new ADAUGARE_POINT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before adaugare_point_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to adaugare_point_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help adaugare_point

% Last Modified by GUIDE v2.5 18-Feb-2013 18:10:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @adaugare_point_OpeningFcn, ...
                   'gui_OutputFcn',  @adaugare_point_OutputFcn, ...
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


% --- Executes just before adaugare_point is made visible.
function adaugare_point_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to adaugare_point (see VARARGIN)

% Choose default command line output for adaugare_point
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes adaugare_point wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global h;

% --- Outputs from this function are returned to the command line.
function varargout = adaugare_point_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% handles
% hObject
% Hint: place code in OpeningFcn to populate axes1


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h;
h = gca
handles.output = hObject

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles
% findall(handles.axes1,'type','axes')
S.fh = figure('units','pixels',...
    'position',[400 400 400 150],...
    'menubar','none',...
    'numbertitle','on',...
    'name','Lungime axe',...
    'resize','off');
S.ed(1) = uicontrol('style','edit',...
    'unit','pix',...
    'position',[10 80 70 30],...
    'string','0');
S.ed(2) = uicontrol('style','edit',...
    'unit','pix',...
    'position',[110 80 70 30],...
    'string','0');
S.tx(1) = uicontrol('style','text',...
    'unit','pix',...
    'position',[10 120 80 30],...
    'string','X  ',...
    'fontsize',16);
S.tx(2) = uicontrol('style','text',...
    'unit','pix',...
    'position',[105 120 80 30],...
    'string','Y  ',...
    'fontsize',16);
S.pb = uicontrol('style','pushbutton',...
    'units','pix',...
    'position',[280 20 80 30],...
    'string','plot',...
    'callback',{@pb_call,S});
% S.pb = uicontrol('style','pushbutton',...
%     'units','pix',...
%     'position',[180 20 80 30],...
%     'string','take coord',...
%     'callback',{@pb_call2,S});
function [] = pb_call(varargin)
% Callback for pushbutton

S = varargin{3};  % Get the structure.
N = str2double(get(S.ed(1:2),'string'));% The numbers to operate on.
world_dim=[0; 7;0 ;7]
x=N(1);
y=N(2);
 x_max=7;
 y_max=7;
 H = gca
 get(gcf,'CurrentAxes')
 d=guidata(h)
 global h;
    axes(h);
findall(handles.axes1,'type','axes')
set(handles.axes1,'Parent', axes_handle)
axis([0,x_max,0,y_max]);
title('Axes 1');
plot(x,y,'.k')

%objects{i}(:,j)=[x;y];


% --- Executes during object creation, after setting all properties.

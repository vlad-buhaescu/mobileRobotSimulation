function varargout = ask_start_stop1(varargin)
% ASK_START_STOP1 MATLAB code for ask_start_stop1.fig
%      ASK_START_STOP1, by itself, creates a new ASK_START_STOP1 or raises the existing
%      singleton*.
%
%      H = ASK_START_STOP1 returns the handle to a new ASK_START_STOP1 or the handle to
%      the existing singleton*.
%
%      ASK_START_STOP1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASK_START_STOP1.M with the given input arguments.
%
%      ASK_START_STOP1('Property','Value',...) creates a new ASK_START_STOP1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ask_start_stop1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ask_start_stop1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ask_start_stop1

% Last Modified by GUIDE v2.5 01-Jun-2013 21:44:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ask_start_stop1_OpeningFcn, ...
                   'gui_OutputFcn',  @ask_start_stop1_OutputFcn, ...
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


% --- Executes just before ask_start_stop1 is made visible.
function ask_start_stop1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ask_start_stop1 (see VARARGIN)

% Choose default command line output for ask_start_stop1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ask_start_stop1 wait for user response (see UIRESUME)
% uiwait(handles.Intrebare);


% --- Outputs from this function are returned to the command line.
function varargout = ask_start_stop1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radio1.
function radio1_Callback(hObject, eventdata, handles)
% hObject    handle to radio1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio1
if (get(hObject,'Value') == get(hObject,'Max'))
	% Radio button is selected-take appropriate action
   
   set(handles.radio2,'Enable','off');
   value1= 'mouse';
   setappdata(0,'some_variable1', value1);
else
    setappdata(0,'some_variable1', 'nimic');
    
end
close;
% --- Executes on button press in radio2.
function radio2_Callback(hObject, eventdata, handles)
% hObject    handle to radio2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio2
if (get(hObject,'Value') == get(hObject,'Max'))
	% Radio button is selected-take appropriate action
   
   set(handles.radio2,'Enable','off');
   value1= 'keyboard';
   setappdata(0,'some_variable1', value1);
else
    setappdata(0,'some_variable1', 'nimic');
 
end
 close; 

% --- Executes during object deletion, before destroying properties.
function Intrebare_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to Intrebare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 

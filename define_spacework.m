function varargout = define_spacework(varargin)
% DEFINE_SPACEWORK MATLAB code for define_spacework.fig
%      DEFINE_SPACEWORK, by itself, creates a new DEFINE_SPACEWORK or raises the existing
%      singleton*.
%
%      H = DEFINE_SPACEWORK returns the handle to a new DEFINE_SPACEWORK or the handle to
%      the existing singleton*.
%
%      DEFINE_SPACEWORK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEFINE_SPACEWORK.M with the given input arguments.
%
%      DEFINE_SPACEWORK('Property','Value',...) creates a new DEFINE_SPACEWORK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before define_spacework_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to define_spacework_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help define_spacework

% Last Modified by GUIDE v2.5 20-Feb-2013 17:22:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @define_spacework_OpeningFcn, ...
                   'gui_OutputFcn',  @define_spacework_OutputFcn, ...
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


% --- Executes just before define_spacework is made visible.
function define_spacework_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to define_spacework (see VARARGIN)

% Choose default command line output for define_spacework
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes define_spacework wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = define_spacework_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ed1_Callback(hObject, eventdata, handles)
% hObject    handle to ed1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed1 as text
%        str2double(get(hObject,'String')) returns contents of ed1 as a double


% --- Executes during object creation, after setting all properties.
function ed1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed2_Callback(hObject, eventdata, handles)
% hObject    handle to ed2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'String') returns contents of ed2 as text
%        str2double(get(hObject,'String')) returns contents of ed2 as a double
 
handles.output = hObject;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function ed2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed3_Callback(hObject, eventdata, handles)
% hObject    handle to ed3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  %get(hObject,'String') returns contents of ed3 as text
 
%returns contents of ed3 as a double
handles.output = hObject;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function ed3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% defineSpacework=handles
%  handles.val=156 ;
  value1= get(handles.ed1,'String') ;
  value2= get(handles.ed2,'String') ;
  value3= get(handles.ed3,'String') ;
  setappdata(0,'some_var1', value1);
setappdata(0,'some_var2', value2);
setappdata(0,'some_var3', value3);
setappdata(0,'some_var4', 'start');
delete(handles.figure1)

 
 
 


 

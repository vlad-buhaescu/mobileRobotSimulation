

function varargout = figure1(varargin)
% FIGURE1 MATLAB code for figure1.fig
%      FIGURE1, by itself, creates a new FIGURE1 or raises the existing
%      singleton*.
%
%      H = FIGURE1 returns the handle to a new FIGURE1 or the handle to
%      the existing singleton*.
%
%      FIGURE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIGURE1.M with the given input arguments.
%
%      FIGURE1('Property','Value',...) creates a new FIGURE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before figure1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to figure1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help figure1

% Last Modified by GUIDE v2.5 04-Jun-2013 11:11:34
 
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @figure1_OpeningFcn, ...
    'gui_OutputFcn',  @figure1_OutputFcn, ...
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
function create_workspace_CreateFcn(hObject, eventdata, handles)
% hObject    handle to create_workspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% set(handles.axes1,'reset');

function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
function figure1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to figure1 (see VARARGIN)


handles.cnt=0;

handles.output = hObject;
set(hObject,'WindowStyle','modal');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes figure1 wait for user response (see UIRESUME)
uiwait(handles.figure1);

% --- Executes on button press in Take_Coord.
function Take_Coord_Callback(hObject, eventdata, handles)
% hObject    handle to Take_Coord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

xmax=str2double(handles.x_max);
ymax=str2double(handles.y_max);

if( handles.obs_no==0)
    m2=warn_mesage2;
    set(handles.textX,'Visible','off');
    set(handles.textY,'Visible','off');
    set(handles.X_point,'Visible','off');
    set(handles.Y_point,'Visible','off');
    set(handles.Take_Coord,'Visible','off');
    set(handles.final,'Visible','off');
end


set(handles.list1,'Visible','on');
set(handles.list2,'Visible','on');
set(handles.afis_coord,'Visible','on');
ok1=0;
%READ THE CURRENT X POINT
handles.x_current=str2double(get(handles.X_point,'String'));
%READ THE CURRENT Y POINT
handles.y_current=str2double(get(handles.Y_point,'String'));
if(ok1==0)
    if(handles.x_current>xmax || handles.y_current>ymax || handles.x_current<0 || handles.y_current<0 )
        ok1=0;
        warning_depasire;
        waitfor(warning_depasire);
        handles.x_current=str2double(get(handles.X_point,'String'));
        %READ THE CURRENT Y POINT
        handles.y_current=str2double(get(handles.Y_point,'String'));
    else
        ok1=1;
        %%%----------PRINT THE CURRENT COORDINATES IN 2 LISTBOOXES-----------------
        oldstr = get(handles.list1,'string'); % The string as it is now.
        addstr = { get(handles.X_point,'String')}; % The string to add to the stack.
        if(strcmp(oldstr,' '))
            set(handles.list1,'str',{addstr{:} });
        else
            set(handles.list1,'str',{addstr{:},oldstr{:}});
        end
        
        
        %ADDING THE POINT TO THE LISTBOX
        oldstr = get(handles.list2,'string'); % The string as it is now.
        addstr = { get(handles.Y_point,'String')}; % The string to add to the stack.
        
        if(strcmp(oldstr,' '))
            set(handles.list2,'str',{addstr{:} });
        else
            set(handles.list2,'str',{addstr{:},oldstr{:}});
        end
        %-------CREATING 2 VECTORS WITH POINTS FOR CURRENT OBSTACLE----------------
        handles.x=[handles.x handles.x_current];
        handles.y=[handles.y handles.y_current];
        %-------FIRST ELEMENT WILL BE ALWAYS 0 AND I'M DELETING IT-----------------
        if(handles.x(1)==0)
            for i=1:length(handles.x)-1
                handles.x(i)=handles.x(i+1);
            end
            
            for i=1:length(handles.y)-1
                handles.y(i)=handles.y(i+1);
            end
        end
        
    end
end

xmax=str2double(handles.x_max);
ymax=str2double(handles.y_max);

title('Axes 1');
% grid(handles.axes1,'minor');
axis([0,xmax,0,ymax]);
plot(handles.x_current,handles.y_current,'.k');

handles.output = hObject;
% Update handles structure
guidata(hObject, handles);


function def_obj_Callback(hObject, eventdata, handles)

openfig('define_spacework.fig');

h=define_spacework; %deschide GUI-define_workspace
waitfor(h);%asteapta ca sa termin de introdus date in define_workspace

handles.x_max = getappdata(0,'some_var1');
handles.y_max = getappdata(0,'some_var2');
handles.obs_no = getappdata(0,'some_var3');
handles.output = hObject;
handles.obs_no=str2double(handles.obs_no);
handles.var=handles.obs_no;

set(handles.togglebutton2,'Enable','on');

%this return is for the situation when the user did not defined the
%workspace yet
%  return
set(handles.create_workspace,'Enable','on');
set(handles.Reset,'Enable','on');

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in hints.
function hints_Callback(hObject, eventdata, handles)
% hObject    handle to hints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% fa functie
ind=hint;


% --- Executes on button press in create_workspace.\\\\\\\\\\\
function create_workspace_Callback(hObject, eventdata, handles)
cla(handles.axes1);
getappdata(0,'some_var4');
if(strcmp(getappdata(0,'some_var4'),'start' ))
    handles.h1=0;
    hold on
    grid(handles.axes1,'minor');
    xmax=str2double(handles.x_max);
    ymax=str2double(handles.y_max);
    obs_no= handles.obs_no;
    title('Axes 1');
    
    if((get(handles.togglebutton2,'Value') == 1))
        %nou
        set(handles.textX,'Visible','on');
        set(handles.textY,'Visible','on');
        set(handles.X_point,'Visible','on');
        set(handles.Y_point,'Visible','on');
        set(handles.Take_Coord,'Visible','on');
        set(handles.final,'Visible','on');
        handles.Start_keyb=1;
        set(handles.textX,'Enable','on');
        set(handles.textY,'Enable','on');
        set(handles.X_point,'Enable','on');
        set(handles.Y_point,'Enable','on');
        set(handles.Take_Coord,'Enable','on');
        set(handles.final,'Enable','on');
        set(handles. togglebutton3,'Enable','off');
    else
        if((xmax~=0) && (ymax~=0))
            
            % world_dim=[0 x_max ;0 y_max ];
            axis([0,xmax,0,ymax]);
            grid(handles.axes1,'minor');
            %read obstacle's vertices
            for i=1:obs_no   %i = object number
                
                j=1; %j = no. of vertexes for current object
                but=1;
                %                 a=cellfun(@length,objects1);
                %                 try
                a=zeros(1,3);
                
                set(handles.textX,'Visible','off');
                set(handles.textY,'Visible','off');
                set(handles.X_point,'Visible','off');
                set(handles.Y_point,'Visible','off');
                set(handles.Take_Coord,'Visible','off');
                set(handles.final,'Visible','off');
                
                while  but==1
                    %                     [x,y,but]=ginput(1);
                    ok=0;
                    while ok==0
                        [x,y,but]=ginput(1);
                        ok=1;
                        if(x>xmax || y>ymax || x<0 || y<0)
                            ok=0;
                        end
                    end
                    
                    set(handles.list1,'Visible','on');
                    set(handles.list2,'Visible','on');
                    set(handles.afis_coord,'Visible','on');
                    oldstr1 = get(handles.list1,'String'); % The string as it is now.
                    addstr1 = { num2str(x)}; % The string to add to the stack.
                    if(strcmp(oldstr1,' '))
                        set(handles.list1,'str',{addstr1{:}  });
                    else
                        set(handles.list1,'str',{addstr1{:},oldstr1{:}});
                    end
                    
                    oldstr2 = get(handles.list2,'String'); % The string as it is now.
                    addstr2 = { num2str(y)}; % The string to add to the stack.
                    if(strcmp(oldstr2,' '))
                        set(handles.list2,'str',{addstr2{:} });
                    else
                        set(handles.list2,'str',{addstr2{:},oldstr2{:}});
                    end
                    plot(x,y,'.k');
                    objects1{i}(:,j)=[x;y];
                    j=j+1;
                    %                     a=cellfun(@length,objects1)
                end
                
                k=convhull(objects1{i}(1,:),objects1{i}(2,:));
                objects1{i}=objects1{i}(:,k(1:length(k)-1));
                %                 objects1{i}
                %                 cell2mat(objects1{i})
                
                
                pause(0.3)
                fill(objects1{i}(1,:),objects1{i}(2,:),'k','FaceAlpha',0.5); %or functia patch (similara cu fill)
                %                 catch
                %                  at_least_2points
                %                  waitfor(at_least_2points);
                %                 end
                oldstr = get(handles.list1,'String'); % The string as it is now.
                addstr = { 'New' }; % The string to add to the stack.
                oldstr2 = get(handles.list2,'String'); % The string as it is now.
                addstr2 = { 'New'}; % The string to add to the stack.
                if(i~=obs_no )
                    set(handles.list1,'str',{addstr{:},oldstr{:}});
                    set(handles.list2,'str',{addstr2{:},oldstr2{:}});
                end
            end
        end
        
        handles.obj=objects1;
        %          celldisp(objects1);
        %          handles.obj;
        set(handles.textX,'Enable','off');
        set(handles.textY,'Enable','off');
        set(handles.X_point,'Enable','off');
        set(handles.Y_point,'Enable','off');
        set(handles.Take_Coord,'Enable','off');
        set(handles.final,'Enable','off');
        
    end
else
    f = openfig('warn_def_work.fig');
    
end
if(get(handles.togglebutton2,'Value') ~= 1)
    set(handles. togglebutton3,'Enable','on');
end
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all


% --- Executes during object deletion, before destroying properties.
function hints_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to hints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)







function X_point_Callback(hObject, eventdata, handles)

function X_point_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_point_Callback(hObject, eventdata, handles)

function Y_point_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function final_Callback(hObject, eventdata, handles)

handles.fin=1;

set(handles.list1, 'String', ' ');
set(handles.list2, 'String', ' ');

if( handles.obs_no~=0)
    if(( (length(handles.x))>=3 && (length(handles.y))>=3))
        
        objects2 =[handles.x ; handles.y];
        
        plot(handles.x , handles.y ,'.k');
        try
            k=convhull(objects2 (1,:),objects2 (2,:));
            objects2 = objects2 (:,k(1:length(k)-1));
            fill(objects2 (1,:),objects2(2,:),'k','FaceAlpha',0.5);
            handles.obs_no=handles.obs_no-1;
            
            handles.x=[];
            handles.y=[];
        catch
            
            
        end
    else
        m1=warn_mesage;
    end
else
    m2=warn_mesage2;
end

handles.obj{handles.var-handles.obs_no} =objects2;
if(handles.obs_no==0)
set(handles.togglebutton3,'Enable','on');
end
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);





function list1_Callback(hObject, eventdata, handles)

function list1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function list2_Callback(hObject, eventdata, handles)

function list2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function uipanel1_CreateFcn(hObject, eventdata, handles)

function Trapezoidal_Callback(hObject, eventdata, handles)

[C,adj,mid_X,mid_Y]=trapezoidal_decomposition(handles.obj,str2double(handles.x_max),str2double(handles.y_max));

set(handles.refresh_dec,'Enable','on');
%clear current axis
cla;

modify_cost(C,adj,mid_X,mid_Y,1);

modify_cost(C,adj,mid_X,mid_Y,2);

modify_cost(C,adj,mid_X,mid_Y,3);

hold on;
xmax=str2double(handles.x_max);

set(handles.Triangular,'Value',0);
set(handles.Rectangular,'Value',0);
set(handles.Polytopal,'Value',0);

handles.C=C;
handles.adj=adj;
handles.mid_X=mid_X;
handles.mid_Y=mid_Y;

if(get(handles.togglebutton3,'Value') ~= 1)
    
    plot_environment_simplu(handles.obj,str2double(handles.x_max),str2double(handles.y_max),C,adj,mid_X,mid_Y);
    handles.current_axes=gca;
   
else
    
    plot_environment(handles.axes1,handles.obj,str2double(handles.x_max),str2double(handles.y_max),C,adj,mid_X,mid_Y);
    handles.current_axes=gca;
end

set(handles.start_stop,'Enable','on');
handles.flag_dec='Trapezoidal';
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



function Triangular_Callback(hObject, eventdata, handles)
handles.flag_dec='Triangular';
[C,adj,mid_X,mid_Y]=triangular_decomposition(handles.obj,str2double(handles.x_max),str2double(handles.y_max));
%clear current axis
cla

set(handles.refresh_dec,'Enable','on');

if(get(handles.togglebutton3,'Value') ~= 1)
    
    plot_environment_simplu(handles.obj,str2double(handles.x_max),str2double(handles.y_max),C,adj,mid_X,mid_Y);
    handles.current_axes=gca;
     
else
    plot_environment(handles.axes1,handles.obj,str2double(handles.x_max),str2double(handles.y_max),C,adj,mid_X,mid_Y);
     handles.current_axes=gca; 
end


handles.C=C;
handles.adj=adj;
handles.mid_X=mid_X;
handles.mid_Y=mid_Y;

set(handles.Rectangular,'Value',0);
set(handles.Polytopal,'Value',0);
set(handles.Trapezoidal,'Value',0);
set(handles.start_stop,'Enable','on');

handles.output = hObject;
% Update handles structure
guidata(hObject, handles);



function Rectangular_Callback(hObject, eventdata, handles)
handles.flag_dec='Rectangular';
[C,adj,mid_X,mid_Y]=rectangular_decomposition(handles.obj,str2double(handles.x_max),str2double(handles.y_max),50);
%clear current axis
cla
handles.C=C;
handles.adj=adj;
handles.mid_X=mid_X;
handles.mid_Y=mid_Y;



set(handles.refresh_dec,'Enable','on');
hold on;

if(get(handles.togglebutton3,'Value') ~= 1)
    
    plot_environment_simplu(handles.obj,str2double(handles.x_max),str2double(handles.y_max),C,adj,mid_X,mid_Y);
    handles.current_axes=gca;
    
else
    plot_environment(handles.axes1,handles.obj,str2double(handles.x_max),str2double(handles.y_max),C,adj,mid_X,mid_Y);
      handles.current_axes=gca;
end


set(handles.Polytopal,'Value',0);
set(handles.Trapezoidal,'Value',0);
set(handles.Triangular,'Value',0);
set(handles.start_stop,'Enable','on');
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


function Polytopal_Callback(hObject, eventdata, handles)
handles.flag_dec='Polytopal';
[C,adj,mid_X,mid_Y]=polytopal_decomposition(handles.obj,str2double(handles.x_max),str2double(handles.y_max));
%clear current axis
handles.C=C;
handles.adj=adj;
handles.mid_X=mid_X;
handles.mid_Y=mid_Y;
cla;

set(handles.refresh_dec,'Enable','on');

if(get(handles.togglebutton3,'Value') ~= 1)
    
    plot_environment_simplu(handles.obj,str2double(handles.x_max),str2double(handles.y_max),C,adj,mid_X,mid_Y);
    handles.current_axes=gca;
     
else
    plot_environment(handles.axes1,handles.obj,str2double(handles.x_max),str2double(handles.y_max),C,adj,mid_X,mid_Y);
      handles.current_axes=gca;
end

set(handles.start_stop,'Enable','on');
set(handles.Rectangular,'Value',0);
set(handles.Trapezoidal,'Value',0);
set(handles.Triangular,'Value',0);
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);



function figure1_OutputFcn(hObject, eventdata, handles)



% --- Executes on button press in this_wind.
function this_wind_Callback(hObject, eventdata, handles)
% hObject    handle to this_wind (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(hObject,'Value') == get(hObject,'Max'))
    
    set(handles.other_wind,'Enable','off');
else
    set(handles.other_wind,'Enable','on');
end
set(handles.Trapezoidal,'Enable','on');
set(handles.Triangular,'Enable','on');
set(handles.Polytopal,'Enable','on');
set(handles.Rectangular,'Enable','on');
% Hint: get(hObject,'Value') returns toggle state of this_wind


% --- Executes on button press in other_wind.
function other_wind_Callback(hObject, eventdata, handles)
% hObject    handle to other_wind (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(hObject,'Value') == get(hObject,'Max'))
    set(handles.this_wind,'Enable','off');
else
    set(handles.this_wind,'Enable','on');
end
set(handles.Trapezoidal,'Enable','on');
set(handles.Triangular,'Enable','on');
set(handles.Polytopal,'Enable','on');
set(handles.Rectangular,'Enable','on');


% Hint: get(hObject,'Value') returns toggle state of other_wind


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
  cla(handles.axes1) ;
  
 hold on;
xmax=str2double(handles.x_max)
ymax=str2double(handles.y_max)
axes(handles.axes1);
axis([0,xmax,0,ymax]);
grid on;
% grid(handles.axes1,'minor');
 


function test_limita(hObject, eventdata, handles)
xmax=str2double(handles.x_max);
ymax=str2double(handles.y_max);
%    while(handles.start(1)<0 && handles.start(2)<0 && handles.stop(1)>xmax && handles.stop(2)>yamx)
handles.ok=0; %pentru a vedea daca valorile sunt bune
start_stop;
waitfor(start_stop);

while(handles.ok==0)
    try
        getappdata(0,'xstart');
        getappdata(0,'ystart');
        getappdata(0,'xstop');
        getappdata(0,'ystop');
        handles.start(1) = str2double(getappdata(0,'xstart'));
        rmappdata(0,'xstart');
        
        
        handles.start(2) = str2double(getappdata(0,'ystart'));
        rmappdata(0,'ystart');
        
        
        handles.stop(1) = str2double(getappdata(0,'xstop'));
        rmappdata(0,'xstop');
        
        
        handles.stop(2) = str2double(getappdata(0,'ystop'));
        
        rmappdata(0,'ystop');
    end
    if(handles.start(1)>xmax || handles.start(2)>ymax || handles.stop(1) >xmax || handles.stop(2)>ymax)
        
        handles.ok=0;
        warning_depasire;
        waitfor(warning_depasire);
    else
        handles.ok=1;
        return;
    end
    
    start_stop;
    waitfor(start_stop);
    
    
end
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

function start_stop_Callback(hObject, eventdata, handles)

%The program is trying to avoid posibility of insertion of more peers of
%start/stop points


%  a=isfield( handles, 'start')
%     if(a==1 )
%         refresh_dec_Callback(hObject, eventdata, handles);
%
%         switch handles.flag_dec
%             case 'Triangular'
%                 disp('Triangular');
%                 Rectangular_Callback(hObject, eventdata, handles);
%             case 'Polytopal'
%                 disp('Polytopal');
%                 Polytopal_Callback(hObject, eventdata, handles);
%             case 'Trapezoidal'
%                 disp('Trapezoidal');
%                 Trapezoidal_Callback(hObject, eventdata, handles);
%             case 'Rectangular'
%                 disp('Rectangular');
%                 Rectangular_Callback(hObject, eventdata, handles);
%
%         end
%     end
%

ask_start_stop1;
waitfor(ask_start_stop1);
xmax=str2double(handles.x_max);
ymax=str2double(handles.y_max);
%
% title('Axes 1');
% grid(handles.axes1,'minor');
% axis([0,xmax,0,ymax]);
d=getappdata(0,'some_variable1');
%
% disp('valoarea butonului');
% get(handles.togglebutton3,'Value')
try
    rmappdata(0,'some_variable1');
    
    if(strcmp(d,'mouse')==1)
        
        if(get(handles.togglebutton3,'Value') == 1)
            disp('figure1');
            axes(handles.axes1);
            [x,y ]=ginput(1);
            plot( handles.axes1,x,y,'.k');
            handles.start=[x y];
            text(x-((2/100)*xmax ),y -((2/100)*ymax ),'START','HorizontalAlignment','center','Color','b','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
            [x,y ]=ginput(1);
            plot( handles.axes1,x,y,'.k');
            handles.stop=[x y];
            text(x+((2/100)*xmax ),y +((2/100)*ymax ),'STOP','HorizontalAlignment','center','Color','r','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
            
        else
            
            axes(handles.current_axes)
            [x,y ]=ginput(1);
            plot(  x,y,'.k');
            handles.start=[x y];
            text(x-((2/100)*xmax ),y -((2/100)*ymax ),'START','HorizontalAlignment','center','Color','b','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
            [x,y ]=ginput(1);
            plot(  x,y,'.k');
            handles.stop=[x y];
            text(x+((2/100)*xmax ),y +((2/100)*ymax ),'STOP','HorizontalAlignment','center','Color','r','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
            
        end
        
    else
        
        if(strcmp(d,'keyboard')==1)
            %             handles.start=zeros(1,2);
            %             handles.stop=zeros(1,2);
            %pentru a vedea daca valorile sunt bune
            handles.ok=0;
            start_stop;
            waitfor(start_stop);
            
            while(handles.ok==0)
                try
                    getappdata(0,'xstart');
                    getappdata(0,'ystart');
                    getappdata(0,'xstop');
                    getappdata(0,'ystop');
                    handles.start(1) = str2double(getappdata(0,'xstart'));
                    rmappdata(0,'xstart');
                    
                    handles.start(2) = str2double(getappdata(0,'ystart'));
                    rmappdata(0,'ystart');
                    
                    handles.stop(1) = str2double(getappdata(0,'xstop'));
                    rmappdata(0,'xstop');
                    
                    handles.stop(2) = str2double(getappdata(0,'ystop'));
                    
                    rmappdata(0,'ystop');
                end
                if(handles.start(1)>xmax || handles.start(2)>ymax || handles.stop(1) >xmax || handles.stop(2)>ymax)
                    
                    handles.ok=0;
                    warning_depasire;
                    waitfor(warning_depasire);
                else
                    handles.ok=1;
                    break;
                end
                
                start_stop;
                waitfor(start_stop);
                
            end
            axes(handles.current_axes);
            
            plot(  handles.start(1),handles.start(2),'.k');
            text( handles.start(1)-((2/100)*xmax ),handles.start(2) -((2/100)*ymax ),'START','HorizontalAlignment','center','Color','b','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
            
            plot(  handles.stop(1),handles.stop(2),'.k');
            text( handles.stop(1)-((2/100)*xmax ),handles.stop(2) -((2/100)*ymax ),'STOP','HorizontalAlignment','center','Color','r','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
            
        end
    end
    
    % if(get(handles.togglebutton3,'Value')==1)
    %     plot(handles.axes1,handles.start(1),handles.start(2),'.k');
    %     text(handles.start(1)-((2/100)*xmax ),handles.start(2) -((2/100)*ymax ),'START','HorizontalAlignment','center','Color','b','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
    %
    %     plot(handles.axes1,handles.stop(1),handles.stop(2),'.k');
    %     text(handles.stop(1)-((2/100)*xmax ),handles.stop(2) -((2/100)*ymax ),'STOP','HorizontalAlignment','center','Color','r','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
    % else
    %     axes(handles.current_axes);
    %
    %     plot( handles.current_axes,handles.start(1),handles.start(2),'.k');
    %     text(handles.current_axes,handles.start(1)-((2/100)*xmax ),handles.start(2) -((2/100)*ymax ),'START','HorizontalAlignment','center','Color','b','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
    %
    %     plot(handles.current_axes, handles.stop(1),handles.stop(2),'.k');
    %     text(handles.current_axes,handles.stop(1)-((2/100)*xmax ),handles.stop(2) -((2/100)*ymax ),'STOP','HorizontalAlignment','center','Color','r','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
    %
    % end
    
    
    
    set(handles.create_workspace,'Enable','on');
    %     handles.obj{1}(1,:)
    % i de la 1 la nr de obiecte
    for i=1:handles.obs_no
        IN1=inpolygon(handles.start(1),handles.start(2),handles.obj{i}(1,:),handles.obj{i}(2,:));
        if(sum(IN1)~=0)
            
            warning_start_stop;
            waitfor( warning_start_stop);
            refresh_dec_Callback(hObject, eventdata, handles);
            %                             waitfor(  handles.axes1);
            
            %         plot(handles.axes1,handles.start(1),handles.start(2),'.k');
            %         text(handles.start(1)-((2/100)*xmax ),handles.start(2) -((2/100)*xmax ),'START','HorizontalAlignment','center','Color','b','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
            %
            %         plot(handles.axes1,handles.stop(1),handles.stop(2),'.k');
            %         text(handles.stop(1)-((2/100)*xmax ),handles.stop(2) -((2/100)*xmax ),'STOP','HorizontalAlignment','center','Color','r','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
            %         return;
            break;
        end
        IN2=inpolygon(handles.stop(1),handles.stop(2),handles.obj{i}(1,:),handles.obj{i}(2,:));
        if(sum(IN2)~=0)
            warning_start_stop;
            waitfor( warning_start_stop);
            refresh_dec_Callback(hObject, eventdata, handles);
            %
            %         plot(handles.axes1,handles.start(1),handles.start(2),'.k');
            %         text(handles.start(1)-((2/100)*xmax ),handles.start(2) -((2/100)*xmax ),'START','HorizontalAlignment','center','Color','b','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
            %
            %         plot(handles.axes1,handles.stop(1),handles.stop(2),'.k');
            %         text(handles.stop(1)-((2/100)*xmax ),handles.stop(2) -((2/100)*xmax ),'STOP','HorizontalAlignment','center','Color','r','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
            %         return;
            
            break;
        end
    end
end
d=0;
set(handles.type_of_cost,'Enable','on');
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



function refresh_Callback(hObject, eventdata, handles)

function refresh_dec_Callback(hObject, eventdata, handles)

cla;
xmax=str2double(handles.x_max);
ymax=str2double(handles.y_max);
axis([0,xmax,0,ymax]);
grid(handles.axes1,'minor');
% try
%     plot(handles.axes1,handles.start(1),handles.start(2),'.k');
%     text(handles.start(1)-((2/100)*xmax ),handles.start(2) -((2/100)*ymax ),'START','HorizontalAlignment','center','Color','b','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
%
%     plot(handles.axes1,handles.stop(1),handles.stop(2),'.k');
%     text(handles.stop(1)-((2/100)*xmax ),handles.stop(2) -((2/100)*ymax ),'STOP','HorizontalAlignment','center','Color','r','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');
% end
for i=1:length(cellfun(@length,handles.obj))
    fill(handles.obj{i} (1,:),handles.obj{i}(2,:),'k','FaceAlpha',0.5);
end



function find_traj_Callback(hObject, eventdata, handles)
set(handles.find_traj,'Enable','off');
% [path, cost] = find_path(handles.adj ,[handles.start(1) handles.start(2)],[handles.stop(1) handles.stop(2)] )
axes(handles.current_axes);
    
 persistent CNT
 
if isempty(CNT)
   CNT = 1;
else
    CNT = CNT + 1;
end
if CNT==7
    CNT=1;
end
colors=['b','g','r','c','m','y','k'];
l_type=['-','--'];
 
xmax=str2double(handles.x_max);
ymax=str2double(handles.y_max);

axes(handles.current_axes);
plot(handles.axes1,handles.start(1),handles.start(2),'.k');
text(handles.start(1)-((2/100)*xmax ),handles.start(2) -((2/100)*ymax ),'START','HorizontalAlignment','center','Color','b','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');

plot(handles.axes1,handles.stop(1),handles.stop(2),'.k');
text(handles.stop(1)-((2/100)*xmax ),handles.stop(2) -((2/100)*ymax ),'STOP','HorizontalAlignment','center','Color','r','FontSize',12,'FontWeight','bold','FontAngle','italic','FontName','TimesNewRoman');



handles.adj = modify_cost(handles.C,handles.adj,handles.mid_X,handles.mid_Y,handles.cost_type);

[trajectory, distance, path, cost_path]=find_trajectory(handles.C,handles.adj,handles.mid_X,handles.mid_Y,handles.start(1),handles.start(2),handles.stop(1),handles.stop(2) );

set(handles.traj_len,'String',num2str(cost_path));

set(handles.dist,'String',num2str(distance));

for i= length(path):-1:1
    oldstr1 = get(handles.cells,'String'); % The string as it is now.
    addstr1 = { num2str(path(i))}; % The string to add to the stack.
    if(strcmp(oldstr1,' '))
        set(handles.cells,'str',{addstr1{:}  });
    else
        set(handles.cells,'str',{addstr1{:},oldstr1{:}});
    end
end

oldstr = get(handles.cells,'String'); % The string as it is now.,
addstr = { 'New' }; % The string to add to the stack.
set(handles.cells,'str',{addstr{:},oldstr{:}});
 
for i=2:length(trajectory)
       
    line( [trajectory(1,i-1) trajectory(1,i )],[trajectory(2,i-1) trajectory(2,i)], 'Color',colors(CNT),'LineWidth',2, 'LineStyle',l_type(mod(CNT,2)+1) );
    pause(0.4);
end
set(handles.find_traj,'Enable','on'); 


function togglebutton2_Callback(hObject, eventdata, handles)


if(get(hObject,'Value')==1)
    set( handles.togglebutton2,'String','Keyboard definition');
    set(handles.hints,'Enable','on');
    set(handles.hints,'Visible','on');
    handles.x=0;
    handles.y=0;
    
else
    set(handles.hints,'Enable','off');
    
    handles.x=0;
    handles.y=0;
    set( handles.togglebutton2,'String','Mouse definition');
end

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in togglebutton3.
function togglebutton3_Callback(hObject, eventdata, handles)


if(get(hObject,'Value')==1)
    set( handles.togglebutton3,'String','This window');
    set(handles.refresh_dec,'Visible','on');
else
    
    set( handles.togglebutton3,'String','In figures');
    set(handles.refresh_dec,'Visible','off');
end

set(handles.Trapezoidal,'Enable','on');
set(handles.Triangular,'Enable','on');
set(handles.Polytopal,'Enable','on');
set(handles.Rectangular,'Enable','on');


% --- Executes on button press in type_of_cost.
function type_of_cost_Callback(hObject, eventdata, handles)
% hObject    handle to type_of_cost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=type_of_cost;
waitfor(h);%asteapta ca sa termin de introdus date in define_workspace

c= getappdata(0,'cost_type');
handles.cost_type=str2double(c);
set(handles.find_traj,'Enable','on');
handles.flag_dec=1;
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Executes on selection change in cells.
function cells_Callback(hObject, eventdata, handles)
% hObject    handle to cells (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cells contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cells


% --- Executes during object creation, after setting all properties.
function cells_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cells (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

 


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

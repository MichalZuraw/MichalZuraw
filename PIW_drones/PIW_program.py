@authors:
@Marcin Bochenek
@Michał Żurawka
import cv2
import pandas as pd
import tkinter as tk
from tkinter import *
from tkinter import filedialog
from tkinter import ttk
import tkinter.font as font
from tkinter import messagebox
from PIL import Image, ImageTk
from tktooltip import ToolTip
import imutils

global vid
global k
global klatka
global excel_path
global video_path
global z
global img_height
global img_width
#DANE TYMCZASOWE
video_path="C:/Users\Marcin\Desktop\PIW\part1.mp4"
excel_path="C:/Users\Marcin\Desktop\PIW\dane.csv"

k = 1
klatka = 1
z = 0

global img
#img = cv2.imread("img2.png")
img = Image.open("img2.png")
#img_height, img_width, _ = img.shape
img_height, img_width= img.size

def convertImage():
    global img
    img = img.convert("RGBA")
    datas = img.getdata()
    newData = []
    for item in datas:
        if item[0] == 255 and item[1] == 255 and item[2] == 255:
            newData.append((255, 255, 255, 0))
        else:
            newData.append(item)

    img.putdata(newData)
    img = img.convert('RGB')

def openfile1():
    global video_path
    global ent1
    global z
    ent1.delete(0,'end')
    video_path=filedialog.askopenfilename(filetypes=(("mp4 file", "*.mp4"),("All files", "*.*"),))
    ent1.insert(END,video_path)
    z=1

def openfile2():
    global excel_path
    global ent2
    global z
    ent2.delete(0,'end')
    excel_path = filedialog.askopenfilename(filetypes=(("csv file", "*.csv"),("All files", "*.*"),))
    ent2.insert(END, excel_path)
    z=1

def obliczanie(klatka, k, frame_resized):
    global compascol
    global bateriacol
    global wysokosccol

    compas = compascol[k]
    bateria = bateriacol[k]
    distance = wysokosccol[k]

    if klatka % 3 == 0:
        k = k + 1
    result = (compas, bateria, distance, k, frame_resized)
    return result

def addcompass(frame, compas):
    global img
    global img_height
    global img_width
    a =round((width-0)/5)
    b =round((height-0)/10)
    kolor = (255, 0, 0)
    cut_string = compas.split(',')
    rotate_image = img.rotate(int(cut_string[0]))
    #rotate_image = imutils.rotate(img, int(cut_string[0]))
    #frame[2*a:2*a+img_height, 1*a:1*a+img_width] = rotate_image
    frame[2 * a:2 * a + img_width, 1 * a:1 * a + img_height] = rotate_image

    cv2.putText(frame,
                "Compas",
                (2*a, 8*b),
                fontFace=cv2.FONT_HERSHEY_TRIPLEX,
                fontScale=1,
                color=kolor,
                thickness=2
                )
    cv2.putText(frame,
                str(compas),
                (2*a, 9*b),
                fontFace=cv2.FONT_HERSHEY_TRIPLEX,
                fontScale=1,
                color=kolor,
                thickness=2
                )
    return frame

def adddistance(frame, distance):
    a = round((width-0)/5)
    b = round((height-0)/10)
    kolor = (0, 0, 255)

    cv2.putText(frame,
                'Distance',
                (3*a, 8*b),
                fontFace=cv2.FONT_HERSHEY_TRIPLEX,
                fontScale=1,
                color=kolor,
                thickness=2
                )
    cv2.putText(frame,
                str(distance)+'m',
                (3*a, 9*b),
                fontFace=cv2.FONT_HERSHEY_TRIPLEX,
                fontScale=1,
                color=kolor,
                thickness=2
                )
    return frame

def addbateria(frame, bateria):
    a = round((width-0)/5)
    b = round((height-0)/10)
    kolor = (0, 255, 0)
    cv2.putText(frame,
                'Baterry',
                (4*a, 8*b),
                fontFace=cv2.FONT_HERSHEY_TRIPLEX,
                fontScale=1,
                color=kolor,
                thickness=2
                )
    cv2.putText(frame,
                str(bateria),
                (4*a, 9*b),
                fontFace=cv2.FONT_HERSHEY_TRIPLEX,
                fontScale=1,
                color=kolor,
                thickness=2
                )

    return frame

def slider_changed(event):
        value_label.configure(text=get_current_value())
        #uzyskanie wartości slider'a

def get_current_value():
        return '{: .2f}'.format(current_value.get())

def on_closing():
        if messagebox.askokcancel("Quit", "Do you want to quit?"):
            interface.destroy()

def rescaleFrame(frame, scale):
    global width
    global height
    width = int(frame.shape[1] * scale)
    height = int(frame.shape[0] * scale)

    dimensions = (width, height)

    return cv2.resize(frame, dimensions, interpolation=cv2.INTER_AREA)

def new_window():
    global vid
    global compascol
    global wysokosccol
    global bateriacol
    global excel_path
    global video_path
    global klatka
    a=0
    root = Toplevel()
    root.title("Tkinter + OpenCV")
    video = Label(root)
    video.pack(side=TOP)

    is_compas = IntVar(value=1)
    C1 = Checkbutton(root, font=myFont, text="Kompas", variable=is_compas, onvalue=1, offvalue=0)
    C1.pack(side=LEFT)
    is_distance = IntVar(value=1)
    C2 =Checkbutton(root, font=myFont, text="Wysokość", variable=is_distance, onvalue=1, offvalue=0)
    C2.pack(side=LEFT)
    is_bateria = IntVar(value=1)
    C3 = Checkbutton(root, font=myFont, text="Bateria", variable=is_bateria, onvalue=1, offvalue=0)
    C3.pack(side=LEFT)
    Q1 = Button(root, text="Quit", bg='#0052cc', fg='#ffffff', activebackground='#0052cc',
                     command=root.destroy)
    Q1.pack(side=RIGHT)
    ToolTip(Q1, msg="Return to settings")
    if (clicked.get() == "Video 1"):
        video1 = 1
        video2 = 0
    if (clicked.get() == "Video 2"):
        video1 = 0
        video2 = 1

    # Zczytywanie danych z excela
    excel = pd.read_csv(excel_path, sep=';', header=None)
    compascol = excel[21]
    wysokosccol = excel[8]
    bateriacol = excel[32]
    isvideo = excel[25]
    k = 1

    # Pętla do określenia numeru video, który ma być prezentowany
    while k < excel.shape[0]:
        if (isvideo[k] == '1') & (video1 == 1):
            break
        if (isvideo[k] == '1') & (video2 == 1):
            if (isvideo[k + 1] == '0'):
                a = 1
        if (isvideo[k + 1] == '1') & (video2 == 1) & a == 1:
            k = k + 1
            break
        k = k + 1
    def on_closing():
        if messagebox.askokcancel("Quit", "Do you want to quit?"):
            root.destroy()

    vid = cv2.VideoCapture(video_path)
    while vid.isOpened():
        ret, frame = vid.read()
        if ret == False:
            break
        frame_resized = rescaleFrame(frame, scale=current_value.get())
        compas, bateria, distance, k, frame_resized = obliczanie(klatka, k, frame_resized)
        if (is_compas.get() == 1):
            frame_resized = addcompass(frame_resized, compas)
        if (is_distance.get() == 1):
            frame_resized = adddistance(frame_resized, distance)
        if (is_bateria.get() == 1):
            frame_resized = addbateria(frame_resized, bateria)

        cv2image = cv2.cvtColor(frame_resized, cv2.COLOR_BGR2RGBA)
        img = Image.fromarray(cv2image)
        imgtk = ImageTk.PhotoImage(image=img)
        klatka = klatka + 1

        video.config(image=imgtk)
        root.protocol("WM_DELETE_WINDOW", on_closing)
        root.update()  # Updates the Tkinter window

    video_path = ''
    excel_path = ''
    vid.release()
    cv2.destroyAllWindows()

convertImage()
#Zwykły interface %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
interface = Tk()
# Ustawienia wyglądu
interface.title("Ustawienia")
interface.iconbitmap(r'panda_6DC_icon.ico')
interface.geometry("450x170")
global myFont
myFont = font.Font(family='Helvetica', size=10, weight='bold')
frame1 = Frame(interface)
frame1.config(background='red')
# Frame do wypisania sciezki video

global ent1
ent1 = Entry(interface, font=40)
ent1.config(width=35)
ent1.grid(row=1, column=3)
# Frame do wypisania sciezki excela

global ent2
ent2 = Entry(interface, font=10)
ent2.config(width=35)
ent2.grid(row=2, column=3)
# Przyciski do odczytania sciezek plików
button1 = Button(interface, text="Open Video", bg='#0052cc', fg='#ffffff', activebackground='#0052cc',
                 command=openfile1)
button1.grid(column=1, row=1)
button1['font'] = myFont
button2 = Button(interface, text="Open Excel", bg='#0052cc', fg='#ffffff', activebackground='#0052cc',
                 command=openfile2)
button2['font'] = myFont
button2.grid(column=1, row=2)

# Przycisk do wyboru numeru Video
global clicked
clicked = StringVar()
clicked.set('Video 1')
drop = OptionMenu(interface, clicked, "Video 1", "Video 2")
drop["menu"].config(bg="WHITE")
drop.config(bg='#0052cc', fg='#ffffff', activebackground='#0052cc')
drop['font'] = myFont
drop.grid(row=3, column=1)
ToolTip(drop, msg="Choose the index of Video")
# Slider do wyboru skali
# slider current value
global current_value
current_value = tk.DoubleVar(value=0.25)

#SLIDER
slider_label = ttk.Label(interface)

slider_label.grid(column=2, row=0,)

slider = ttk.Scale(interface, value=0.5, from_=0, to=1, orient='horizontal', command=slider_changed,
                   variable=current_value)

slider.grid(column=3, row=5, sticky='we')

current_value_label = ttk.Label(interface, font=myFont, text='Scale of Video 1 = 4k')

current_value_label.grid(row=3, columnspan=5, sticky='n')

value_label = ttk.Label(interface, font=myFont,text=get_current_value())

value_label.grid(row=4, columnspan=5, sticky='n')

#closing message
interface.protocol("WM_DELETE_WINDOW", on_closing)
# Przycisk do rozpoczecia programu
start_button = Button(interface, text="Start", bg='#0052cc', fg='#ffffff', activebackground='#0052cc',
                          command=new_window)
start_button.grid(column=1, row=5)
start_button['font'] = myFont
ToolTip(start_button, msg="Start the show")
interface.mainloop()
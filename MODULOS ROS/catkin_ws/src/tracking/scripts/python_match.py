#!/usr/bin/env python
from sklearn.cluster import MeanShift, estimate_bandwidth
import numpy as np
import cv2
import rospy
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import Float32
from sensor_msgs.msg import CompressedImage

#|---------------------------------------------------|#
def conversion_matriz():
    #|---- local var ----|#
    file = r_archivo("/home/robotica/catkin_ws/src/tracking/recursos/Descriptores/Botella.txt")
    #file = r_archivo("./recursos/Descriptores/Botella.txt")
    file2 = r_archivo("/home/robotica/catkin_ws/src/tracking/recursos/Descriptores/NoBotella.txt")
    #file2 = r_archivo("../recursos/Descriptores/NoBotella.txt")
    trainData = []
    responses = []
    #|---- construct data ----|#
    for i in file:
        for j in i:
            trainData.append(j)
            responses.append(0)
            
    for i in file2:
        for j in i:
            trainData.append(j)
            responses.append(1)
    #|---- format ----|#
    trainData = np.array(trainData).astype(np.float32)
    responses = np.array(responses).astype(np.float32)
    #print("|--- Saliendo conversion_matriz ---|")
    return trainData, responses

def w_archivo(cl, k):
    reducido = reducir(cl[5],50)
    file = open("Prueba.txt", "a")
    file.write('\nCl'+str(k)+'_Pt'+str(cl[4])+'_'+'.jpg')
    for i in reducido:
        file.write('\n'+str(i))
    file.write('\nfin-cluster')
    #cv2.imwrite('Cl'+str(k)+'_Pt'+str(cl[4])+"_"+str(j)+'.jpg', img2)
    file.close()
    #print("|--- Saliendo w_archivo ---|")
    return
def r_archivo(path):
    arrayMaster = []
    #|--- parseo ---|#
    with open(path) as openfileobject:
        for line in openfileobject:
            if(".jpg" in line):
                arrayCLuster = []
                continue;
            if("[" in line):
                numberArray =[]
                number = ""
                numberInt = 0;
                for vector in line:
                    if(vector == '['):
                        continue;
                    if(vector.isdigit()==True):
                        number=number+vector;
                    if(vector ==' '):
                        if(number!=""):
                            numberInt = int(number)
                            numberArray.append(numberInt);
                            number=""
                    if(vector==']'):
                        if(number!=""):
                            numberInt = int(number)
                            numberArray.append(numberInt);
                            number=""
                arrayCLuster.append(numberArray)
            if("fin-cluster" in line):
                arrayCLuster.append(numberArray)
                arrayMaster.append(arrayCLuster)
    #print("|--- Saliendo r_archivo ---|")
    return arrayMaster

def seleccionar_object(objeto,img):
    if len(objeto) == 0:
        #print("No existen objetos.")
        #print("|---- saliendo seleccionar_object ----|")
        return img, objeto
    #|---- local var ----|#
    botella = cv2.imread("/home/cesar/catkin_ws/src/tracking/recursos/Imagenes-Objeto/Botella/img5.png")
    hist_botella = []
    res_hist = []
    #|---- Diff Histogram ----|#
    for channel in range(3):
        hist2 = cv2.calcHist([botella], [channel], None, [256], [0, 256])
        cv2.normalize(hist2, hist2, alpha=0, beta=1, norm_type=cv2.NORM_MINMAX)
        hist_botella.append(hist2)
    
    for j in objeto:
        #|---- var de ciclo ----|#
        hist_frame = []
        #|---- crop img ----|#
        img2 = roi(j,img.copy())
        img2 = cv2.cvtColor(img2, cv2.COLOR_GRAY2BGR)
        #|----  ----|#
        for channel in range(3):
            hist = cv2.calcHist([img2],[channel], None, [256], [0, 256])
            cv2.normalize(hist, hist, alpha=0, beta=1, norm_type=cv2.NORM_MINMAX)
            hist_frame.append(hist)
            
        for k,i in enumerate(hist_frame,0):
            res_hist.append(cv2.compareHist(hist_botella[k], i, cv2.HISTCMP_CORREL))
    #|---- hitograma mas parecido ----|#
    R,G,B = 0,0,0
    control,position = 0,0
    for k,i in enumerate(objeto,0):
        comp_hist1, comp_hist2 = 0,0
        #||#
        if R < res_hist[control]:
            comp_hist2 = comp_hist2+1
        else:
            comp_hist1 = comp_hist1+1
            
        if G < res_hist[(control+1)]:
            comp_hist2 = comp_hist2+1
        else:
            comp_hist1 = comp_hist1+1
            
        if B < res_hist[(control+2)]:
            comp_hist2 = comp_hist2+1
        else:
            comp_hist1 = comp_hist1+1
        #||#
        if comp_hist1 < comp_hist2:
            R,G,B = res_hist[control],res_hist[control+1],res_hist[control+2]
            position = k
        control = control+3
    #|---------------------------------|#
    cl = objeto[position]
    img2 = roi(cl,img.copy())
    #print("|---- saliendo seleccionar_object ----|")
    return img2, cl

def entrenar_knn(trainData,responses):
    #|------------------------------------------------|#
    knn = cv2.ml.KNearest_create()
    knn.train(trainData, cv2.ml.ROW_SAMPLE, responses)
    #print("|--- Saliendo entrenar_knn ---|")
    return knn

def clasificar(des, knn):
    newcomer = reducir(des,50) 
    #newcomer.append([107, 249, 16, 90, 121, 157, 82, 252, 139, 121, 52, 12, 174, 217, 78, 180, 133, 91, 215, 92, 199, 106, 250, 245, 191, 221, 21, 123, 90, 14, 139, 159])
    newcomer = np.array(newcomer).astype(np.float32)
    cero,uno = 0,0
    #|------------------------------------------------|#
    #print(len(newcomer),newcomer.dtype)
    ret, results, neighbours, dist = knn.findNearest(newcomer, 30)
    #|---- iteracion de respuestas ----|#
    for i in results:
        if i == 0:
            cero = cero +1
        if i == 1:
            uno = uno+1
    #print("|--- Saliendo clasificar ---|")
    if uno > cero:
        return 1
    else:
        return 0

def cargar_carac(path,orb):
    i = 0
    points = []
    descript = []
    imgs = []
    while(True):
        path1 = path+str(i)+".jpg"
        i= i+1
        img = cv2.imread(path1)
        if img is None:
            #print("carga finalizada.")
            break
        img = re_size(img,0.1)
        img = pro_img(img)
        kp, des = orb.detectAndCompute(img, None)
        imgs.append(img)
        points.append(kp)
        descript.append(des)
    #print("|--- Saliendo carga_caract ---|")
    return imgs, points, descript

def reducir(des,min):
    ratio = int(len(des)/min)
    control = 0
    new_des = []
    for i in range(min):
        new_des.append(des[control])
        control = control + ratio
    #print("|--- Saliendo reducir ---|")
    return new_des

def feature_img(img, orb):
    kp1, des1 = orb.detectAndCompute(img, None)
    pts = np.array([kp1[idx].pt for idx in range(0, len(kp1))]).astype(int)
    #print("|--- Saliendo f_match ---|")

    return img, pts, des1

def pro_img(img):
    #|----------------------------------------------------|#
    kernel2 = np.array([[-1,-1,-1], [-1,9,-1], [-1,-1,-1]])
    #|----------------------------------------------------|#
    img = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
    img = cv2.equalizeHist(img)
    img2 = cv2.filter2D(img, 0, kernel2)
    img = cv2.addWeighted(img, 0.7, img2, 0.3, 0)
    #|----------------------------------------------------|#
    #print("|--- pro_img ---|")
    return img

def re_size(img,proporcion):
    alto, ancho, _ = img.shape
    #|---------------------------------|#
    alto = int(alto*proporcion)
    ancho = int(ancho*proporcion)
    #|---------------------------------|#
    #print("|--- re_size ---|")
    return cv2.resize(img,(ancho,alto))

def n_blobs(points, desc, ms, img, knn):
    #|--- Meanshif var ---|#
    bandwidth = estimate_bandwidth(points, quantile=0.1, n_samples=500)
    ms = MeanShift(bandwidth = bandwidth, bin_seeding=True)
    ms.fit(points)
    labels = ms.labels_
    cluster_center = ms.cluster_centers_
    #labels_unique = np.unique(labels)
    #n_clusters_ = len(labels_unique)
    #|--- local var ---|#
    cl, objeto = [], []
    #|---------------------------------------|#
    for k, c in enumerate(cluster_center, 0):
        #punto = (int(c[0]),int(c[1]))
        cl = roi_section(k, points, desc, labels)
        if cl[4] > 50:
            result = clasificar(cl[5],knn)
            #|--- Guardar descriptores ---|#
            #w_archivo(cl, k)
        if result == 0:
            objeto.append(cl)
        #else:
            #print("Puntos insuficientes: ",cl[4]) 
            
    img2, wd = seleccionar_object(objeto, img)
    #|----------------------------------------|#
    #cv2.imshow("Coca-Cola2",img2)
    #cv2.waitKey(1000)
    #print("|---- frame ----|")   
    return img2, wd

def roi(objeto,img2):
    w = objeto[1] - objeto[0]
    h = objeto[3] - objeto[2]
    if w < 15: w = 15
    if h < 15: h = 15
    img2 = img2[objeto[2]:objeto[2]+h,objeto[0]:objeto[0]+w]
    return img2

def roi_section(n_cluster, points, desc, labels):
    min_x,  max_x = 1000, 0
    min_y, max_y = 1000, 0
    size = 0
    text_desc = []    
    #|--------------------------------------------|#
    for i in labels:
        if i == n_cluster:
            c = indices(labels.tolist(), i)
            pt = points[c[size]]
            des = desc[c[size]]
            text_desc.append(des)
            #|------|#
            if min_x > pt[0]:
                min_x = pt[0]

            if max_x < pt[0]:
                max_x = pt[0]

            if min_y > pt[1]:
                min_y = pt[1]

            if max_y < pt[1]:
                max_y = pt[1]
            #|------|#
            size = size+1
    #|---------------------------------------------|#
    cl = [min_x, max_x, min_y, max_y, size, text_desc]
    #print("|--- Saliendo roi_section ---|")
    return cl

def indices( lista, value):
    return [i for i,x in enumerate(lista) if x==value]

def seguimiento(frame, roi_hist, track_window, term_crit ):
    #|--- Convert format color to HSV ---|#
    know_img = frame.shape
    if len(know_img) == 2:
        frame = cv2.cvtColor(frame, cv2.COLOR_GRAY2BGR)
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    #|--- Calculate backprojection ---|#
    dst = cv2.calcBackProject([hsv],[0,1],roi_hist,[160,170,0,256],1)
    kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5,5))
    dst = cv2.filter2D(dst, -1, kernel)
    #_, dst = cv2.threshold(dst, 30, 255, cv2.THRESH_BINARY)
    #|--- Calculate a new location ---|#
    ret, track_window = cv2.meanShift(dst, track_window, term_crit)
    #|--- Draw a new region ---|#
    x, y, w, h = track_window
    frame2 = cv2.rectangle(frame, (x,y), (x+w,y+h), 255,2)
    return frame2, track_window

def preparar_track(roi, cl):
    kernel2 = np.array([[-1,-1,-1], [-1,9,-1], [-1,-1,-1]])
    img2 = cv2.filter2D(roi, 0, kernel2)
    roi = cv2.addWeighted(roi, 0.5, img2, 0.5, 0)
    #|--- Make a point window ---|#
    x, y, w, h = cl[0], cl[2], (cl[1] - cl[0]), (cl[3] - cl[2])
    track_window = (x, y, w, h)
    #|--- Conver format color in HSV ---|#
    know_img = roi.shape
    if len(know_img) == 2:
        roi = cv2.cvtColor(roi, cv2.COLOR_GRAY2BGR)
    hsv_roi =  cv2.cvtColor(roi, cv2.COLOR_BGR2HSV)
    hsv_roi = roi[y:y+h,x:x+w]
    #|--- Make a mask ---|#
    mask = cv2.inRange(hsv_roi, np.array((0., 60.,32.)), np.array((180.,255.,255.)))
    roi_hist = cv2.calcHist([hsv_roi], [0, 1], mask, [180,256], [0,180,0,256])
    cv2.normalize(roi_hist, roi_hist, 0, 255, cv2.NORM_MINMAX)
    #|--- Establecer condiciones de paro|#
    term_crit = ( cv2.TERM_CRITERIA_EPS | cv2.TERM_CRITERIA_COUNT, 10, 1 )
    
    return track_window, roi_hist, term_crit

#|--------------------------------------------------- ROS ---------------------------------------------------|#
def callback(data,args):
	np_arr = np.fromstring(data.data, np.uint8)
	img_np = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)

	args[3], args[4], args[5], args[6] = main_code(img_np, args[0], args[1], args[2], args[3], args[4], args[5], args[6])
	
	talker(15)

def listener(knn, orb, ms, track_window, roi_hist, term_crit, control):
	rospy.init_node('imagen', anonymous=True)
	try:
		rospy.Subscriber("/usb_cam/image_raw/compressed", CompressedImage, callback, [knn, orb, ms, track_window, roi_hist, term_crit, control])
	except:
		print("Error al sucribirse a USB_cam.")

def talker(dist):
	#rospy.init_node('talker', anonymous=True)
	pub = rospy.Publisher('distancia', Float32, queue_size=1)
	rate = rospy.Rate(10) # 10hz
	if not rospy.is_shutdown():
		print(dist)
		pub.publish(dist)#|-- Publicar informacion relevante. --|#
		rate.sleep()
	print("Publicando distancia al nodo.")
#|--------------------------------------------------- main ----------------------------------------------------|#
def main_code(frame, knn, orb, ms, track_window, roi_hist, term_crit, control):
	#|-----------------------------------------------|
	img = pro_img(frame.copy())

	if control == True:
		#|---- ROI and points ----|#
		img, pts, desc = feature_img(img, orb)
		img, cl = n_blobs(pts, desc, ms, img, knn)
		track_window, roi_hist, term_crit = preparar_track(img,cl)
		control = False
		print("Primera vuelta.")
	print("Tracking")
	track_img, track_window = seguimiento(frame.copy(), roi_hist, track_window, term_crit)
	cv2.imshow("img final",track_img)
	cv2.waitKey(1)
	
	return track_window, roi_hist, term_crit, control
#|--------------------------------------------------- Inicio ---------------------------------------------------|#
if __name__ == '__main__':
	#|--------------- pre-procesamiento ---------------|#
	trainData, responses = conversion_matriz()	
	knn = entrenar_knn(trainData, responses)
	orb = cv2.ORB_create()
	ms = MeanShift()
	#|----------------------------------------------|#
	track_window, roi_hist, term_crit, control = (), 0, 0, True
	#|-----------------------------------|#
	listener(knn, orb, ms, track_window, roi_hist, term_crit, control)
	try:
        	rospy.spin()
    	except KeyboardInterrupt:
        	print "Shutting down ROS Image."
    	cv2.destroyAllWindows()
	print("|--- Fin ---|")

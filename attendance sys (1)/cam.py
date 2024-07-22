import cv2


def capture_image(image_path):
    
    cap = cv2.VideoCapture(0)

    if not cap.isOpened():
        print("Error: Could not open camera")
        return
    

    ret, frame = cap.read()
    
    cap.release()
    

    cv2.imwrite(image_path, frame)


image_path = 'captured_image.jpg'


capture_image(image_path)

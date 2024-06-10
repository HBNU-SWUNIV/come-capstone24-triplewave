import cv2
from ultralytics import YOLO
import easyocr


model_weight = "/Users/dongheon/ultralytics/ocr_model/best (1).pt"

# Load pre-trained model
model = YOLO(model_weight)
reader = easyocr.Reader(['ko','en']) # this needs to run only once to load the model into memory

# Open the video file
video_path = 0
cap = cv2.VideoCapture(video_path)

# Loop through the video frames
while cap.isOpened():
    # Read a frame from the video
    success, frame = cap.read()

    if success:
        # Run YOLOv8 tracking on the frame, persisting tracks between frames
        results = model.track(frame, persist=True)
        
        # Visualize the results on the frame
        annotated_frame = results[0].plot()

        # Display the annotated frame
        cv2.imshow("YOLOv8 Tracking", annotated_frame)

        # View results
        for r in results:
            for box in r.boxes:
                # Get box coordinates in (left, top, right, bottom) format
                x1, y1, x2, y2 = box.xyxy[0]
                
                # Convert coordinates to integers
                x1, y1, x2, y2 = int(x1), int(y1), int(x2), int(y2)
                
                # Crop the bounding box region from the frame
                cropped_object = frame[y1:y2, x1:x2]
                result = reader.readtext(cropped_object, detail = 0)
                print(result)
                
                # Plot the cropped object
                cv2.imshow("Cropped Object", cropped_object)
                cv2.waitKey(0)  # Wait until a key is pressed
        
        # Break the loop if 'q' is pressed
        if cv2.waitKey(1) & 0xFF == ord("q"):
            break
    else:
        # Break the loop if the end of the video is reached
        break

# Release the video capture object and close the display window
cap.release()
cv2.destroyAllWindows()

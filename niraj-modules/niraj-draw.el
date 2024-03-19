;; Program design considerations
;; Interactive way to create drawings
;;  1. DONE An interactive command to invoke drawings functions
;;  2. DONE way to interactively enter name and caption of image in minibuffer
;;  3. DONE when pressed return should open "Write" in side window with the already
;;     set image name with location of image already defined by function 
;;  4. when drawing is complete and write is closed. drawing should open in svg
;;     for cropping and placing
;;  5. DONE should automatically insert code to insert picture in place.


(defun niraj/full-img-name(img-name)
"an helper function that generates absolute path with provided img-name
 assumes that images files of orgfiles are stored in ./img/"
  (concat (file-name-directory buffer-file-name) "img/" img-name ".svg"))

(defun niraj/get-input()
  "interactive function that reads image name and image caption from
  mini buffer and calculate required absolute path , then it insert its link in org
  file along with the caption and then calls inkscape using that absolute path"
  (interactive)
  (let* ((img-name (read-from-minibuffer "Enter image name: ")) ; get img-name from user
        (img-caption (read-from-minibuffer "Enter caption: ")) ; get img-caption from user
	(abs-img (niraj/full-img-name img-name))
	;; DONE create a sample svg file using write with standard format
	;; copy this svg file in the required location and rename accordingly
	;; then call Write to open 
	(program-loc "/home/niraj/software/Write/Write")
	(sample-file "/home/niraj/software/Write/sample.svg"))

        ;; copy sample file  to desired locations
        (call-process-shell-command (concat "cp " sample-file " "  abs-img  ))
	;; open up the file using Write saved by program-loc
	(call-process-shell-command (concat program-loc " " abs-img) )
	;; trim the svg to remove blank spaces by imagemagick  
	;; (call-process-shell-command (concat "convert " abs-img " -trim " abs-img))
	(call-process-shell-command (concat "convert " abs-img (concat (file-name-sans-extension abs-img) ".png" ) ) )
        (insert (concat "#+CAPTION: " img-caption "\n" )) ; insert caption
	(insert (concat "[[./img/" img-name ".svg" "]]" )) ; insert img
	))

(provide 'niraj-draw)

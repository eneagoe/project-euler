(defn factor [current_number current_factor]
  (if (= current_number current_factor)
  current_number
  (if (zero? (mod current_number current_factor))
    (factor (/ current_number current_factor) current_factor)
    (factor current_number (inc current_factor)))))